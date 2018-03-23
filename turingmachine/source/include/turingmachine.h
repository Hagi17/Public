///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
/// 
/// Turing Machine class - header file
///

#ifndef _TURINGMACHINE_H_
#define _TURINGMACHINE_H_

#include <string>
#include <iostream>
#include <memory>
//#include <cstdio>

#ifdef __WIN32__
  #include <windows.h>
#else
  #include <unistd.h>
#endif

#include "support.h"
#include "errorinfo.h"
#include "state.h"
#include "transition.h"
#include "tape.h"

using std::string;
using std::ostream;
using std::unique_ptr;

namespace TM
{
  //----------------------------------------------------------------------------
  // operational state of the Turing machine
  //
  typedef enum class _OperationalState_
  {
    Halt = 0,
    Accepted = 1,
    Error,
    Warning,
    BreakPoint,
    Running
  } OperationalState;
  //----------------------------------------------------------------------------
  // Turing Machine
  //
  class TuringMachine
  {
    public:
      //------------------------------------------------------------------------
      // Standard constructor.
      //
      TuringMachine();  
      //------------------------------------------------------------------------
      // standard destructor
      //
      virtual ~TuringMachine();
      //------------------------------------------------------------------------
      // no copy constructor
      //
      TuringMachine(const TuringMachine& another) = delete;
      //------------------------------------------------------------------------
      // no operator=
      //
      TuringMachine& operator=(const TuringMachine& another) = delete;
      //------------------------------------------------------------------------
      // add another include Folder
      //
      void addIncludeFolder(const string& path);
      //------------------------------------------------------------------------
      // set the path for the log file
      //
#ifndef DISABLE_LOG
      void setLogFile(const string& path);
#endif
      //------------------------------------------------------------------------
      // load internal functions
      //
#ifndef DISABLE_EXTENSIONS
      void loadExtension();
#endif
      //------------------------------------------------------------------------
      // load program
      // @param programFile path to the main program file (.tm)
      // @param onError (output) information about the load error
      //
      // returns true if successfull, otherwise false
      //
      bool loadProgram(const string& programFile, 
        TMSim::ErrorInfo& onError);
      //------------------------------------------------------------------------
      // start the TM
      // @param logConsole stream for outputting process information
      //
      // returns true if end state is accepted 
      //         false if error occured, or non accepted state
      //
      bool start(ostream& logConsole);
      //------------------------------------------------------------------------
      // run (restart) the TM
      // @param logConsole stream for outputting process information
      //
      // returns true if end state is accepted 
      //         false if error occured, or non accepted state
      //
      bool run(ostream& logConsole);
      //------------------------------------------------------------------------
      // define if the operation should be displayedpted state
      //
      void setShowProcess(const bool& showProcess);
      //------------------------------------------------------------------------
      // define how many characters to output when displaying the tape
      //
      void setPrintTapeFieldCount(const int& count);
      //------------------------------------------------------------------------
      // load the tape from the given file
      //
      void loadInput(const string& input);//------------------------------------------------------------------------
      // load the tape from the given file (hex notation)
      //
      void loadHexInput(const string& file);//------------------------------------------------------------------------
      // load the tape from the given file (toy code)
      //
#ifndef DISABLE_TOY
    void loadToyFile(const string& file);
#endif
      //------------------------------------------------------------------------
      // set the head position to 0
      //
      void resetHead();
      //------------------------------------------------------------------------
      // reset the machine to the initial state
      //
      void resetState();
      //------------------------------------------------------------------------
      // print out the tape (predefined size)
      //
      const string printTape();
      //------------------------------------------------------------------------
      // print out the tape (given size)
      //
      const string printTape(int sizeOfFields);
      //------------------------------------------------------------------------
      // retrieve the current state name
      //
      const string getCurrentState() const;
      //------------------------------------------------------------------------
      // save the tape and the input to the file(path)
      //
      void saveTape(const string& path, const string& input);
      //------------------------------------------------------------------------
      // set inFile as standard input file
      //
      void setStdIn(const string& inFile);
      //------------------------------------------------------------------------
      // set outFile as standard output file
      //
      void setStdOut(const string& outFile);
      //------------------------------------------------------------------------
      // retrieve the current operational state of the machine
      //
      const OperationalState machineState() const { return mState; }
      //------------------------------------------------------------------------
      // retrieve the head comment of the program
      //
      const string getHeadComment() const { return mHeadComment; }
      //------------------------------------------------------------------------
      // set the number of states to be executed before displaying a warning
      //
      void setWarningStateCount(const int& count);
      //------------------------------------------------------------------------
      // set the time for  thread sleep between outputting the tape
      //
      void setSleepTime(const int& millis);
    private:
      //------------------------------------------------------------------------
      // define if logging is enabled
      //
      bool mLog;
      //------------------------------------------------------------------------
      // define if process output is enabled
      //
      bool mShowProcess;
      //------------------------------------------------------------------------
      // number of the current state
      //
      int mCurrentState;
      //------------------------------------------------------------------------
      // number of the initial state
      //
      int mStartState;
      //------------------------------------------------------------------------
      // intermediate puffer for copy & paste in turing machine execution
      //
      char mTmpCopied;
#ifndef DISABLE_EXTENSIONS
      //------------------------------------------------------------------------
      // internal clear function
      //
      int mInternalClear;
      //------------------------------------------------------------------------
      // internal read (from file) function
      //
      int mInternalRead;
      //------------------------------------------------------------------------
      // internal write (to file) function
      //
      int mInternalWrite;
      //------------------------------------------------------------------------
      // internal goleft (go all left)
      //
      int mInternalGoLeft;
      //------------------------------------------------------------------------
      // internal go right (go all right)
      //
      int mInternalGoRight;
      //------------------------------------------------------------------------
      // internal write wildcard (force writing wildcard)
      //
      int mInternalSetAsterix;
      //------------------------------------------------------------------------
      // internal copy function
      //
      int mInternalCopy;
      //------------------------------------------------------------------------
      // internal paste function
      //
      int mInternalPaste;
      //------------------------------------------------------------------------
      // internal read from stdin function
      //
      int mInternalStdin;
      //------------------------------------------------------------------------
      // internal write to stdout function
      //
      int mInternalStdout;
      //------------------------------------------------------------------------
      // internal enable process output function
      //
      int mInternalShowOn;
      //------------------------------------------------------------------------
      // internal disable process output function
      //
      int mInternalShowOff;
#endif
    
