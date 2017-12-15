///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 15.12.17
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
    }   
    ~TuringMachine()
    {
      delete mTape;
      while(mStates.size() > 0)
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
    }
    
    bool loadProgram(string programFile, 
      ErrorInfo& onError)
    {
      return loadFile(programFile, true, onError);
    }
    bool start(ostream& logConsole, bool& warning)
    {
      resetState();
      resetHead();
      return run(logConsole, warning);
    }
    bool run(ostream& logConsole, bool& warning)
    {
      bool result = true;
      warning = false;
      int counter = 0;
      if(mShowProcess) logConsole << printTape();
      while(!isAccepted(mCurrentState) && isState(mCurrentState))
      {
        counter++;
        if(counter > WarningStateCount) 
        {
          warning = true;
          return result;
        }
        operateExtension();
        char write = EMPTY;
        int newState;
        int move = 0;
        result = mStates[mCurrentState]->operate(mTape->read(), write, 
          mCurrentState, move);
        if(!result) break;
        mTape->write(write);
        showProcess(logConsole);
        mTape->moveHead(move);
        showProcess(logConsole);
      }
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
  private:
    bool mShowProcess;
    int mCurrentState;
    
    int mStartState;
    
    int mInternalClear;
    int mInternalRead;
    int mInternalWrite;
    
    Tape* mTape;
    
    vector<int> mAcceptedStates;
    vector<State*> mStates;
    vector<string> knownStates;
    vector<string> includedDirectories;
    
    bool operateExtension()
    {
      if(mCurrentState == mInternalClear)
        mTape->clear();
      else if(mCurrentState == mInternalRead)
        mTape->readFile();
      else if(mCurrentState == mInternalWrite)
        mTape->writeFile();
      else return false;
      return true;
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
    
    bool loadFile(string path, bool primary,
      ErrorInfo& onError)
    {
      bool result = true;
      onError.lineno = -1; // for error messages
      onError.file = path;
      string name = path;
      string line;
      vector<string> includeFiles;
      string folder = stringsup::getFolderPath(path);
      //check if this file exists in any of the included Directorys
      stringsup::testFilePaths(path, includedDirectories);
      ifstream prg (path);
      if(prg.is_open())
      {
        includedDirectories.push_back(folder);
        onError.lineno = 0;
        
        while(getline(prg, line))
        {
          onError.lineno++;
          stringsup::trim(line);
          string five = line.substr(0, 5);
          if(line.substr(0,2).compare("//") == 0)//Kommentar
            continue;
          if(line.empty())
            continue;
          if(five.compare("name:") == 0)
          {
            name = line.substr(5);
            stringsup::ltrim(name);
            continue;
          }
          if(five.compare("init:") == 0)
          {
            if(!primary) continue;
            string statename = line.substr(5);
            stringsup::ltrim(statename);
            mStartState = addState(statename);
            continue;
          }
          if(line.substr(0,7).compare("accept:") == 0)
          {//set accepted states
            if(!primary) continue;
            string states = line.substr(7);
            stringsup::ltrim(states);
            vector<string> stateList {stringsup::explode(states, ',')};
            for(auto tmpState:stateList)
              mAcceptedStates.push_back(addState(tmpState));
            continue;
          }
          if(line.substr(0,9).compare("#include ") == 0)
          {//sub tm
            string includeFile = line.substr(9);
            stringsup::ltrim(includeFile);
            if(includeFile.front() == '"' && includeFile.back() == '"')
              includeFiles.push_back(
                includeFile.substr(1, includeFile.size() - 2));
            else if(includeFile.front() != '"' && includeFile.back() != '"')
              includeFiles.push_back(includeFile);
            else 
            {
              result = false;
              break;
            }
            continue;
          }
          result = parseTransition(line, name, primary);
          if(!result) 
          {
            onError.file += " (*,*,-) occured ";
            break;
          }
        }
        prg.close();
      }
      else
        return false;
      
      if(!result) return result;
      
      int index = 0;
      for(index = 0; index < includeFiles.size(); index++)
      {
        result = loadFile(includeFiles[index], false, onError);
        if(!result) break;
      }
      return result;
    }
    
    bool parseTransition(string tupel, string prefix, bool primary)
    {
      stringsup::replace(tupel, ",,",",comma");
      vector<string> parts {stringsup::explode(tupel, ',')};
      if(parts.size() != 5) return false;
      string curState = parts[0];
      string newState = parts[4];
      if(!primary)
      {
        curState = prefix + "/" + curState;
        newState = prefix + "/" + newState;
      }
      int curStateNo = addState(curState);
      int newStateNo = addState(newState);
      if(parts[1].compare("comma") == 0) parts[1] = ',';
      if(parts[2].compare("comma") == 0) parts[2] = ',';
      if(parts[1].size() != 1 || parts[2].size() != 1 || 
        parts[3].size() != 1) return false;
      if(parts[1][0] == WILDCARD && parts[2][0] == WILDCARD && 
        parts[3][0] == NO_MOVE) return false;
    // this would lead to a endless loop
      Transition* way = new Transition((parts[1])[0],(parts[2])[0],
        (parts[3])[0],newStateNo, curStateNo);
      if(way->moveChar() != (parts[3])[0])
      {
        delete way;
        return false;
      }
      mStates[curStateNo]->addTransition(way);
      return true;
    }
    
    int addState(string name)
    {
      auto result = find(knownStates.begin(), knownStates.end(), name);
      if(result == knownStates.end())
      {
        knownStates.push_back(name);
        mStates.push_back(new State(name));
        return knownStates.size() - 1;
      }
      else return (result - knownStates.begin());
    }

    bool isState(int state)
    {
      if(state < 0 || state >= mStates.size()) return false;
      return true;
    }
    bool isAccepted(int state)
    {
      return find(mAcceptedStates.begin(), mAcceptedStates.end(), state) 
        != mAcceptedStates.end();
    }
    
};

#endif