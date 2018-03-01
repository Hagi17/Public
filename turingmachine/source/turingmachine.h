///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 28.02.18
/// 
/// Turing Machine class
///

#ifndef _TURINGMACHINE_H_
#define _TURINGMACHINE_H_

#include <vector>
#include <deque>
#include <string>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <cstdio>

#ifdef __WIN32__
  #include <windows.h>
#else
  #include <unistd.h>
#endif

#include "state.h"
#include "transition.h"
#include "support.h"
#include "tape.h"

using namespace std;

typedef enum
{
  Halt = 0,
  Accepted = 1,
  Error,
  Warning,
  BreakPoint,
  Running
} RunningState;

class TuringMachine
{
  public:
    int WarningStateCount = 25000;
    int sleepTimeInMicroSeconds = 250000;
    int sleepTimeInMilliSeconds = 250;
    
    TuringMachine()
    {
      mTape = new Tape();
      mShowProcess = false;
      mCurrentState = 0;
      mStartState = 0;
      knownStates.clear();
      includedDirectories.clear();
      mInternalClear = -1;
      mInternalRead = -1;
      mInternalWrite = -1;
      mInternalGoLeft = -1;
      mInternalGoRight = -1;
      mInternalSetAsterix = -1;
      mInternalCopy = -1;
      mInternalParse = -1;
      mInternalStdin = -1;
      mInternalStdout = -1;
      mState = Halt;
    }   
    ~TuringMachine()
    {
      delete mTape;
      while(!mStates.empty())
      {
        delete mStates.back();
        mStates.pop_back();
      }
    }
    
    void addIncludeFolder(string path)
    {
      includedDirectories.push_back(path);
    }
    
    void loadExtension()
    {
      if(mInternalClear != -1) return;
      mInternalClear = addState("internal/clear");
      mInternalRead = addState("internal/read");
      mInternalWrite = addState("internal/write");
      mInternalGoLeft = addState("internal/goLeft");
      mInternalGoRight = addState("internal/goRight");
      mInternalSetAsterix = addState("internal/setAsterix");
      mInternalCopy = addState("internal/copy");
      mInternalParse = addState("internal/parse");
      mInternalStdin = addState("internal/stdin");
      mInternalStdout = addState("internal/stdout");
    }
    
    bool loadProgram(string programFile, 
      ErrorInfo& onError)
    {
      return loadFile(programFile, "", true, onError);
    }
    bool start(ostream& logConsole)
    {
      resetState();
      resetHead();
      return run(logConsole);
    }
    bool run(ostream& logConsole)
    {
      bool result = true;
      mState = Running;
      int counter = 0;
      if(mShowProcess) logConsole << printTape();
      while(!isAccepted(mCurrentState) && isState(mCurrentState))
      {
        counter++;
        if(counter > WarningStateCount) 
        {
          mState = Warning;
          return result;
        }
        char read = mTape->read();
        operateExtension(read);
        char write = EMPTY;
        bool breakPoint = false;
        int move = 0;
        result = mStates[mCurrentState]->operate(read, write, 
          mCurrentState, move, breakPoint);
        if(!result) 
        {
          mState = Halt;
          break;
        }
        mTape->write(write);
        showProcess(logConsole);
        mTape->moveHead(move);
        showProcess(logConsole);
        if(breakPoint)
        {
          mState = BreakPoint;
          break;
        }
      }
      if(isAccepted(mCurrentState)) mState = Accepted;
      if(mShowProcess) logConsole << '\r';
      return (result && isAccepted(mCurrentState));
    }
    void setShowProcess(bool showProcess)
    {
      mShowProcess = showProcess;
    }
    
    void setPrintTapeFieldCount(int count)
    {
      mTape->setPrintTapeFieldCount(count);
    }
    void loadInput(string input)
    {
      mTape->loadInput(input);
    }
    void loadHexInput(string file)
    {
      mTape->loadHexInput(file);
    }
    void resetHead()
    {
      mTape->resetHead();
    }
    
    void resetState()
    {
      mCurrentState = mStartState;
    }
    
    string printTape()
    {
      return mTape->printTape();
    }
    string printTape(int sizeOfFields)
    {
      return mTape->printTape(sizeOfFields);
    }
    
    string getCurrentState()
    {
      if(!isState(mCurrentState)) return "";
      return mStates[mCurrentState]->getName();
    }  
    
