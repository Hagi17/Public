///
/// Turing Machine Simulator in C++
///
/// Author: Clemens Hagenbuchner
/// Last edited: 23.03.18
///
/// additional functions file
/// 


#include <string>
#include <iostream>
#include <fstream>
#include <memory>

#include "tmsimfunc.h"

using std::cin;
using std::cout;
using std::endl;
using std::ifstream;
using std::string;
using std::unique_ptr;

namespace TMSim
{

bool handleResult(bool& result, const unique_ptr<TuringMachine>& machine)
{
  if(machine->machineState() == TM::OperationalState::Warning)
  {
#ifndef DISABLE_OUTPUT
  #ifndef DISABLE_WARNINGS
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
  else if(machine->machineState() == TM::OperationalState::BreakPoint)
  {
#ifndef DISABLE_OUTPUT
    char bPchar;
    cin >> bPchar;
    if(bPchar == 'n') return true;
    cout << "Aborted!" << endl;
    result = false;
#else
    return true;
#endif
  }
#ifndef DISABLE_OUTPUT
  cout << machine->printTape() << endl;
  if(!result) cout << "Input rejected!" << endl;
  else cout << "Accepted!" << endl;
#endif
  return false;
}

#ifndef DISABLE_OUTPUT
void printHeader(string version)
{
  cout << "Turing Machine Simulator" << endl;
  cout << "Version " << version << endl;
  cout << endl << "© Clemens Hagenbuchner, 2017" << endl;
  cout << endl << "Use -help for more informations.." << endl;
  cout << endl;
#ifndef DISABLE_LOG
  cout << "logging available" << endl;
#endif
#ifndef DISABLE_EXTENSIONS
  cout << "internal Functions available" << endl;
#endif
#ifndef DISABLE_INCLUDE
  cout << "Sub TMs available" << endl;
#endif
#ifndef DISABLE_TOY
  cout << "Toy File compatible" << endl;
#endif
#ifdef DISABLE_WARNINGS
  cout << "Warnings disabled, may run infinite" << endl;
#endif
#ifndef DISABLE_WILDCARD
  cout << "Wildcard available" << endl;
#endif
#ifdef TAPELIMIT
  cout << "Tapelimit: " << TAPELIMIT << endl;
#endif
#ifdef TAPE_LEFT_END
  cout << "Tape has fixed left end (may cause problems)" << endl;
#endif
}

void printCursor(int fieldCount)
{
  string cursor;
  cursor.append(fieldCount >> 1,' ');
  cursor.append(1,'V');
  cout << cursor << endl;
}

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

void printLoading(const string& programFile)
{
  if(programFile.empty()) return;
  cout << "Loading program: " << programFile << endl;
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

void showTMInfo(const string& comment)
  {
    if(comment.empty()) return;
    cout << "TM-Info: " << endl;
    cout << comment << endl;
}

#endif

int preExit(const bool& exitDirect, const ErrorInfo& info)
{
#ifndef DISABLE_OUTPUT
  handleError(info);
  cout << "Shutdown (press enter) ";
  if(!exitDirect)
    cin.ignore();
  return info.error;
#else 
  return 0;
#endif
}

bool getParameter(int argc, char* argv[], 
    const std::unique_ptr<TuringMachine>& machine, 
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
#ifndef DISABLE_TOY
    else if(arg.substr(0,5) == "-toy=")
    {
      machine->loadToyFile(arg.substr(5));
      gotInput = true;
    }
#endif
#ifndef DISABLE_LOG
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
#ifndef DISABLE_EXTENSIONS
    else if(arg == "-ext")
      machine->loadExtension();
#endif
  }
  machine->setShowProcess(showProcess);
  int sleepTime = 500 / speed;
  machine->setSleepTime(sleepTime);
  return true;
}

string readFile(const string& path)
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

string readFile2(const string& path)
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
#ifndef DISABLE_OUTPUT
  cout << "Please enter the path to the TM-Program to be loaded or -: ";
#endif
  getline(cin, programFile);
  return (programFile == "-" || programFile.empty());
}

void getInput(string& input)
{
  if (input == "")
  {
#ifndef DISABLE_OUTPUT
    cout << "Input for run: ";
#endif
    getline(cin, input);
  }
#ifndef DISABLE_OUTPUT
  cout << endl;
#endif
}

}