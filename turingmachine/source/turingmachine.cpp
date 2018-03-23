///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
/// 
/// Turing Machine class - implementation file
///

#include <string>
#include <fstream>
#include <iostream>
#include <vector>
#include <algorithm>

#include "turingmachine.h"

using std::string;
using std::ostream;
using std::ifstream;
using std::ofstream;
using std::vector;
using std::find;
using std::endl;
using TM::TuringMachine;
using TM::OperationalState;

using TM::StringSupport::explode;
using TM::StringSupport::replace;
using TM::StringSupport::ltrim;
using TM::StringSupport::trim;
using TM::StringSupport::testFilePaths;
using TM::StringSupport::getFolderPath;

//------------------constants---------------------------------------------------
const string TuringMachine::mTempFile = "tmp.txt";

//------------------------------------------------------------------------------
TuringMachine::TuringMachine() : 
  mLog(false), mShowProcess(false), mCurrentState(0), mStartState(0), 
  mState(OperationalState::Halt), WarningStateCount(25000), sleepTimeInMicroSeconds(250000),
  sleepTimeInMilliSeconds(250)
{
  mTape = std::make_unique<Tape>();
  knownStates.clear();
  includedDirectories.clear();
#ifndef DISABLE_EXTENSIONS
  mInternalClear = -1;
  mInternalRead = -1;
  mInternalWrite = -1;
  mInternalGoLeft = -1;
  mInternalGoRight = -1;
  mInternalSetAsterix = -1;
  mInternalCopy = -1;
  mInternalPaste = -1;
  mInternalStdin = -1;
  mInternalStdout = -1;
  mInternalShowOn = -1;
  mInternalShowOff = -1;
#endif
}
//------------------------------------------------------------------------------
TuringMachine::~TuringMachine()
{
  //delete mTape;
  while(!mStates.empty())
  {
    //delete mStates.back();
    mStates.pop_back();
  }
}
//------------------------------------------------------------------------------
void TuringMachine::addIncludeFolder(const string& path)
{
  includedDirectories.push_back(path);
}
//------------------------------------------------------------------------------
#ifndef DISABLE_LOG
void TuringMachine::setLogFile(const string& path)
{
  mLogFile = path;
  mLog = true;
}
#endif
//------------------------------------------------------------------------------
#ifndef DISABLE_EXTENSIONS
void TuringMachine::loadExtension()
{
  if(mInternalClear != -1) return;
  mInternalClear = addState("internal/clear");
  mInternalRead = addState("internal/read");
  mInternalWrite = addState("internal/write");
  mInternalGoLeft = addState("internal/goLeft");
  mInternalGoRight = addState("internal/goRight");
  mInternalSetAsterix = addState("internal/setAsterix");
  mInternalCopy = addState("internal/copy");
  mInternalPaste = addState("internal/parse");
  mInternalStdin = addState("internal/stdin");
  mInternalStdout = addState("internal/stdout");
  mInternalShowOn = addState("internal/showon");
  mInternalShowOff = addState("internal/showoff");
}
#endif
//------------------------------------------------------------------------------
bool TuringMachine::loadProgram(const string& programFile, 
      TMSim::ErrorInfo& onError)
{
  return loadFile(programFile, "", true, onError);
}
//------------------------------------------------------------------------------
bool TuringMachine::start(ostream& logConsole)
{
  resetState();
  resetHead();
  return run(logConsole);
}
//------------------------------------------------------------------------------
bool TuringMachine::run(ostream& logConsole)
{
#ifndef DISABLE_LOG
  ofstream logfile(mLogFile, ofstream::app);
  if(logfile.is_open())
    logfile << "Started with " << printTape() << endl;
#endif
  bool result = true;
  mState = OperationalState::Running;
#ifndef DISABLE_WARNINGS
  int counter = 0;
#endif
#ifndef DISABLE_OUTPUT
  if(mShowProcess) logConsole << printTape();
#endif
  while(!isAccepted(mCurrentState) && isState(mCurrentState))
  {
#ifndef DISABLE_WARNINGS
    counter++;
    if(counter > WarningStateCount) 
    {
  #ifndef DISABLE_LOG
      if(logfile.is_open())
        logfile << "Warning" << endl;
  #endif
      mState = OperationalState::Warning;
      return result;
    }
#endif
    char read = mTape->read();
#ifndef DISABLE_EXTENSIONS
  #ifndef DISABLE_LOG
    operateExtension(read, logfile, logConsole);
  #else
    operateExtension(read, logConsole);
  #endif
#endif
    char write = EMPTY;
    bool breakPoint = false;
    int move = 0;
#ifndef DISABLE_LOG
    if(logfile.is_open())
      logfile << mStates[mCurrentState]->getName() << "," << read 
        << "," << write << ",";
#endif
    result = mStates[mCurrentState]->operate(read, write, 
    mCurrentState, move, breakPoint);
    if(!result) 
    {
#ifndef DISABLE_LOG
      if(logfile.is_open())
        logfile << "Error" << endl;
#endif
      mState = OperationalState::Halt;
      break;
    }
#ifndef DISABLE_LOG
    if(logfile.is_open())
    {
      logfile << (move==0?"-":(move>0?">":"<"));
      if(move > 1) logfile << move;
      if(move < -1) logfile << -move;
      logfile << "," << mStates[mCurrentState]->getName() << endl;
    }
#endif
    mTape->write(write);
#ifndef DISABLE_OUTPUT
    showProcess(logConsole);
#endif
    mTape->moveHead(move);
#ifndef DISABLE_OUTPUT
    showProcess(logConsole);
#endif
    if(breakPoint)
    {
#ifndef DISABLE_LOG
      if(logfile.is_open())
        logfile << "Breakpoint" << endl;
#endif
      mState = OperationalState::BreakPoint;
      break;
    }
  }
  if(isAccepted(mCurrentState)) mState = OperationalState::Accepted;
#ifndef DISABLE_OUTPUT
  if(mShowProcess) logConsole << '\r';
#endif
      
#ifndef DISABLE_LOG
  if(logfile.is_open())
    logfile << "Stopped (" << isAccepted(mCurrentState) << ")" << endl;
  logfile.close();
#endif
  return (result && isAccepted(mCurrentState));
}
//------------------------------------------------------------------------------
void TuringMachine::setShowProcess(const bool& showProcess)
{
#ifndef DISABLE_OUTPUT
  mShowProcess = showProcess;
#endif
}
//------------------------------------------------------------------------------
void TuringMachine::setPrintTapeFieldCount(const int& count)
{
  mTape->setPrintTapeFieldCount(count);
}
//------------------------------------------------------------------------------
void TuringMachine::loadInput(const string& input)
{
  mTape->loadInput(input);
}
//------------------------------------------------------------------------------
void TuringMachine::loadHexInput(const string& file)
{
  mTape->loadHexInput(file);
}
//------------------------------------------------------------------------------
#ifndef DISABLE_TOY
void TuringMachine::loadToyFile(const string& file)
{
  mTape->loadToyInput(file);
}
#endif
//------------------------------------------------------------------------------
void TuringMachine::resetHead()
{
  mTape->resetHead();
}
//------------------------------------------------------------------------------
void TuringMachine::resetState()
{
  mCurrentState = mStartState;
}
//------------------------------------------------------------------------------
const string TuringMachine::printTape()
{
  return mTape->printTape();
}
//------------------------------------------------------------------------------
const string TuringMachine::printTape(int sizeOfFields)
{
  return mTape->printTape(sizeOfFields);
}
//------------------------------------------------------------------------------
const string TuringMachine::getCurrentState() const
{
  if(!isState(mCurrentState)) return "";
  return mStates[mCurrentState]->getName();
}  
//------------------------------------------------------------------------------
void TuringMachine::saveTape(const string& path, const string& input)
{
  mTape->saveTape(path, input);
}
//------------------------------------------------------------------------------
void TuringMachine::setStdIn(const string& inFile)
{
  mStdInFile = inFile;
}
//------------------------------------------------------------------------------
void TuringMachine::setStdOut(const string& outFile)
{
  mStdOutFile = outFile;
}
//------------------------------------------------------------------------------
#ifndef DISABLE_EXTENSIONS
  #ifndef DISABLE_LOG
