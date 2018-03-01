## Changelog

---

### Version 1.1.1

__28.02.18__

- Added option to move head more than one field
- Introduced internal/stdin and internal/stdout
- Added Command Line Argument -stdin and -stdout

### Version 1.1.0

__27.02.18__

- Added Option to use Hex-Format for input/output
- Added internal/copy and internal/parse for easier copying of characters on the tape
- Added Command Line Argument -hex to load Input from HEX-Style File
- Added Command Line Argument -in2 to load from Input file without the \n
- Reversed search if state is known (for better performance)

### Version 1.0.5a

__22.12.17__

- Added Identifier for fixed state names

---

### Version 1.0.4c

__21.12.17__

- Simplified Source 

--- 

### Version 1.0.4b

__20.12.17__

- Added "ic" prefix for input (ignore Case)
- Extended template support

### Version 1.0.4a

__20.12.17__

- Added support for using template characters in TM Programs
- Added HeadComment: first Comment in main TM-File will be displayed before running

---

### Version 1.0.3a

__19.12.17__

- Fixed a bug when including a Sub-Sub-TM without using AS


- Added *#include* *INTERNAL*
- Added *#include* *AS*
- Added optional *&lt;internal&gt;* to 5-Tupel
- Added some new internal functions.

---

### Version 1.0.2a

__16.12.17__

- Fixed Bug in internal/read and preseting Tape with File

---

### Version 1.0.1

__16.12.17__

- Fixed comparing states bug

__15.12.17__

- Fixed bug with Sub-Sub-TMs


- Revised Help Output
- Revised Usage Comment


- Added Breakpoints
- Added Support for \n, \r and \b on the Tape
- Added MachineState
- Revised Loop-State-Detection


- Added *-tape* Argument to preset the tape
- Changed *-in* Argument to specify input file for presetting tape
- Revised Help-Output
- Revised File Header

---

#### Version 1.0.0

__15.12.17__

- Added File Header


- Published Turing Machine

---