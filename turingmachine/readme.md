### Turing Machine Simulator (C++)

&copy; Clemens Hagenbuchner, 2017

**Source-Files:**  
[Main][mainsrc]  
[Turing Machine class][tmsrc_h]  
[Turing Machine class.cpp][tmsrc_cpp]  
[Tape class][tapesrc_h]  
[Tape class.cpp][tapesrc_cpp]  
[State class][statesrc_h]  
[State class.cpp][statesrc_cpp]  
[5Tupel class][tupelsrc_h]  
[5Tupel class.cpp][tupelsrc_cpp]  
[Support functions.h][supsrc_h]  
[Support functions.cpp][supsrc_cpp]  
[TM Sim Functions.h][tmsimfunc_h]  
[TM Sim Functions.cpp][tmsimfunc_cpp]  

**Compile:**  *make*

*c++17* is minimum standard.
There are also a makefile target toytm, simpletm and silenttm available.

**Defines:**  
ADVANCED_OUTPUT for more detailed output during loading  
DISABLE_LOG to disable the log function completly  
DISABLE_EXTENSIONS to disable the internal functions completly  
DISABLE_OUTPUT to disable any output (only output via files)  
DISABLE_TOY to disable the -toy argument for toy files  
DISABLE_WARNINGS to disable the stop at warnings (certain amount of steps)  
DISABLE_WILDCARD to disable wildcard processing  
DISABLE_INCLUDE to disable wildcard processing  
TAPELIMIT n to limit the tape size to n  
TAPE_LEFT_END to make the tape fixed on one side  

**Usage:**  
*./tm &lt;programfile&gt; [-show] [-help] [-exit] [-in=&lt;file&gt;] [-tape=&lt;input&gt;] [-speed=&lt;steps/sec&gt;] [-I&lt;folder&gt;] [-out=&lt;file&gt;] [...]*

*&lt;programfile&gt;*   specifies the path to the Programfile (Ending: .tm, .txt)  
*-show*           print the current tape after each step.  
*-speed=&lt;&gt;*       the time for a step when displaying the tape in steps/sec  
*-tape*           specify input (characters on tape)  
*-help*           show this help  
*-ext*            include internal/read, internal/write and internal/clear  
*-exit*           don't ask for enter at the end of the program.  
*-in=&lt;file&gt;*      set the content of file as input on the tape  
*-in2=&lt;file&gt;*      set the content of file as input on the tape (no \n)  
*-out=&lt;file&gt;*     store the input and the final output in the specified file  
*-hex=&lt;file&gt;*     set the content of a hex-style file as input on the tape  
*-I&lt;folder&gt;*      Add &lt;folder&gt; to the Machines searchpath for TM - Files  
*-stdin=&lt;file&gt;*   set the filepath as standad input source (internal/stdin)  
*-stdout=&lt;file&gt;*  set the filepath as standard output destination (internal/stdout)  
*-log=&lt;file&gt;*     set a file as logging output (all accessed states will be logged)  

**hex-style file:**  
all characters are encoded in hex, using two ascii letters or digits: ff00f4...   

---

**Internal Functions**

*internal/read:* interprets the content of the tape until '$' as a filepath  
                and loads the content on to the tape behind that $ (ignores \n)
                
*internal/write:* interprets the content of the tape until '$' as a filepath  
                and stores the tape behind the $ in the file  
                
*internal/clear:* clear complete tape  

*internal/goLeft:* go to the left end of the tape

*internal/goRight:* go to the right end of the tape

*internal/setAsterix:* write an \* onto the Tape

*internal/copy:* copy the current character into a internal memory

*internal/parse:* write the character stored in the internal memory onto the tape  

*internal/stdin:* read a character from the std input  

*internal/stdout:* write the current character to the output  

*internal/showon:* enable tape and state output on the console  

*internal/showoff:* disable tape and state output on the console  


---

**Program-Layout:**    
\[#include "&lt;file&gt;" \[AS &lt;prefix&gt;\[(template character, template movenr = %)\]\]\]  
\[#include INTERNAL\]
name: &lt;name&gt;  
init: &lt;state&gt;  
accept: &lt;state&gt;\[,&lt;state&gt;\]  
&lt;state&gt;,&lt;input&gt;,&lt;output&gt;,&lt;move&gt;\[count\],\[&lt;internal&gt;\]&lt;newstate&gt;\[!\]  
//comments will be ignored  

*#include &lt;file&gt;* includes a Sub-TM (as many as needed)  
   with AS &lt;prefix&gt; a override prefix for this TM can be specified, this way multiple instances of a TM can be loaded and used 
   with (template character) a template character for this TM-Program instance can be specified   
*#include INTERNAL* includes the internal functions  
*Name*            indicates the Name of the Program (important when used as Sub-TM).  
*init*            indicates the start State of the Program.  
*accept*          indicates the accepted states of the Program.  

The 5-Tupel must be specified for each transition  
*&lt;state&gt;*         current state; any case-sensitive string  
*&lt;input&gt;*         if this single character is read, the transition will be triggered  
*&lt;output&gt;*        single character to be written onto the tape  
*&lt;move&gt;*          Move the Head: &lt; (go left), &gt; (go right) or - (stay), &lt;&amp;&gt; can be followed by a number or % to increase the number of fields moved over  
*&lt;internal&gt;*      Execute an internal Function before the state-Transition  
*&lt;newstate&gt;*      next state; any case-sensitive string  
*!*                      indicates a breakpoint, where the machine will halt

A *!* before the statename indicates a fixed state, this statename won't be changed when 
loaded as Sub-TM or #include AS  

'\*' reads any character, '\_' reads an empty field  
'\*' writes no character, '\_' writes an empty field  
*%tmpl%* will be replaced by the specified template character for this instance (standard: '\_')  
'ic' before the input Character specifies that both upper and lower case will be read  
input and output can also be specified in hex-notation  

All commentlines before any other line (except for empty lines) will be displayed 
when running the TM File as Main. 

Sub-TM: for &lt;state&gt;/&lt;newstate&gt; use name/state, where name is the name of the sub-TM or the specified prefix  
Internal Functions:  they can also be specified as newstates, that way you need a transition from that state  

---

Under /code you will find some TuringMachine-Programs:  
CopyBinary: Copy some characters (0,1,o,z,_) to the right CopyBinary  
Invert: Invert a binary number  
rshift: Shift a binary number one place to the right  
lshiftAZ: Shift a text one place to the left   
cryptmono: Encrypt or Decrypt a Text using Monoalphabetic Encryption  
Encrypt or Decrypt a Text using [ENIGMA](code/enigma/enigma.tm)  
increment/decrement: Increment/Decrement a binary number  
multiplyr: Multiply two binary numbers   
addr: Add two binary numbers  
Toy-Code Interpreter [Toy](code/toytm/toytm.tm)  

[mainsrc]: source/tmsim.cpp  
[tmsrc_cpp]: source/turingmachine.cpp  
[tmsrc_h]: source/include/turingmachine.h  
[tapesrc_cpp]: source/tape.cpp  
[tapesrc_h]: source/include/tape.h  
[statesrc_cpp]: source/state.cpp  
[statesrc_h]: source/include/state.h  
[tupelsrc_cpp]: source/transition.cpp  
[tupelsrc_h]: source/include/transition.h  
[supsrc_cpp]: source/support.cpp  
[supsrc_h]: source/include/support.h  
[tmsimfunc_cpp]: source/tmsimfunc.cpp
[tmsimfunc_h]: source/include/tmsimfunc.h
