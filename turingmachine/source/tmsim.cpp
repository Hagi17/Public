///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 15.12.17
///
/// main project file
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

#define VERSION "1.0.1"
#define IO_ERROR 2

using namespace std;

bool getParameter(int argc, char* argv[], TuringMachine* machine, 
    string& programFile, string& input, bool& exitDirect, bool& saveOnExit,
    string& saveFile);
bool askForPath(string& programFile);
void getInput(string& input);
int preExit(bool exitDirect, ErrorInfo info);
void printHeader(string version);
void printCursor(int fieldCount = 60);
void printHelp();
bool handleResult(bool result, TuringMachine* machine);
void handleError(ErrorInfo info);
string readFile(string path);
void printLoading(string programFile);

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
  int fieldCount = 60;
  bool showProcess = false;
  bool exitDirect = false;
  bool saveOnExit = false;
  string saveFile = "";
  string programFile = "";
  string input = "";
  ErrorInfo errorInfo;
  
  TuringMachine* machine = new TuringMachine();
  
  printHeader(VERSION);
  
  getParameter(argc, argv, machine, programFile, input, exitDirect, saveOnExit,
    saveFile);
  
  if(programFile.compare("?help") == 0 || 
    programFile.compare("-help") == 0)
  {
    printHelp();
    delete machine;  
    return preExit(exitDirect, errorInfo);
  }
  
  printLoading(programFile);
  
  if(!machine->loadProgram(programFile, errorInfo))
  {
    delete machine;  
    errorInfo.error = IO_ERROR;
    return preExit(exitDirect, errorInfo);
  }
  
  getInput(input); //read input if not any specified
  machine->loadInput(input);
  
  printCursor(fieldCount);
  
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

void handleError(ErrorInfo info)
{
  if(info.error == IO_ERROR && info.file.compare("-") != 0)
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

bool handleResult(bool result, TuringMachine* machine)
{
  if(machine->machineState() == Warning)
  {
    char questChar;
    cout << "The machine seems to be stuck! Ignore (n) or Abort (y) ? ";
    cin >> questChar;
    if(questChar == 'n') return true;
    cout << "Aborted!" << endl;
    result = false;
  }
  else if(machine->machineState() == BreakPoint)
  {
    char bPchar;
    cin >> bPchar;
    if(bPchar == 'n') return true;
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
  cout << "Usage: ./tm <programfile> [-show] [-in=<file>] [-help] [-exit]";
  cout << " [-speed=<steps/sec>] [-I<folder>] [-ext] [-out=<file>]" << endl;
  cout << "\t[-tape=<input>]"<<endl;
  cout << endl;
  cout << "<programfile>\tspecifies the path to the Programfile (Ending: .tm, .txt)" << endl;
  cout << "-show\t\tprint the current tape after each step." << endl;
  cout << "-speed=<>\tthe time for a step when displaying the tape in steps/sec" << endl;
  cout << "-tape\t\tspecify input (characters on tape)" << endl;
  cout << "-help\t\tshow this help" << endl;
  cout << "-ext\t\tinclude internal/read, internal/write and internal/clear" << endl;
  cout << "-exit\t\tdon't ask for enter at the end of the program.";
  cout << endl;
  cout << "-in=<file>\tset the content of file as input on the tape" << endl;
  cout << "-out=<file>\tstore the input and the final output in the specified file";
  cout << endl;
  cout << "-I<folder>\tAdd <folder> to the Machines searchpath for TM - Files";
  cout << endl << endl;
  cout << "internal/read: interprets the content of the tape until '$' as a filepath" << endl;
  cout << "\t\tand loads the content on to the tape behind that $ (ignores \\n)" << endl;
  cout << "internal/write: interprets the content of the tape until '$' as a filepath" << endl;
  cout << "\t\tand stores the tape behind the $ in the file" << endl;
  cout << "internal/clear: clear complete tape" << endl;
  cout << endl;
  cout << "from internal/write and internal/read you can go on by reading * or $" << endl;
  cout << "from internal/clear by reading * or _" << endl << endl;
  cout << "Program-Layout: " << endl;
  cout << "[#include \"<file>\"]" << endl;
  cout << "name: <name>" << endl;
  cout << "init: <state>" << endl;
  cout << "accept: <state>[,<state>]" << endl;
  cout << "<state>,<input>,<output>,<move>,<newstate>" << endl;
  cout << "//comments will be ignored" << endl;
  cout << endl;
  cout << "#include <file>\tinclude a Sub-TM (as many as needed)" << endl;
  cout << "Name\t\tindicates the Name of the Program (important when used as Sub-TM)." << endl;
  cout << "init\t\tindicates the start State of the Program." << endl;
  cout << "accept\t\tindicates the accepted states of the Program." << endl;
  cout << endl;
  cout << "The 5-Tupel must be specified for each transition" << endl;
  cout << "<state>\t\tcurrent state; any case-sensitive string" << endl;
  cout << "<input>\t\tif this single character is read, the transition will be triggered" << endl;
  cout << "<output>\tsingle character to be written onto the tape"<< endl;
  cout << "<move>\t\tMove the Head: < (go left), > (go right) or - (stay)" << endl;
  cout << "<newstate>\tnext state; any case-sensitive string"<<endl;
  cout << endl;
  cout << "'*' reads any character, '_' reads an empty field" << endl;
  cout << "'*' writes no character, '_' writes an empty field" << endl;
  cout << endl;
  cout << "A ! at the end of a transition indicates a breakpoint, where the";
  cout << " machine halts and waits for input;"<<endl<<"with n the program goes on.";
  cout << endl << endl;
  cout << "Sub-TM:\tfor <state>/<newstate> use name/state, where name is the name of the sub-TM" << endl;
}

void printCursor(int fieldCount)
{
  string cursor = "";
  cursor.append(fieldCount >> 1,' ');
  cursor.append(1,'V');
  cout << cursor << endl;
}

void printHeader(string version)
{
  cout << "Turing Machine Simulator" << endl;
  cout << "Version " << version << endl;
  cout << endl << "© Clemens Hagenbuchner, 2017" << endl;
  cout << endl << "Use -help for more informations.." << endl;
  cout << endl;
}

void printLoading(string programFile)
{
  if(programFile.empty()) return;
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
      input = readFile(arg.substr(4));
    else if(arg.substr(0,6).compare("-tape=") == 0)
      input = arg.substr(6);
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

string readFile(string path)
{
  ifstream file(path);
  string content = "";
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
  cout << endl;
}