      //------------------------------------------------------------------------
      // head comment of the programm
      //
      string mHeadComment;
      //------------------------------------------------------------------------
      // path to the stdin file
      //
      string mStdInFile;
      //------------------------------------------------------------------------
      // path to the stdout file
      //
      string mStdOutFile;
      //------------------------------------------------------------------------
      // path to the log file
      //
      string mLogFile;
      //------------------------------------------------------------------------
      // constant tempfile name
      //
      static const string mTempFile;
    
      //------------------------------------------------------------------------
      // statecount when to display a endless loop warning
      //
      int WarningStateCount;
      //------------------------------------------------------------------------
      // sleep time in microseconds
      //
      int sleepTimeInMicroSeconds;
      //------------------------------------------------------------------------
      // sleep time in milliseconds
      //
      int sleepTimeInMilliSeconds;
    
      //------------------------------------------------------------------------
      // operational status of the machine
      //
      OperationalState mState;
    
      //------------------------------------------------------------------------
      // Tape of the Turing machine
      //
      unique_ptr<Tape> mTape;
    
      //------------------------------------------------------------------------
      // list of accepted states
      //
      vector<int> mAcceptedStates;
      //------------------------------------------------------------------------
      // list of states
      //
      vector<unique_ptr<State>> mStates;
      //------------------------------------------------------------------------
      // list of known states (names)
      //
      vector<string> knownStates;
      //------------------------------------------------------------------------
      // list of included directories
      //
      vector<string> includedDirectories;
      //------------------------------------------------------------------------
      // execute internal function of the transition 
      //
#ifndef DISABLE_EXTENSIONS
  #ifndef DISABLE_LOG
      void operateExtension(char& read, std::ofstream& logfile, ostream& logConsole);
  #else
      void operateExtension(char& read, ostream& logConsole);
  #endif
#endif
 
#ifndef DISABLE_OUTPUT 
      //------------------------------------------------------------------------
      // show current step of the turing machine operation
      //
      void showProcess(ostream& logConsole);
#endif
    
      //------------------------------------------------------------------------
      // load the program file
      //
      bool loadFile(string path, const string& prefix, const bool& primary, 
        TMSim::ErrorInfo& onError, bool newPrefix = false, char templ = EMPTY, unsigned long templNr = 1);
      
#ifndef DISABLE_INCLUDE    
      //------------------------------------------------------------------------
      // parse the include statement
      //
      bool parseInclude(string cntnt, const string& prefix, 
        vector<string>& includeFiles, vector<string>& importPrefixes, 
        vector<char>& templateChar, vector<unsigned long>& templateNr, 
        const char& tmplChar, const unsigned long& tmplNr);
#endif
    
      //------------------------------------------------------------------------
      // parse the transition statement
      //
      bool parseTransition(string tupel, const string& prefix, 
        const string& importPrefix, const bool& primary, const bool& newPrefix, 
        const char& templateChar, const unsigned long& templateSteps);
      
      //------------------------------------------------------------------------
      // prepare the state
      //
      int prepareState(string state, const string& prefix, 
        const string& importPrefix, const bool& primary, const bool& newPrefix);
      
      //------------------------------------------------------------------------
      // add the state to the known states and the state list
      //
      const int addState(const string& name);

      //------------------------------------------------------------------------
      // checks if the given integer represents a valid state
      //
      const bool isState(const int& state) const;
      //------------------------------------------------------------------------
      // checks if the given integer represents an accepted state
      //
      const bool isAccepted(const int& state) const;
    
  };

}

#endif