    void saveTape(string path, string input)
    {
      mTape->saveTape(path, input);
    }
    void setStdIn(string inFile)
    {
      mStdInFile = inFile;
    }
    void setStdOut(string outFile)
    {
      mStdOutFile = outFile;
    }
    RunningState machineState()
    {
      return mState;
    }
  
    string getHeadComment()
    {
      return mHeadComment;
    }
  private:
    bool mShowProcess;
    int mCurrentState;
    
    int mStartState;
    char mTmpCopied;
    
    int mInternalClear;
    int mInternalRead;
    int mInternalWrite;
    int mInternalGoLeft;
    int mInternalGoRight;
    int mInternalSetAsterix;
    int mInternalCopy;
    int mInternalParse;
    int mInternalStdin;
    int mInternalStdout;
    
    string mHeadComment;
    string mStdInFile;
    string mStdOutFile;
    const string mTempFile = "tmp.txt";
    
    RunningState mState;
    
    Tape* mTape;
    
    vector<int> mAcceptedStates;
    vector<State*> mStates;
    vector<string> knownStates;
    vector<string> includedDirectories;
    
    void operateExtension(char& read)
    {
      int intF = mStates[mCurrentState]->InternalFunction(read);
      if(mCurrentState == mInternalClear || intF == mInternalClear)
        mTape->clear();
      if(mCurrentState == mInternalRead || intF == mInternalRead)
        mTape->readFile();
      if(mCurrentState == mInternalWrite || intF == mInternalWrite)
        mTape->writeFile();
      if(mCurrentState == mInternalGoLeft || intF == mInternalGoLeft)
        mTape->resetHead();
      if(mCurrentState == mInternalGoRight || intF == mInternalGoRight)
        mTape->setHeadAtEnd();
      if(mCurrentState == mInternalSetAsterix || intF == mInternalSetAsterix)
        mTape->forceWrite('*');
      if(mCurrentState == mInternalCopy || intF == mInternalCopy)
        mTmpCopied = mTape->read();
      if(mCurrentState == mInternalParse || intF == mInternalParse)
        mTape->forceWrite(mTmpCopied);
      if(mCurrentState == mInternalStdin || intF == mInternalStdin)
      {
        ifstream file(mStdInFile);
        ofstream tFile(mTempFile);
        char chIn = 0;
        if(file.is_open())
        {
          if(file.get(chIn))
          {
            mTape->forceWrite(chIn);
            read = chIn;
            
          }
          if(tFile.is_open())
          {
              string line;
              while(getline(file, line))
              {
                tFile << line;
                tFile << endl;
              }
              tFile.close();
              file.close();
              std::rename(mTempFile.c_str(), mStdInFile.c_str());
          }
          else
            file.close();
        }
        else if(tFile.is_open()) 
        {
          tFile.close();
          std::remove(mTempFile.c_str());
        }
      }
      if(mCurrentState == mInternalStdout || intF == mInternalStdout)
      {
        ofstream file(mStdOutFile, ofstream::app);
        if(file.is_open())
        {
          file.put(read);
        }
        file.close();
      }
    }
    
    void showProcess(ostream& logConsole)
    {
      if(!mShowProcess) return;
      logConsole << '\r' << printTape();
      logConsole << " (" << mStates[mCurrentState]->getName() << ")          ";
      fflush(stdout);
#ifdef __WIN32__
      Sleep(sleepTimeInMilliSeconds);
#else
      usleep(sleepTimeInMicroSeconds);
#endif 
    }
    
