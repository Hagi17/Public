### Turing Machine Simulator (C++)

&copy; Clemens Hagenbuchner, 2017

**Source-Files:**  
[Main][mainsrc]  
[Turing Machine class][tmsrc]  
[Tape class][tapesrc]  
[State class][statesrc]  
[5Tupel class][tupelsrc]  
[Support functions][supsrc]  

**Compile:**  *g++ -std=c++11 -o tm tmsim.cpp*

*c++11* is minimum standard.

**Usage:**  
*./tm &lt;programfile&gt; [-show] [-help] [-exit] [-in=&lt;file&gt;] [-tape=&lt;input&gt;] [-speed=&lt;steps/sec&gt;] [-I&lt;folder&gt;] [-ext] [-out=&lt;file&gt;]*

*&lt;programfile&gt;*   specifies the path to the Programfile (Ending: .tm, .txt)  
*-show*           print the current tape after each step.  
*-speed=&lt;&gt;*       the time for a step when displaying the tape in steps/sec  
*-tape*           specify input (characters on tape)  
*-help*           show this help  
*-ext*            include internal/read, internal/write and internal/clear  
*-exit*           don't ask for enter at the end of the program.  
*-in=&lt;file&gt;*      set the content of file as input on the tape  
*-out=&lt;file&gt;*     store the input and the final output in the specified file  
*-I&lt;folder&gt;*      Add &lt;folder&gt; to the Machines searchpath for TM - Files  

*internal/read:* interprets the content of the tape until '$' as a filepath  
                and loads the content on to the tape behind that $ (ignores \n)
                
*internal/write:* interprets the content of the tape until '$' as a filepath  
                and stores the tape behind the $ in the file  
                
*internal/clear:* clear complete tape  

from internal/write and internal/read you can go on by reading * or $  
from internal/clear by reading * or _  

---

**Program-Layout:**    
\[#include "&lt;file&gt;"\]  
name: &lt;name&gt;  
init: &lt;state&gt;  
accept: &lt;state&gt;[,&lt;state&gt;]  
&lt;state&gt;,&lt;input&gt;,&lt;output&gt;,&lt;move&gt;,&lt;newstate&gt;[!]  
//comments will be ignored  

*#include &lt;file&gt;* includes a Sub-TM (as many as needed)  
*Name*            indicates the Name of the Program (important when used as Sub-TM).  
*init*            indicates the start State of the Program.  
*accept*          indicates the accepted states of the Program.  

The 5-Tupel must be specified for each transition  
*&lt;state&gt;*         current state; any case-sensitive string  
*&lt;input&gt;*         if this single character is read, the transition will be triggered  
*&lt;output&gt;*        single character to be written onto the tape  
*&lt;move&gt;*          Move the Head: &lt; (go left), &gt; (go right) or - (stay)  
*&lt;newstate&gt;*      next state; any case-sensitive string  
*!*                      indicates a breakpoint, where the machine will halt

'\*' reads any character, '\_' reads an empty field  
'\*' writes no character, '\_' writes an empty field  

Sub-TM: for &lt;state&gt;/&lt;newstate&gt; use name/state, where name is the name of the sub-TM

---

Under /code you will find some TuringMachine-Programs:  
Copy some characters (0,1,o,z,_) to the right [CopyBinary](code/copybinary.tm)  
Invert a binary number [Invert](code/not.tm)  
Shift a binary number one place to the right [rshift](code/rshift.tm)  

[mainsrc]: source/tmsim.cpp  
[tmsrc]: source/turingmachine.h  
[tapesrc]: source/tape.h  
[statesrc]: source/state.h  
[tupelsrc]: source/transition.h 
[supsrc]: source/support.h  