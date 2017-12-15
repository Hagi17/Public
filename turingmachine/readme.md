### Turing Machine Simulator (C++)

&copy; Clemens Hagenbuchner, 2017

<u>Source-Files:</u>  
[Main][source/tmsim.cpp]  
[TuringMachine class][source/turingmachine.h]  
[Tape class][source/tape.h]  
[State class][source/state.h]  
[5Tupel class][source/transition.h]  
[Support functions][source/support.h]  

Compile: g++ -std=c++11 -o tm tmsim.cpp

c++11 is minimum standard.

Usage: ./tm <programfile> [-show] [-in=<input>] [-help] [-exit] [-speed=<steps/sec>] [-I<folder>] [-ext] [-out=<file>]

<programfile>   specifies the path to the Programfile (Ending: .tm, .txt)
-show           print the current tape after each step.
-speed=<>       the time for a step when displaying the tape in steps/sec
-tape           specify input (characters on tape)
-help           show this help
-ext            include internal/read, internal/write and internal/clear
-exit           don't ask for enter at the end of the program.
-in=<file>      set the content of file as input on the tape
-out=<file>     store the input and the final output in the specified file
-I<folder>      Add <folder> to the Machines searchpath for TM - Files

internal/read: interprets the content of the tape until '$' as a filepath
                and loads the content on to the tape behind that $ (ignores \n)
internal/write: interprets the content of the tape until '$' as a filepath
                and stores the tape behind the $ in the file
internal/clear: clear complete tape

from internal/write and internal/read you can go on by reading * or $
from internal/clear by reading * or _

Program-Layout:
[#include "<file>"]
name: <name>
init: <state>
accept: <state>[,<state>]
<state>,<input>,<output>,<move>,<newstate>
\/\/comments will be ignored

#include <file> include a Sub-TM (as many as needed)
Name            indicates the Name of the Program (important when used as Sub-TM).
init            indicates the start State of the Program.
accept          indicates the accepted states of the Program.

The 5-Tupel must be specified for each transition
<state>         current state; any case-sensitive string
<input>         if this single character is read, the transition will be triggered
<output>        single character to be written onto the tape
<move>          Move the Head: < (go left), > (go right) or - (stay)
<newstate>      next state; any case-sensitive string

'*' reads any character, '_' reads an empty field
'*' writes no character, '_' writes an empty field

Sub-TM: for <state>/<newstate> use name/state, where name is the name of the sub-TM