    bool loadFile(string path, string prefix, bool primary, 
      ErrorInfo& onError, bool newPrefix = false, char templ = EMPTY, unsigned long templNr = 1)
    {
      bool result = true;
      bool nonCommentLine = false;
      onError.lineno = -1; // for error messages
      onError.file = path;
      string name = path;
      string line;
      vector<string> includeFiles;
      vector<string> importPrefixes;
      vector<char> templateChar;
      vector<unsigned long> templateNr;
      string folder = stringsup::getFolderPath(path);
      
      //check if this file exists in any of the included Directorys
      stringsup::testFilePaths(path, includedDirectories);
      
      ifstream prg (path);
      if(prg.is_open())
      {
        //check if it contains it?
        includedDirectories.push_back(folder);
        onError.lineno = 0;
        
        while(getline(prg, line))
        {
          onError.lineno++;
          stringsup::trim(line);
          if(line.empty())
            continue;
          string five = line.substr(0, 5);
          if(line[0] == '/' && line[1] == '/')//line.substr(0,2).compare("//") == 0)//Kommentar
          {
            if(primary && !nonCommentLine)
              mHeadComment += line.substr(2) + "\n";
            continue;
          }
          nonCommentLine = true;
          if(five == "name:")
          {
            name = line.substr(5);
            stringsup::ltrim(name);
            continue;
          }
          if(five == "init:")
          {
            if(!primary) continue;
            string statename = line.substr(5);
            stringsup::ltrim(statename);
            mStartState = addState(statename);
            continue;
          }
          if(line.substr(0, 7) == "accept:")
          {//set accepted states
            if(!primary) continue;
            string states = line.substr(7);
            stringsup::ltrim(states);
            vector<string> stateList {stringsup::explode(states, ',')};
            for(auto tmpState:stateList)
              mAcceptedStates.push_back(addState(tmpState));
            continue;
          }
          if(line.substr(0, 9) == "#include ")
          {//sub tm   #include <> (AS prefix(templ,nr))
            string includeFile = line.substr(9);
            result = parseInclude(line.substr(9), prefix, includeFiles,
                importPrefixes, templateChar, templateNr, templ, templNr);
            if(!result) break;
            else continue;
          }
          result = parseTransition(line, name, prefix, primary, newPrefix,
            templ, templNr);
          if(!result) 
          {
            onError.file += " (s,*,*,-,s) occured ";
            break;
          }
        }
        prg.close();
      }
      else
        return false;
      
      if(!result) return result;
      
      unsigned int index = 0;
      for(index = 0; index < includeFiles.size(); index++)
      {
        string iPrefix = importPrefixes[index];
#ifdef ADVANCED_OUTPUT
        cout<<"loading "<<includeFiles[index]<<" as "<<iPrefix<<"("<<templateChar[index]<<")"<<endl;
#endif
        result = loadFile(includeFiles[index], iPrefix, 
          false, onError, (prefix != iPrefix), templateChar[index], templateNr[index]);
        if(!result) break;
      }
      return result;
    }
    
    bool parseInclude(string cntnt, string prefix,vector<string>& includeFiles,
      vector<string>& importPrefixes, vector<char>& templateChar, vector<unsigned long>& templateNr, char tmplChar, unsigned long tmplNr)
    {//line without #include
      string incPrefix = prefix;
      char templChar = EMPTY;
      unsigned long templNr = 1;
      //check for AS
      auto findex = cntnt.find(" AS ");
      if(findex != string::npos)
      {
        string usingprefix = cntnt.substr(findex+4);
        
        //check for template
        auto tcind = usingprefix.find('(');
        if(tcind != string::npos)
        {
          string templStr = usingprefix.substr(tcind+1);
          usingprefix = usingprefix.substr(0, tcind);
          tcind = templStr.find(')');
          if(tcind != string::npos) templStr = templStr.substr(0, tcind);
          //split
          tcind = templStr.find(',');
          if(tcind != string::npos)
          {
            string tmpNrStr = templStr.substr(tcind+1);
            templStr = templStr.substr(0,tcind);
            stringsup::trim(tmpNrStr);
            if(tmpNrStr == "%nr%") templNr = tmplNr;
            else 
            {
              try
              {
                templNr = stoul(tmpNrStr, NULL, 10);
              }
              catch(...)
              {
              }
            }
          }
          stringsup::trim(templStr);
          if(templStr == "%tmpl%") templChar = tmplChar;
          else templChar = templStr.front();
        }
        
        stringsup::trim(usingprefix);
        cntnt = cntnt.substr(0, findex);
        stringsup::trim(cntnt);
        if(incPrefix.length() > 0)
          incPrefix = incPrefix + "/" + usingprefix;
        else incPrefix = usingprefix;
      }
      else stringsup::ltrim(cntnt);
      
      if(cntnt == "INTERNAL")
        loadExtension();
      else if(cntnt.front() == '"' && cntnt.back() == '"')
      {
        includeFiles.push_back(
          cntnt.substr(1, cntnt.size() - 2));
        importPrefixes.push_back(incPrefix);
        templateChar.push_back(templChar);
        templateNr.push_back(templNr);
      }
      else if(cntnt.front() != '"' && cntnt.back() != '"')
      {
        includeFiles.push_back(cntnt);
        importPrefixes.push_back(incPrefix);
        templateChar.push_back(templChar);
        templateNr.push_back(templNr);
      }
      else 
        return false;
      return true;
    }
    