void TuringMachine::operateExtension(char& read, ofstream& logfile, ostream& logConsole)
  #else
void TuringMachine::operateExtension(char& read, ostream& logConsole)
  #endif
{
  int intF = mStates[mCurrentState]->InternalFunction(read);
  if(intF == -2) return;
  #ifndef DISABLE_LOG
  if(logfile.is_open())
    logfile << "extension: " << intF << endl;
  #endif
  #ifndef DISABLE_OUTPUT
      if(mCurrentState == mInternalShowOn || intF == mInternalShowOn)
        mShowProcess = true;
      else if(mCurrentState == mInternalShowOff || intF == mInternalShowOff)
      {
        mShowProcess = false;
        logConsole << endl;
      }
  #endif
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
      if(mCurrentState == mInternalPaste || intF == mInternalPaste)
        mTape->forceWrite(mTmpCopied);
      if(mCurrentState == mInternalStdin || intF == mInternalStdin)
      {
        ifstream file(mStdInFile);
        ofstream tFile(mTempFile);
        if(file.is_open())
        {
          char chIn = 0;
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
#endif
//------------------------------------------------------------------------------
#ifndef DISABLE_OUTPUT 
void TuringMachine::showProcess(ostream& logConsole)
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
#endif
//------------------------------------------------------------------------------
bool TuringMachine::loadFile(string path, const string& prefix, 
  const bool& primary, TMSim::ErrorInfo& onError, bool newPrefix, char templ, 
  unsigned long templNr)
{
  bool result = true;
  onError.lineno = -1; // for error messages
  onError.file = path;
  string name = path;
  string line;
#ifndef DISABLE_INCLUDE
  vector<string> includeFiles;
  vector<string> importPrefixes;
  vector<char> templateChar;
  vector<unsigned long> templateNr;
  string folder = getFolderPath(path);
#endif
      
  //check if this file exists in any of the included Directorys
  testFilePaths(path, includedDirectories);
      
  ifstream prg (path);
  if(prg.is_open())
  {
    //check if it contains it?
#ifndef DISABLE_INCLUDE
    includedDirectories.push_back(folder);
#endif
    onError.lineno = 0;
        
    bool nonCommentLine = false;
    while(getline(prg, line))
    {
      onError.lineno++;
      trim(line);
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
        ltrim(name);
        continue;
      }
      if(five == "init:")
      {
            if(!primary) continue;
            string statename = line.substr(5);
            ltrim(statename);
            mStartState = addState(statename);
            continue;
          }
          if(line.substr(0, 7) == "accept:")
          {//set accepted states
            if(!primary) continue;
            string states = line.substr(7);
            ltrim(states);
            vector<string> stateList {explode(states, ',')};
            for(auto tmpState:stateList)
              mAcceptedStates.push_back(addState(tmpState));
            continue;
          }
          if(line.substr(0, 9) == "#include ")
          {//sub tm   #include <> (AS prefix(templ,nr))
#ifndef DISABLE_INCLUDE
            string includeFile = line.substr(9);
            result = parseInclude(line.substr(9), prefix, includeFiles,
                importPrefixes, templateChar, templateNr, templ, templNr);
            if(!result) break;
            else continue;
#else
            continue;
#endif
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
#ifndef DISABLE_INCLUDE      
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
#endif
  return result;
}
//------------------------------------------------------------------------------
#ifndef DISABLE_INCLUDE    
bool TuringMachine::parseInclude(string cntnt, const string& prefix,vector<string>& includeFiles,
  vector<string>& importPrefixes, vector<char>& templateChar, vector<unsigned long>& templateNr, const char& tmplChar, const unsigned long& tmplNr)
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
        trim(tmpNrStr);
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
      trim(templStr);
      if(templStr == "%tmpl%") templChar = tmplChar;
      else templChar = templStr.front();
    }
    
    trim(usingprefix);
    cntnt = cntnt.substr(0, findex);
    trim(cntnt);
    if(incPrefix.length() > 0)
      incPrefix = incPrefix + "/" + usingprefix;
    else incPrefix = usingprefix;
  }
  else ltrim(cntnt);
  
  #ifndef DISABLE_EXTENSIONS    
  if(cntnt == "INTERNAL")
    loadExtension();
  else 
  #endif
  if(cntnt.front() == '"' && cntnt.back() == '"')
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
#endif
//------------------------------------------------------------------------------
bool TuringMachine::parseTransition(string tupel, const string& prefix, 
  const string& importPrefix, const bool& primary, const bool& newPrefix, 
  const char& templateChar, const unsigned long& templateSteps)
{
  int curStateNo = -1;
  int newStateNo = -1;
  int internStateNo = -2;
  unsigned long steps = 1;
  replace(tupel, ",,",",comma");
  vector<string> parts {explode(tupel, ',')};
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
#ifndef DISABLE_INCLUDE
      if(parts[1] == "%tmpl%") parts[1] = templateChar;
      if(parts[2] == "%tmpl%") parts[2] = templateChar;
#endif
      if(parts[1][0] == '0' && parts[1][1] == 'x') 
        parts[1] = (char)stoul(parts[1], NULL, 16);
      if(parts[2][0] == '0' && parts[2][1] == 'x') 
        parts[2] = (char)stoul(parts[2], NULL, 16);
      if(parts[3].size() != 1)
      {//number of moves
#ifndef DISABLE_INCLUDE
        if(parts[3].size() == 2 && parts[3][1] == '%')
          steps = templateSteps;
        else
#endif
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
#ifndef DISABLE_WILDCARD
      if(parts[1][0] == WILDCARD && parts[2][0] == WILDCARD && 
        parts[3][0] == NO_MOVE && curStateNo == newStateNo) return false;
    // this would lead to a endless loop (same state, no movement, take all)
#endif
      shared_ptr<Transition> way = std::make_shared<Transition>((parts[1])[0],(parts[2])[0],
        (parts[3])[0],steps,newStateNo, curStateNo, breakPoint, internStateNo, 
        ignoreCase);
      if(way->moveChar() != (parts[3])[0])
      {
        //delete way;
        return false;
      }
      mStates[curStateNo]->addTransition(way);
      return true;
    }
//------------------------------------------------------------------------------
int TuringMachine::prepareState(string state, const string& prefix, 
  const string& importPrefix, const bool& primary, const bool& newPrefix)
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
//------------------------------------------------------------------------------
const int TuringMachine::addState(const string& name)
{
  auto result = find(knownStates.rbegin(), knownStates.rend(), name);
  if(result == knownStates.rend())
  {
    knownStates.push_back(name);
    mStates.push_back(std::make_unique<State>(name));
    return knownStates.size() - 1;
  }
  else return (knownStates.rend() - result - 1);
}
//------------------------------------------------------------------------------
const bool TuringMachine::isState(const int& state) const
{
  return (state >= 0 && state < (int)mStates.size());
}
//------------------------------------------------------------------------------
const bool TuringMachine::isAccepted(const int& state) const
{
  return find(mAcceptedStates.begin(), mAcceptedStates.end(), state) 
    != mAcceptedStates.end();
}
//------------------------------------------------------------------------------
void TuringMachine::setWarningStateCount(const int& count)
{
  if(count >= 0) WarningStateCount = count;
}
//------------------------------------------------------------------------------
void TuringMachine::setSleepTime(const int& millis)
{
  if(millis <= 0) return;
  sleepTimeInMilliSeconds = millis;
  sleepTimeInMicroSeconds = millis * 1000;
} 