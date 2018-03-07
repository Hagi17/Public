///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 07.03.17
///
/// main project file
/// 
/// Information about certain functions used 
/// from stackOverflow.com and cplusplus.com
/// 
/// use -D ADVANCED_OUTPUT for more detailed output during loading
/// use -D DISABLE_LOG to disable the log function completly
/// use -D DISABLE_EXTENSIONS to disable the internal functions completly
/// use -D SILENT to disable any output (only output via files)
/// use -D ENABLE_TOY to enable the -toy argument for toy files
/// use -D DISABLE_WARNINGS to disable the stop at warnings (certain amount of steps)
/// use -D DISABLE_WILDCARD to disable wildcard processing
/// use -D DISABLE_INCLUDE to disable wildcard processing
/// use -D TAPELIMIT n to limit the tape size to n
/// use -D TAPE_LEFT_END to make the tape fixed on one side
///


#ifndef DISABLE_LOG
  #define ENABLE_LOG
#endif
#ifndef DISABLE_EXTENSIONS
  #define ENABLE_EXTENSIONS
#endif
#ifndef DISABLE_WARNINGS
  #define ENABLE_WARNINGS
#endif
#ifndef DISABLE_WILDCARD
  #define ENABLE_WILDCARD
#endif
#ifndef DISABLE_INCLUDE
  #define ENABLE_INCLUDE
#endif
#ifndef SILENT
  #define ENABLE_OUTPUT
#endif

//#define ENABLE_TOY
//#define TAPELIMIT 2048
//#define TAPE_LEFT_END

#include <iostream>
#include <vector>
#include <string>

#include "turingmachine.h"
#include "support.h"

#ifdef __WIN32__
#include <conio.h>
#endif

#define VERSION "1.1.2"
#define IO_ERROR 2

using namespace std;

bool getParameter(int argc, char* argv[], TuringMachine* machine, 
    string& programFile, string& input, bool& exitDirect, bool& saveOnExit,
    string& saveFile, bool& hexfile);
bool askForPath(string& programFile);
void getInput(string& input);
int preExit(bool exitDirect, ErrorInfo info);
#ifdef ENABLE_OUTPUT
void printHeader(const string &version);
void printCursor(int fieldCount = 60);
void printHelp();
void printLoading(string programFile);
void handleError(ErrorInfo info);
void showTMInfo(const string &comment);
#endif
bool handleResult(bool result, TuringMachine* machine);
string readFile(string path);
string readFile2(string path);

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
#ifdef ENABLE_OUTPUT
  int fieldCount = 60;
#endif
  bool exitDirect = false;
  bool saveOnExit = false;
  string saveFile;
  string programFile;
  string input;
  ErrorInfo errorInfo;
  bool gotInput = false;

  auto* machine = new TuringMachine();
#ifdef ENABLE_OUTPUT  
  printHeader(VERSION);
#endif
  
  getParameter(argc, argv, machine, programFile, input, exitDirect, saveOnExit,
    saveFile, gotInput);

#ifdef ENABLE_OUTPUT    
  if(programFile == "?help" ||
          programFile == "-help")
  {
    printHelp();
    delete machine;  
    return preExit(exitDirect, errorInfo);
  } 
  printLoading(programFile);
#endif
  
  if(!machine->loadProgram(programFile, errorInfo))
  {
    delete machine;  
    errorInfo.error = IO_ERROR;
    return preExit(exitDirect, errorInfo);
  }
#ifdef ENABLE_OUTPUT 
  showTMInfo(machine->getHeadComment());
#endif
  
  if(!gotInput)
  {
    getInput(input); //read input if not any specified
    machine->loadInput(input);
  }
  
#ifdef ENABLE_OUTPUT  
  printCursor(fieldCount);
#endif
  
  bool result = machine->start(cout);
  while(handleResult(result, machine))
  {
    result = machine->run(cout);
  }
  
  if(saveOnExit) machine->saveTape(saveFile, input);
  
  delete machine; 
  return preExit(exitDirect, errorInfo);
  return 0;
  
}

