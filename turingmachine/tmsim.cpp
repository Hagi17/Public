///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 14.12.17
/// 
/// Information about certain functions used 
/// from stackOverflow.com and cplusplus.com
///

#include <iostream>
#include <vector>
#include <string>

#include "turingmachine.h"
#include "support.h"

#ifdef __WIN32__
#include <conio.h>
#endif

#define VERSION "1.0"
#define IO_ERROR 2

using namespace std;

bool getParameter(int argc, char* argv[], TuringMachine* machine, 
    string& programFile, string& input, bool& exitDirect, bool& saveOnExit,
    string& saveFile);
bool askForPath(string& programFile);
void getInput(string& input);
int preExit(bool exitDirect, ErrorInfo info);
void printHeader(string version, string programFile);
void printCursor(int fieldCount = 60);
void printHelp();
bool handleResult(bool result, bool warning, TuringMachine* machine);
void handleError(ErrorInfo info);

///
/// Turing Machine Simulator
/// Usage: ./tm <programfile> [-show] [-in=<input>] [-help] [-exit] 
/// [-speed=<steps/sec] [-I<folder>]
///
/// @return 0 on success
///
//
int main(int argc, char* argv[])
{
  int fieldCount = 60;
  bool showProcess = false;
  bool exitDirect = false;
  bool saveOnExit = false;
  string saveFile = "";
  string programFile = "";
  string input = "";
  ErrorInfo errorInfo;
  
  TuringMachine* machine = new TuringMachine();
  
  getParameter(argc, argv, machine, programFile, input, exitDirect, saveOnExit,
    saveFile);
  if(programFile.compare("?help") == 0 || 
    programFile.compare("-help") == 0)
  {
    printHelp();
    delete machine;  
    return preExit(exitDirect, errorInfo);
  }
  
  printHeader(VERSION, programFile);
  
  if(!machine->loadProgram(programFile, errorInfo))
  {
    delete machine;  
    errorInfo.error = IO_ERROR;
    return preExit(exitDirect, errorInfo);
  }
  
  getInput(input); //read input if not any specified
  machine->loadInput(input);
  
  printCursor(fieldCount);
  
  bool result = false;
  bool warning = false;
  do
  {
    result = machine->start(cout, warning);
  }
  while(handleResult(result, warning, machine));
  
  if(saveOnExit) machine->saveTape(saveFile, input);
  
  delete machine; 
  return preExit(exitDirect, errorInfo);
  return 0;
  
}

void handleError(ErrorInfo info)
{
  if(info.error == IO_ERROR)
  {
    if(info.lineno < 0)
      cout << info.file << " couldn't be read!" << endl;
    else
    {
      cout << "Error in Line " << info.lineno << endl;
      cout << "in File: " << info.file << endl;
    }
  }
}

bool handleResult(bool result, bool warning, TuringMachine* machine)
{
  if(warning)
  {
    char questChar;
    cout << "The machine seems to be stuck! Ignore (n) or Abort (y) ? ";
    cin >> questChar;
    if(questChar == 'n') return true;
    cout << "Aborted!" << endl;
    result = false;
  }
  cout << machine->printTape() << endl;
  if(!result) cout << "Input rejected!" << endl;
  else cout << "Accepted!" << endl;
  return false;
}