    bool parseTransition(string tupel, string prefix, string importPrefix, 
      bool primary, bool newPrefix, char templateChar, unsigned long templateSteps)
    {
      int curStateNo = -1;
      int newStateNo = -1;
      int internStateNo = -2;
      unsigned long steps = 1;
      stringsup::replace(tupel, ",,",",comma");
      vector<string> parts {stringsup::explode(tupel, ',')};
      if(parts.size() < 5) return false;
      bool breakPoint = false;
      bool ignoreCase = false;
      if(parts.size() > 5)
      {//set internal, set correct newstate
        internStateNo = addState(parts[4]);
        parts[4] = parts[5];
      }
      if(parts[4].back() == '!')
      {
        breakPoint = true;
        parts[4] = parts[4].substr(0, parts[4].length() - 1);
      }
      string curState = parts[0];
      string newState = parts[4];
      curStateNo = prepareState(curState, prefix, importPrefix, primary, 
        newPrefix);
      newStateNo = prepareState(newState, prefix, importPrefix, primary, 
        newPrefix);
      if(parts[1] == "comma") parts[1] = ',';
      if(parts[2] == "comma") parts[2] = ',';
      if((ignoreCase = (parts[1].substr(0, 2) == "ic")))
        parts[1] = parts[1].substr(2);
      if(parts[1] == "%tmpl%") parts[1] = templateChar;
      if(parts[2] == "%tmpl%") parts[2] = templateChar;
      if(parts[1][0] == '0' && parts[1][1] == 'x') 
        parts[1] = (char)stoul(parts[1], NULL, 16);
      if(parts[2][0] == '0' && parts[2][1] == 'x') 
        parts[2] = (char)stoul(parts[2], NULL, 16);
      if(parts[3].size() != 1)
      {//number of moves
        if(parts[3].size() == 2 && parts[3][1] == '%')
          steps = templateSteps;
        else
        {
          try
          {
            steps = stoul(parts[3].substr(1),NULL,10);
          }
          catch(...)
          {
            return false;
          }
        }
      }
      if(parts[1].size() != 1 || parts[2].size() != 1) return false;
      if(parts[1][0] == WILDCARD && parts[2][0] == WILDCARD && 
        parts[3][0] == NO_MOVE && curState == newState) return false;
    // this would lead to a endless loop (same state, no movement, take all)
      auto* way = new Transition((parts[1])[0],(parts[2])[0],
        (parts[3])[0],steps,newStateNo, curStateNo, breakPoint, internStateNo, 
        ignoreCase);
      if(way->moveChar() != (parts[3])[0])
      {
        delete way;
        return false;
      }
      mStates[curStateNo]->addTransition(way);
      return true;
    }
    
    int prepareState(string state, string prefix, string importPrefix, 
      bool primary, bool newPrefix)
    {
      if(state.empty()) return -1;//fehler, kein state ohne namen
      if(state[0] == '!') //indicate fix state name
      {
        state = state.substr(1);
        return addState(state);
      }
      if(primary) return addState(state);
      auto result = state.find('/');
      bool subTmCall = (result != string::npos);
      bool ip = (importPrefix.length() > 0);
      bool p = (prefix.length() > 0);
      if(subTmCall && ip)
        state = importPrefix + "/" + state;
      else if(!subTmCall)
      {
        if(!newPrefix && p) state = prefix+"/"+state;
        if(ip) state = importPrefix + "/" + state;
      }
      
      return addState(state);
    }
    
    int addState(string name)
    {
      auto result = find(knownStates.rbegin(), knownStates.rend(), name);
      if(result == knownStates.rend())
      {
        knownStates.push_back(name);
        mStates.push_back(new State(name));
        return knownStates.size() - 1;
      }
      else return (knownStates.rend() - result - 1);
    }

    bool isState(int state)
    {
      return (state >= 0 && state < (int)mStates.size());
    }
    bool isAccepted(int state)
    {
      return find(mAcceptedStates.begin(), mAcceptedStates.end(), state) 
        != mAcceptedStates.end();
    }
    
};

#endif