#ifdef ENABLE_OUTPUT
void showTMInfo(const string &comment)
{
  if(comment.empty()) return;
  cout << "TM-Info: " << endl;
  cout << comment << endl;
}

void handleError(ErrorInfo info)
{
  if(info.error == IO_ERROR && info.file != "-")
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
#endif

bool handleResult(bool result, TuringMachine* machine)
{
  if(machine->machineState() == Warning)
  {
#ifdef ENABLE_OUTPUT
  #ifdef ENABLE_WARNINGS
    char questChar;
    cout << "The machine seems to be stuck! Ignore (n) or Abort (y) ? ";
    cin >> questChar;
    if(questChar == 'n') return true;
    cout << "Aborted!" << endl;
    result = false;
  #else
    return true;
  #endif
#else
    return true;
#endif
  }
  else if(machine->machineState() == BreakPoint)
  {
#ifdef ENABLE_OUTPUT
    char bPchar;
    cin >> bPchar;
    if(bPchar == 'n') return true;
    cout << "Aborted!" << endl;
    result = false;
#else
    return true;
#endif
  }
#ifdef ENABLE_OUTPUT
  cout << machine->printTape() << endl;
  if(!result) cout << "Input rejected!" << endl;
  else cout << "Accepted!" << endl;
#endif
  return false;
}

#ifdef ENABLE_OUTPUT
void printHelp()
{
  cout << "Usage: ./tm <programfile> [-show] [-in=<file>] [-help] [-exit]";
  cout << " [-speed=<steps/sec>] [-I<folder>] [-out=<file>]" << endl;
  cout << "\t[-tape=<input>] [...]"<<endl;
  cout << endl;
  cout << "<programfile>\tspecifies the path to the Programfile (Ending: .tm, .txt)" << endl;
  cout << "-show\t\tprint the current tape after each step." << endl;
  cout << "-speed=<>\tthe time for a step when displaying the tape in steps/sec" << endl;
  cout << "-tape\t\tspecify input (characters on tape)" << endl;
  cout << "-help\t\tshow this help" << endl;
  cout << "-ext\t\tinclude internal functions" << endl;
  cout << "-exit\t\tdon't ask for enter at the end of the program.";
  cout << endl;
  cout << "-in=<file>\tset the content of file as input on the tape" << endl;
  cout << "-in2=<file>\tsame as -in but ignoring \n" << endl;
  cout << "-out=<file>\tstore the input and the final output in the specified file" << endl;
  cout << "-hex=<file>\tload the input from the file, where the characters are encoded as hex";
  cout << endl;
  cout << "-I<folder>\tAdd <folder> to the Machines searchpath for TM - Files";
  cout << endl;
  cout << "-stdin=<file>\tset a certain file as standard input source (internal/stdin)" << endl;
  cout << "-stdout=<file>\tset a certain file as standard output (internal/stout)" << endl;
  cout << "-log=<file>\tset a log file for the program execution" << endl;
  cout << endl << endl;
  cout << "For more information, read the readme file" << endl;
}

void printCursor(int fieldCount)
{
  string cursor;
  cursor.append(fieldCount >> 1,' ');
  cursor.append(1,'V');
  cout << cursor << endl;
}

void printHeader(const string &version)
{
  cout << "Turing Machine Simulator" << endl;
  cout << "Version " << version << endl;
  cout << endl << "© Clemens Hagenbuchner, 2017" << endl;
  cout << endl << "Use -help for more informations.." << endl;
  cout << endl;
#ifdef ENABLE_LOG
  cout << "logging available" << endl;
#endif
#ifdef ENABLE_EXTENSIONS
  cout << "internal Functions available" << endl;
#endif
#ifdef ENABLE_INCLUDE
  cout << "Sub TMs available" << endl;
#endif
#ifdef ENABLE_TOY
  cout << "Toy File compatible" << endl;
#endif
#ifdef DISABLE_WARNINGS
  cout << "Warnings disabled, may run infinite" << endl;
#endif
#ifdef ENABLE_WILDCARD
  cout << "Wildcard available" << endl;
#endif
#ifdef TAPELIMIT
  cout << "Tapelimit: " << TAPELIMIT << endl;
#endif
#ifdef TAPE_LEFT_END
  cout << "Tape has fixed left end (may cause problems)" << endl;
#endif
}

void printLoading(string programFile)
{
  if(programFile.empty()) return;
  cout << "Loading program: " << programFile << endl;
}
#endif

int preExit(bool exitDirect, ErrorInfo info)
{
#ifdef ENABLE_OUTPUT
  handleError(info);
  cout << "Shutdown (press enter) ";
  if(!exitDirect)
    cin.ignore();
  return info.error;
#else 
  return 0;
#endif
}

bool getParameter(int argc, char* argv[], TuringMachine* machine, 
    string& programFile, string& input, bool& exitDirect, bool& saveOnExit,
    string& saveFile, bool& gotInput)
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
    if (arg == "-show")
      showProcess = true;
    else if(arg == "-help")
      programFile = "?help";
    else if(arg == "-exit")
      exitDirect = true;
    else if(arg.substr(0, 5) == "-out=")
    {
      saveOnExit=true;
      saveFile = arg.substr(5);
    }
    else if(arg.substr(0,5) == "-hex=")
    {
      machine->loadHexInput(arg.substr(5));
      input = arg.substr(5);
      gotInput = true;
    }
#ifdef ENABLE_TOY
    else if(arg.substr(0,5) == "-toy=")
    {
      machine->loadToyFile(arg.substr(5));
      gotInput = true;
    }
#endif
#ifdef ENABLE_LOG
    else if(arg.substr(0,5) == "-log=")
      machine->setLogFile(arg.substr(5));
#endif
    else if (arg.substr(0, 4) == "-in=")
      input = readFile(arg.substr(4));
    else if (arg.substr(0, 5) == "-in2=")
      input = readFile2(arg.substr(5));
    else if(arg.substr(0, 6) == "-tape=")
      input = arg.substr(6);
    else if(arg.substr(0, 7) == "-stdin=")
      machine->setStdIn(arg.substr(7));
    else if(arg.substr(0, 8) == "-stdout=")
      machine->setStdOut(arg.substr(8));
    else if (arg.substr(0, 7) == "-speed=")
      speed = stoi(arg.substr(7));//set speed
    else if(arg.substr(0, 2) == "-I")
      machine->addIncludeFolder(arg.substr(2));
#ifdef ENABLE_EXTENSIONS
    else if(arg == "-ext")
      machine->loadExtension();
#endif
  }
  machine->setShowProcess(showProcess);
  int sleepTime = 500 / speed;
  machine->sleepTimeInMilliSeconds = sleepTime;
  machine->sleepTimeInMicroSeconds = sleepTime * 1000;
  return true;
}

string readFile(string path)
{
  ifstream file(path);
  string content;
  if(file.is_open())
  {
    string line;
    while(getline(file, line))
    {
      content += line;
      content += '\n';
    }
    file.close();
  }
  return content;
}

string readFile2(string path)
{
  ifstream file(path);
  string content;
  if(file.is_open())
  {
    string line;
    while(getline(file, line))
      content += line;
    file.close();
  }
  return content;
}

bool askForPath(string& programFile)
{
#ifdef ENABLE_OUTPUT
  cout << "Please enter the path to the TM-Program to be loaded or -: ";
#endif
  getline(cin, programFile);
  return (programFile == "-" || programFile.empty());
}

void getInput(string& input)
{
  if (input == "")
  {
#ifdef ENABLE_OUTPUT
    cout << "Input for run: ";
#endif
    getline(cin, input);
  }
#ifdef ENABLE_OUTPUT
  cout << endl;
#endif
}