void printHelp()
{
  cout << "Usage: ./tm <programfile> [-show] [-in=<input>] [-help] [-exit]";
  cout << " [-speed=<steps/sec>] [-I<folder>] [-ext] [-out=<file>]" << endl;
  cout << "<programfile> specifies the path to the Programfile (Ending: .tm, .txt)" << endl;
  cout << "if -show is set, the current tape will be printed after each step.";
  cout << "with -speed=<>, the time for a step can be adjusted" << endl;
  cout << endl;
  cout << "if -in is set, this will be taken as input" << endl;
  cout << "if -help is set, this help will be shown" << endl;
  cout << "if -ext is set, internal/read, internal/write and internal/clear will be";
  cout << "available." << endl;
  cout << "if -exit is set, the user won't be asked to enter a key at the end.";
  cout << endl;
  cout << "if -out=<file> is set, the input and the final output will be stored";
  cout << " in the given file after the machine stopped." << endl;
  cout << "-I<folder>   Add <folder> to the Machines searchpath for TM - Files";
  cout << endl << endl;
  cout << "internal/read: interprets the content of the tape until '$' as a filepath ";
  cout << "and loads the content on to the tape behind that $ (ignores \\n)" << endl;
  cout << "internal/write: interprets the content of the tape until '$' as a filepath ";
  cout << "and stores the tape behind the $ in the file" << endl;
  cout << "internal/clear: clear complete tape" << endl;
  cout << "from internal/write and internal/read you can go on by reading * or $";
  cout << "from internal/clear by reading * or _" << endl << endl;
  cout << "Program-Layout: " << endl;
  cout << "[#include \"<file>\"]" << endl;
  cout << "name: <name>" << endl;
  cout << "init: <state>" << endl;
  cout << "accept: <state>[,<state>]" << endl;
  cout << "<state>,<input>,<output>,<move>,<newstate>" << endl;
  cout << "//comments will be ignored" << endl;
  cout << endl;
  cout << "With #include <file> a sub-TM can be loaded," << endl;
  cout << "multiple #includes can be specified." << endl;
  cout << "Name indicates the Name of the Program." << endl;
  cout << "init indicates the start State of the Program." << endl;
  cout << "accept indicates the accepted states of the Program." << endl;
  cout << "The 5-Tupel must be specified for each transition" << endl;
  cout << "move can be < (go left), > (go right) or - (stay)" << endl;
  cout << "for the states, this program takes in strings" << endl;
  cout << "for input and output, a single character must be specified" << endl;
  cout << "'*' reads any character, '_' reads an empty field" << endl;
  cout << "'*' writes no character, '_' writes an empty field" << endl;
}

void printCursor(int fieldCount)
{
  string cursor = "";
  cursor.append(fieldCount >> 1,' ');
  cursor.append(1,'V');
  cout << cursor << endl;
}

void printHeader(string version, string programFile)
{
  cout << "Turing Machine Simulator" << endl;
  cout << "Version " << version << endl;
  cout << endl;
  if(!programFile.empty())
    cout << "Loading program: " << programFile << endl;
}

int preExit(bool exitDirect, ErrorInfo info)
{
  handleError(info);
  cout << "Shutdown (press enter) ";
  if(!exitDirect)
    cin.ignore();
  return info.error;
}

bool getParameter(int argc, char* argv[], TuringMachine* machine, 
    string& programFile, string& input, bool& exitDirect, bool& saveOnExit,
    string& saveFile)
{
  if (argc < 2)
  {//ask for filepath
    return askForPath(programFile);
  }
  else
    programFile = argv[1];
  bool showProcess = false;
  int index = 0;
  int speed = 20;
  for(index = 2; index < argc; index++)
  {
    string arg = argv[index];
    if (arg.compare("-show") == 0)
      showProcess = true;
    else if(arg.compare("-help") == 0)
      programFile = "?help";
    else if(arg.compare("-exit") == 0)
      exitDirect = true;
    else if(arg.substr(0,5).compare("-out=") == 0)
    {
      saveOnExit=true;
      saveFile = arg.substr(5);
    }
    else if (arg.substr(0,4).compare("-in=") == 0)
      input = arg.substr(4);
    else if (arg.substr(0,7).compare("-speed=") == 0)
      speed = stoi(arg.substr(7));//set speed
    else if(arg.substr(0,2).compare("-I") == 0)
      machine->addIncludeFolder(arg.substr(2));
    else if(arg.compare("-ext") == 0)
      machine->loadExtension();
  }
  machine->setShowProcess(showProcess);
  int sleepTime = 500 / speed;
  machine->sleepTimeInMilliSeconds = sleepTime;
  machine->sleepTimeInMicroSeconds = sleepTime * 1000;
  return true;
}

bool askForPath(string& programFile)
{
  cout << "Please enter the path to the TM-Program to be loaded or -: ";
  getline(cin, programFile);
  return (programFile.compare("-") == 0 || programFile.compare("") == 0);
}

void getInput(string& input)
{
  if (input.compare("") == 0)
  {
    cout << "Input for run: ";
    getline(cin, input);
  }
}