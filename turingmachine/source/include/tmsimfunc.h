///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
///
/// additional functions declaration file
/// 

#ifndef _TMSIMFUNC_H_
#define _TMSIMFUNC_H_

#ifndef IO_ERROR
#define IO_ERROR 2
#endif

#include <string>
#include <memory>

#include "turingmachine.h"
using TM::TuringMachine;

using std::string;
using std::unique_ptr;


namespace TMSim
{  
  //----------------------------------------------------------------------------
  // extract the parameter for machine execution
  //
  // @param argc the argument counter from the main
  // @param argv the argument values from the main
  // @param machine the unique pointer to the Turing Machine
  // @param programFile (output) file path of the main program
  // @param input (output) input for the tape
  // @param exitDirect (output) indicator if the machine ends without prompt
  // @param saveOnExit (output) indicator if the machine saves the tape on exit
  // @param saveFile (output) file path for saving the tape at the end
  // @param hexFile (output) indicator that a input file has already been loaded
  bool getParameter(int argc, char* argv[], 
      const unique_ptr<TuringMachine>& machine, 
      string& programFile, string& input, bool& exitDirect, bool& saveOnExit,
      string& saveFile, bool& hexfile);
  //----------------------------------------------------------------------------
  // prompt the user for a program file path
  // @param programFile (output) the program file path
  //
  // returns true if a path had been entered
  //
  bool askForPath(string& programFile);
  //----------------------------------------------------------------------------
  // ask the user for input
  // @param input (output) the input for the tape
  //
  void getInput(string& input);
  //----------------------------------------------------------------------------
  // prepare exit
  // @param exitDirect indicator whether the machine shall stop without notice
  // @param info error information
  // 
  // returns errorcode
  //
  int preExit(const bool& exitDirect, const ErrorInfo& info);
#ifndef DISABLE_OUTPUT
  //----------------------------------------------------------------------------
  // output the header of the simulator
  //
  void printHeader(string version);
  //----------------------------------------------------------------------------
  // output the cursor on the tape
  //
  void printCursor(int fieldCount = 60);
  //----------------------------------------------------------------------------
  // print the help manual
  //
  void printHelp();
  //----------------------------------------------------------------------------
  // output the loading process
  //
  void printLoading(const string& programFile);
  //----------------------------------------------------------------------------
  // output information about the error
  //
  void handleError(ErrorInfo info);
  //----------------------------------------------------------------------------
  // output information about the TM
  //
  void showTMInfo(const string& comment);
#endif
  //----------------------------------------------------------------------------
  // handle the result of the turing machine execution
  //
  bool handleResult(bool& result, const unique_ptr<TuringMachine>& machine);
  //----------------------------------------------------------------------------
  // read all text from the given file (including \n)
  //
  string readFile(const string& path);
  //----------------------------------------------------------------------------
  // read all text from the given file (ignore \n)
  //
  string readFile2(const string& path);
}

#endif