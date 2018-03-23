///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
///
/// main project file
/// 
/// Information about certain functions used 
/// from stackOverflow.com and cplusplus.com
/// 
/// use -D ADVANCED_OUTPUT for more detailed output during loading

/// use -D TAPELIMIT n to limit the tape size to n
/// use -D TAPE_LEFT_END to make the tape fixed on one side
///

#include <memory>
#include <iostream>
#include <vector>
#include <string>

#include "turingmachine.h"
#include "support.h"
#include "tmsimfunc.h"

#ifdef __WIN32__
#include <conio.h>
#endif


#define VERSION "1.2.0"
#ifndef IO_ERROR
#define IO_ERROR 2
#endif

using std::string;

using TM::TuringMachine;


  ///
  /// Turing Machine Simulator
  /// Usage: ./tm <programfile> [-show] [-in=<file>] [-help] [-exit] 
  /// [-speed=<steps/sec] [-I<folder>] [-tape=<input>]
  ///
  /// @return 0 on success
  ///
  //
  int main(int argc, char* argv[])
  {
  #ifndef DISABLE_OUTPUT
    int fieldCount = 60;
  #endif
    bool exitDirect = false;
    bool saveOnExit = false;
    string saveFile;
    string programFile;
    string input;
    TMSim::ErrorInfo errorInfo;
    bool gotInput = false;

    auto machine = std::make_unique<TuringMachine>();
  #ifndef DISABLE_OUTPUT  
    TMSim::printHeader(VERSION);
  #endif
    
    TMSim::getParameter(argc, argv, machine, programFile, input, exitDirect, saveOnExit,
      saveFile, gotInput);

  #ifndef DISABLE_OUTPUT    
    if(programFile == "?help" ||
            programFile == "-help")
    {
      TMSim::printHelp();
      //delete machine;  
      return TMSim::preExit(exitDirect, errorInfo);
    } 
    TMSim::printLoading(programFile);
  #endif
    
    if(!machine->loadProgram(programFile, errorInfo))
    {
      //delete machine;  
      errorInfo.error = IO_ERROR;
      return TMSim::preExit(exitDirect, errorInfo);
    }
  #ifndef DISABLE_OUTPUT 
    TMSim::showTMInfo(machine->getHeadComment());
  #endif
    
    if(!gotInput)
    {
      TMSim::getInput(input); //read input if not any specified
      machine->loadInput(input);
    }
    
  #ifndef DISABLE_OUTPUT  
    TMSim::printCursor(fieldCount);
  #endif
    
    bool result = machine->start(std::cout);
    while(TMSim::handleResult(result, machine))
    {
      result = machine->run(std::cout);
    }
    
    if(saveOnExit) machine->saveTape(saveFile, input);
    
    //delete machine; 
    return TMSim::preExit(exitDirect, errorInfo);
    
}