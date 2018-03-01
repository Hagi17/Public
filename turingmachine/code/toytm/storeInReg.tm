//pointer stands on Reg-Nr
//copies value in working space to Reg[Nr] with cleaning the working space
//end: pointer on Reg[Nr] most right Nibble
name: storeInReg
init: run
accept: end

//speed up goreg and set and govN

//copy nr to working space (w5: n, w6: nr)
run,0,0,<,clearw
clearw,w,w,>,clear1
clearw,*,*,>,clearw
clear1,*,0,>,clear2
clear2,*,0,>,clear3
clear3,*,0,>,clear4
clear4,*,0,<,goReg0
goReg0,r,r,>4,end
//passt 85?
goReg0,w,w,<85,goReg0
goreg0,_,_,-,error
goReg0,*,*,<,goReg0

run,1,1,>,setNr1
run,2,2,>,setNr2
run,3,3,>,setNr3
run,4,4,>,setNr4
run,5,5,>,setNr5
run,6,6,>,setNr6
run,7,7,>,setNr7
run,8,8,>,setNr8
run,9,9,>,setNr9
run,A,A,>,setNrA
run,B,B,>,setNrB
run,C,C,>,setNrC
run,D,D,>,setNrD
run,E,E,>,setNrE
run,F,F,>,setNrF

setNr1,w,w,>5,setv1
setNr1,*,*,>,setNr1
setv1,*,v,>,setNrV1
setNrV1,*,1,<5,cpyN1To1

setNr2,w,w,>5,setv2
setNr2,*,*,>,setNr2
setv2,*,v,>,setNrV2
setNrV2,*,2,<5,cpyN1To2

setNr3,w,w,>5,setv3
setNr3,*,*,>,setNr3
setv3,*,v,>,setNrV3
setNrV3,*,3,<5,cpyN1To3

setNr4,w,w,>5,setv4
setNr4,*,*,>,setNr4
setv4,*,v,>,setNrV4
setNrV4,*,4,<5,cpyN1To4

setNr5,w,w,>5,setv5
setNr5,*,*,>,setNr5
setv5,*,v,>,setNrV5
setNrV5,*,5,<5,cpyN1To5

setNr6,w,w,>5,setv6
setNr6,*,*,>,setNr6
setv6,*,v,>,setNrV6
setNrV6,*,6,<5,cpyN1To6

setNr7,w,w,>5,setv7
setNr7,*,*,>,setNr7
setv7,*,v,>,setNrV7
setNrV7,*,7,<5,cpyN1To7

setNr8,w,w,>5,setv8
setNr8,*,*,>,setNr8
setv8,*,v,>,setNrV8
setNrV8,*,8,<5,cpyN1To8

setNr9,w,w,>5,setv9
setNr9,*,*,>,setNr9
setv9,*,v,>,setNrV9
setNrV9,*,9,<5,cpyN1To9

setNrA,w,w,>5,setvA
setNrA,*,*,>,setNrA
setvA,*,v,>,setNrVA
setNrVA,*,A,<5,cpyN1ToA

setNrB,w,w,>5,setvB
setNrB,*,*,>,setNrB
setvB,*,v,>,setNrVB
setNrVB,*,B,<5,cpyN1ToB

setNrC,w,w,>5,setvC
setNrC,*,*,>,setNrC
setvC,*,v,>,setNrVC
setNrVC,*,C,<5,cpyN1ToC

setNrD,w,w,>5,setvD
setNrD,*,*,>,setNrD
setvD,*,v,>,setNrVD
setNrVD,*,D,<5,cpyN1ToD

setNrE,w,w,>5,setvE
setNrE,*,*,>,setNrE
setvE,*,v,>,setNrVE
setNrVE,*,E,<5,cpyN1ToE

setNrF,w,w,>5,setvF
setNrF,*,*,>,setNrF
setvF,*,v,>,setNrVF
setNrVF,*,F,<5,cpyN1ToF

//...
cpyN1To1,0,0,<85,cpyN1To1V0
cpyN1To1,_,0,<85,cpyN1To1V0
cpyN1To1,1,0,<85,cpyN1To1V1
cpyN1To1,2,0,<85,cpyN1To1V2
cpyN1To1,3,0,<85,cpyN1To1V3
cpyN1To1,4,0,<85,cpyN1To1V4
cpyN1To1,5,0,<85,cpyN1To1V5
cpyN1To1,6,0,<85,cpyN1To1V6
cpyN1To1,7,0,<85,cpyN1To1V7
cpyN1To1,8,0,<85,cpyN1To1V8
cpyN1To1,9,0,<85,cpyN1To1V9
cpyN1To1,A,0,<85,cpyN1To1VA
cpyN1To1,B,0,<85,cpyN1To1VB
cpyN1To1,C,0,<85,cpyN1To1VC
cpyN1To1,D,0,<85,cpyN1To1VD
cpyN1To1,E,0,<85,cpyN1To1VE
cpyN1To1,F,0,<85,cpyN1To1VF

cpyN1To1V0,r,r,>5,setN1V0
cpyN1To1V0,*,*,<,cpyN1To1V0
setN1V0,*,0,<5,govN2
govN2,p,p,>25,govN2
govN2,v,v,>,cpyN2
govN2,*,*,>,govN2

cpyN1To1V1,r,r,>5,setN1V1
cpyN1To1V1,*,*,<,cpyN1To1V1
setN1V1,*,1,>,govN2

cpyN1To1V2,r,r,>5,setN1V2
cpyN1To1V2,*,*,<,cpyN1To1V2
setN1V2,*,2,>,govN2

cpyN1To1V3,r,r,>5,setN1V3
cpyN1To1V3,*,*,<,cpyN1To1V3
setN1V3,*,3,>,govN2

cpyN1To1V4,r,r,>5,setN1V4
cpyN1To1V4,*,*,<,cpyN1To1V4
setN1V4,*,4,>,govN2

cpyN1To1V5,r,r,>5,setN1V5
cpyN1To1V5,*,*,<,cpyN1To1V5
setN1V5,*,5,>,govN2

cpyN1To1V6,r,r,>5,setN1V6
cpyN1To1V6,*,*,<,cpyN1To1V6
setN1V6,*,6,>,govN2

cpyN1To1V7,r,r,>5,setN1V7
cpyN1To1V7,*,*,<,cpyN1To1V7
setN1V7,*,7,>,govN2

cpyN1To1V8,r,r,>5,setN1V8
cpyN1To1V8,*,*,<,cpyN1To1V8
setN1V8,*,8,>,govN2

cpyN1To1V9,r,r,>5,setN1V9
cpyN1To1V9,*,*,<,cpyN1To1V9
setN1V9,*,9,>,govN2

cpyN1To1VA,r,r,>5,setN1VA
cpyN1To1VA,*,*,<,cpyN1To1VA
setN1VA,*,A,>,govN2

cpyN1To1VB,r,r,>5,setN1VB
cpyN1To1VB,*,*,<,cpyN1To1VB
setN1VB,*,B,>,govN2

cpyN1To1VC,r,r,>5,setN1VC
cpyN1To1VC,*,*,<,cpyN1To1VC
setN1VC,*,C,>,govN2

cpyN1To1VD,r,r,>5,setN1VD
cpyN1To1VD,*,*,<,cpyN1To1VD
setN1VD,*,D,>,govN2

cpyN1To1VE,r,r,>5,setN1VE
cpyN1To1VE,*,*,<,cpyN1To1VE
setN1VE,*,E,<5,govN2

cpyN1To1VF,r,r,>5,setN1VF
cpyN1To1VF,*,*,<,cpyN1To1VF
setN1VF,*,F,>,govN2

//-
cpyN1To2,0,0,<85,cpyN1To2V0
cpyN1To2,_,0,<85,cpyN1To2V0
cpyN1To2,1,0,<85,cpyN1To2V1
cpyN1To2,2,0,<85,cpyN1To2V2
cpyN1To2,3,0,<85,cpyN1To2V3
cpyN1To2,4,0,<85,cpyN1To2V4
cpyN1To2,5,0,<85,cpyN1To2V5
cpyN1To2,6,0,<85,cpyN1To2V6
cpyN1To2,7,0,<85,cpyN1To2V7
cpyN1To2,8,0,<85,cpyN1To2V8
cpyN1To2,9,0,<85,cpyN1To2V9
cpyN1To2,A,0,<85,cpyN1To2VA
cpyN1To2,B,0,<85,cpyN1To2VB
cpyN1To2,C,0,<85,cpyN1To2VC
cpyN1To2,D,0,<85,cpyN1To2VD
cpyN1To2,E,0,<85,cpyN1To2VE
cpyN1To2,F,0,<85,cpyN1To2VF

cpyN1To2V0,r,r,>9,setN1V0
cpyN1To2V0,*,*,<,cpyN1To2V0

cpyN1To2V1,r,r,>9,setN1V1
cpyN1To2V1,*,*,<,cpyN1To2V1

cpyN1To2V2,r,r,>9,setN1V2
cpyN1To2V2,*,*,<,cpyN1To2V2

cpyN1To2V3,r,r,>9,setN1V3
cpyN1To2V3,*,*,<,cpyN1To2V3

cpyN1To2V4,r,r,>9,setN1V4
cpyN1To2V4,*,*,<,cpyN1To2V4

cpyN1To2V5,r,r,>9,setN1V5
cpyN1To2V5,*,*,<,cpyN1To2V5

cpyN1To2V6,r,r,>9,setN1V6
cpyN1To2V6,*,*,<,cpyN1To2V6

cpyN1To2V7,r,r,>9,setN1V7
cpyN1To2V7,*,*,<,cpyN1To2V7

cpyN1To2V8,r,r,>9,setN1V8
cpyN1To2V8,*,*,<,cpyN1To2V8

cpyN1To2V9,r,r,>9,setN1V9
cpyN1To2V9,*,*,<,cpyN1To2V9

cpyN1To2VA,r,r,>9,setN1VA
cpyN1To2VA,*,*,<,cpyN1To2VA

cpyN1To2VB,r,r,>9,setN1VB
cpyN1To2VB,*,*,<,cpyN1To2VB

cpyN1To2VC,r,r,>9,setN1VC
cpyN1To2VC,*,*,<,cpyN1To2VC

cpyN1To2VD,r,r,>9,setN1VD
cpyN1To2VD,*,*,<,cpyN1To2VD

cpyN1To2VE,r,r,>9,setN1VE
cpyN1To2VE,*,*,<,cpyN1To2VE

cpyN1To2VF,r,r,>9,setN1VF
cpyN1To2VF,*,*,<,cpyN1To2VF

//-
cpyN1To3,0,0,<85,cpyN1To3V0
cpyN1To3,_,0,<85,cpyN1To3V0
cpyN1To3,1,0,<85,cpyN1To3V1
cpyN1To3,2,0,<85,cpyN1To3V2
cpyN1To3,3,0,<85,cpyN1To3V3
cpyN1To3,4,0,<85,cpyN1To3V4
cpyN1To3,5,0,<85,cpyN1To3V5
cpyN1To3,6,0,<85,cpyN1To3V6
cpyN1To3,7,0,<85,cpyN1To3V7
cpyN1To3,8,0,<85,cpyN1To3V8
cpyN1To3,9,0,<85,cpyN1To3V9
cpyN1To3,A,0,<85,cpyN1To3VA
cpyN1To3,B,0,<85,cpyN1To3VB
cpyN1To3,C,0,<85,cpyN1To3VC
cpyN1To3,D,0,<85,cpyN1To3VD
cpyN1To3,E,0,<85,cpyN1To3VE
cpyN1To3,F,0,<85,cpyN1To3VF

cpyN1To3V0,r,r,>13,setN1V0
cpyN1To3V0,*,*,<,cpyN1To3V0

cpyN1To3V1,r,r,>13,setN1V1
cpyN1To3V1,*,*,<,cpyN1To3V1

cpyN1To3V2,r,r,>13,setN1V2
cpyN1To3V2,*,*,<,cpyN1To3V2

cpyN1To3V3,r,r,>13,setN1V3
cpyN1To3V3,*,*,<,cpyN1To3V3

cpyN1To3V4,r,r,>13,setN1V4
cpyN1To3V4,*,*,<,cpyN1To3V4

cpyN1To3V5,r,r,>13,setN1V5
cpyN1To3V5,*,*,<,cpyN1To3V5

cpyN1To3V6,r,r,>13,setN1V6
cpyN1To3V6,*,*,<,cpyN1To3V6

cpyN1To3V7,r,r,>13,setN1V7
cpyN1To3V7,*,*,<,cpyN1To3V7

cpyN1To3V8,r,r,>13,setN1V8
cpyN1To3V8,*,*,<,cpyN1To3V8

cpyN1To3V9,r,r,>13,setN1V9
cpyN1To3V9,*,*,<,cpyN1To3V9

cpyN1To3VA,r,r,>13,setN1VA
cpyN1To3VA,*,*,<,cpyN1To3VA

cpyN1To3VB,r,r,>13,setN1VB
cpyN1To3VB,*,*,<,cpyN1To3VB

cpyN1To3VC,r,r,>13,setN1VC
cpyN1To3VC,*,*,<,cpyN1To3VC

cpyN1To3VD,r,r,>13,setN1VD
cpyN1To3VD,*,*,<,cpyN1To3VD

cpyN1To3VE,r,r,>13,setN1VE
cpyN1To3VE,*,*,<,cpyN1To3VE

cpyN1To3VF,r,r,>13,setN1VF
cpyN1To3VF,*,*,<,cpyN1To3VF

//-
cpyN1To4,0,0,<85,cpyN1To4V0
cpyN1To4,_,0,<85,cpyN1To4V0
cpyN1To4,1,0,<85,cpyN1To4V1
cpyN1To4,2,0,<85,cpyN1To4V2
cpyN1To4,3,0,<85,cpyN1To4V3
cpyN1To4,4,0,<85,cpyN1To4V4
cpyN1To4,5,0,<85,cpyN1To4V5
cpyN1To4,6,0,<85,cpyN1To4V6
cpyN1To4,7,0,<85,cpyN1To4V7
cpyN1To4,8,0,<85,cpyN1To4V8
cpyN1To4,9,0,<85,cpyN1To4V9
cpyN1To4,A,0,<85,cpyN1To4VA
cpyN1To4,B,0,<85,cpyN1To4VB
cpyN1To4,C,0,<85,cpyN1To4VC
cpyN1To4,D,0,<85,cpyN1To4VD
cpyN1To4,E,0,<85,cpyN1To4VE
cpyN1To4,F,0,<85,cpyN1To4VF

cpyN1To4V0,r,r,>17,setN1V0
cpyN1To4V0,*,*,<,cpyN1To4V0

cpyN1To4V1,r,r,>17,setN1V1
cpyN1To4V1,*,*,<,cpyN1To4V1

cpyN1To4V2,r,r,>17,setN1V2
cpyN1To4V2,*,*,<,cpyN1To4V2

cpyN1To4V3,r,r,>17,setN1V3
cpyN1To4V3,*,*,<,cpyN1To4V3

cpyN1To4V4,r,r,>17,setN1V4
cpyN1To4V4,*,*,<,cpyN1To4V4

cpyN1To4V5,r,r,>17,setN1V5
cpyN1To4V5,*,*,<,cpyN1To4V5

cpyN1To4V6,r,r,>17,setN1V6
cpyN1To4V6,*,*,<,cpyN1To4V6

cpyN1To4V7,r,r,>17,setN1V7
cpyN1To4V7,*,*,<,cpyN1To4V7

cpyN1To4V8,r,r,>17,setN1V8
cpyN1To4V8,*,*,<,cpyN1To4V8

cpyN1To4V9,r,r,>17,setN1V9
cpyN1To4V9,*,*,<,cpyN1To4V9

cpyN1To4VA,r,r,>17,setN1VA
cpyN1To4VA,*,*,<,cpyN1To4VA

cpyN1To4VB,r,r,>17,setN1VB
cpyN1To4VB,*,*,<,cpyN1To4VB

cpyN1To4VC,r,r,>17,setN1VC
cpyN1To4VC,*,*,<,cpyN1To4VC

cpyN1To4VD,r,r,>17,setN1VD
cpyN1To4VD,*,*,<,cpyN1To4VD

cpyN1To4VE,r,r,>17,setN1VE
cpyN1To4VE,*,*,<,cpyN1To4VE

cpyN1To4VF,r,r,>17,setN1VF
cpyN1To4VF,*,*,<,cpyN1To4VF

//-
cpyN1To5,0,0,<85,cpyN1To5V0
cpyN1To5,_,0,<85,cpyN1To5V0
cpyN1To5,1,0,<85,cpyN1To5V1
cpyN1To5,2,0,<85,cpyN1To5V2
cpyN1To5,3,0,<85,cpyN1To5V3
cpyN1To5,4,0,<85,cpyN1To5V4
cpyN1To5,5,0,<85,cpyN1To5V5
cpyN1To5,6,0,<85,cpyN1To5V6
cpyN1To5,7,0,<85,cpyN1To5V7
cpyN1To5,8,0,<85,cpyN1To5V8
cpyN1To5,9,0,<85,cpyN1To5V9
cpyN1To5,A,0,<85,cpyN1To5VA
cpyN1To5,B,0,<85,cpyN1To5VB
cpyN1To5,C,0,<85,cpyN1To5VC
cpyN1To5,D,0,<85,cpyN1To5VD
cpyN1To5,E,0,<85,cpyN1To5VE
cpyN1To5,F,0,<85,cpyN1To5VF

cpyN1To5V0,r,r,>21,setN1V0
cpyN1To5V0,*,*,<,cpyN1To5V0

cpyN1To5V1,r,r,>21,setN1V1
cpyN1To5V1,*,*,<,cpyN1To5V1

cpyN1To5V2,r,r,>21,setN1V2
cpyN1To5V2,*,*,<,cpyN1To5V2

cpyN1To5V3,r,r,>21,setN1V3
cpyN1To5V3,*,*,<,cpyN1To5V3

cpyN1To5V4,r,r,>21,setN1V4
cpyN1To5V4,*,*,<,cpyN1To5V4

cpyN1To5V5,r,r,>21,setN1V5
cpyN1To5V5,*,*,<,cpyN1To5V5

cpyN1To5V6,r,r,>21,setN1V6
cpyN1To5V6,*,*,<,cpyN1To5V6

cpyN1To5V7,r,r,>21,setN1V7
cpyN1To5V7,*,*,<,cpyN1To5V7

cpyN1To5V8,r,r,>21,setN1V8
cpyN1To5V8,*,*,<,cpyN1To5V8

cpyN1To5V9,r,r,>21,setN1V9
cpyN1To5V9,*,*,<,cpyN1To5V9

cpyN1To5VA,r,r,>21,setN1VA
cpyN1To5VA,*,*,<,cpyN1To5VA

cpyN1To5VB,r,r,>21,setN1VB
cpyN1To5VB,*,*,<,cpyN1To5VB

cpyN1To5VC,r,r,>21,setN1VC
cpyN1To5VC,*,*,<,cpyN1To5VC

cpyN1To5VD,r,r,>21,setN1VD
cpyN1To5VD,*,*,<,cpyN1To5VD

cpyN1To5VE,r,r,>21,setN1VE
cpyN1To5VE,*,*,<,cpyN1To5VE

cpyN1To5VF,r,r,>21,setN1VF
cpyN1To5VF,*,*,<,cpyN1To5VF

//-
cpyN1To6,0,0,<85,cpyN1To6V0
cpyN1To6,_,0,<85,cpyN1To6V0
cpyN1To6,1,0,<85,cpyN1To6V1
cpyN1To6,2,0,<85,cpyN1To6V2
cpyN1To6,3,0,<85,cpyN1To6V3
cpyN1To6,4,0,<85,cpyN1To6V4
cpyN1To6,5,0,<85,cpyN1To6V5
cpyN1To6,6,0,<85,cpyN1To6V6
cpyN1To6,7,0,<85,cpyN1To6V7
cpyN1To6,8,0,<85,cpyN1To6V8
cpyN1To6,9,0,<85,cpyN1To6V9
cpyN1To6,A,0,<85,cpyN1To6VA
cpyN1To6,B,0,<85,cpyN1To6VB
cpyN1To6,C,0,<85,cpyN1To6VC
cpyN1To6,D,0,<85,cpyN1To6VD
cpyN1To6,E,0,<85,cpyN1To6VE
cpyN1To6,F,0,<85,cpyN1To6VF

cpyN1To6V0,r,r,>25,setN1V0
cpyN1To6V0,*,*,<,cpyN1To6V0

cpyN1To6V1,r,r,>25,setN1V1
cpyN1To6V1,*,*,<,cpyN1To6V1

cpyN1To6V2,r,r,>25,setN1V2
cpyN1To6V2,*,*,<,cpyN1To6V2

cpyN1To6V3,r,r,>25,setN1V3
cpyN1To6V3,*,*,<,cpyN1To6V3

cpyN1To6V4,r,r,>25,setN1V4
cpyN1To6V4,*,*,<,cpyN1To6V4

cpyN1To6V5,r,r,>25,setN1V5
cpyN1To6V5,*,*,<,cpyN1To6V5

cpyN1To6V6,r,r,>25,setN1V6
cpyN1To6V6,*,*,<,cpyN1To6V6

cpyN1To6V7,r,r,>25,setN1V7
cpyN1To6V7,*,*,<,cpyN1To6V7

cpyN1To6V8,r,r,>25,setN1V8
cpyN1To6V8,*,*,<,cpyN1To6V8

cpyN1To6V9,r,r,>25,setN1V9
cpyN1To6V9,*,*,<,cpyN1To6V9

cpyN1To6VA,r,r,>25,setN1VA
cpyN1To6VA,*,*,<,cpyN1To6VA

cpyN1To6VB,r,r,>25,setN1VB
cpyN1To6VB,*,*,<,cpyN1To6VB

cpyN1To6VC,r,r,>25,setN1VC
cpyN1To6VC,*,*,<,cpyN1To6VC

cpyN1To6VD,r,r,>25,setN1VD
cpyN1To6VD,*,*,<,cpyN1To6VD

cpyN1To6VE,r,r,>25,setN1VE
cpyN1To6VE,*,*,<,cpyN1To6VE

cpyN1To6VF,r,r,>25,setN1VF
cpyN1To6VF,*,*,<,cpyN1To6VF

//-
cpyN1To7,0,0,<85,cpyN1To7V0
cpyN1To7,_,0,<85,cpyN1To7V0
cpyN1To7,1,0,<85,cpyN1To7V1
cpyN1To7,2,0,<85,cpyN1To7V2
cpyN1To7,3,0,<85,cpyN1To7V3
cpyN1To7,4,0,<85,cpyN1To7V4
cpyN1To7,5,0,<85,cpyN1To7V5
cpyN1To7,6,0,<85,cpyN1To7V6
cpyN1To7,7,0,<85,cpyN1To7V7
cpyN1To7,8,0,<85,cpyN1To7V8
cpyN1To7,9,0,<85,cpyN1To7V9
cpyN1To7,A,0,<85,cpyN1To7VA
cpyN1To7,B,0,<85,cpyN1To7VB
cpyN1To7,C,0,<85,cpyN1To7VC
cpyN1To7,D,0,<85,cpyN1To7VD
cpyN1To7,E,0,<85,cpyN1To7VE
cpyN1To7,F,0,<85,cpyN1To7VF

cpyN1To7V0,r,r,>29,setN1V0
cpyN1To7V0,*,*,<,cpyN1To7V0

cpyN1To7V1,r,r,>29,setN1V1
cpyN1To7V1,*,*,<,cpyN1To7V1

cpyN1To7V2,r,r,>29,setN1V2
cpyN1To7V2,*,*,<,cpyN1To7V2

cpyN1To7V3,r,r,>29,setN1V3
cpyN1To7V3,*,*,<,cpyN1To7V3

cpyN1To7V4,r,r,>29,setN1V4
cpyN1To7V4,*,*,<,cpyN1To7V4

cpyN1To7V5,r,r,>29,setN1V5
cpyN1To7V5,*,*,<,cpyN1To7V5

cpyN1To7V6,r,r,>29,setN1V6
cpyN1To7V6,*,*,<,cpyN1To7V6

cpyN1To7V7,r,r,>29,setN1V7
cpyN1To7V7,*,*,<,cpyN1To7V7

cpyN1To7V8,r,r,>29,setN1V8
cpyN1To7V8,*,*,<,cpyN1To7V8

cpyN1To7V9,r,r,>29,setN1V9
cpyN1To7V9,*,*,<,cpyN1To7V9

cpyN1To7VA,r,r,>29,setN1VA
cpyN1To7VA,*,*,<,cpyN1To7VA

cpyN1To7VB,r,r,>29,setN1VB
cpyN1To7VB,*,*,<,cpyN1To7VB

cpyN1To7VC,r,r,>29,setN1VC
cpyN1To7VC,*,*,<,cpyN1To7VC

cpyN1To7VD,r,r,>29,setN1VD
cpyN1To7VD,*,*,<,cpyN1To7VD

cpyN1To7VE,r,r,>29,setN1VE
cpyN1To7VE,*,*,<,cpyN1To7VE

cpyN1To7VF,r,r,>29,setN1VF
cpyN1To7VF,*,*,<,cpyN1To7VF

//-
cpyN1To8,0,0,<85,cpyN1To8V0
cpyN1To8,_,0,<85,cpyN1To8V0
cpyN1To8,1,0,<85,cpyN1To8V1
cpyN1To8,2,0,<85,cpyN1To8V2
cpyN1To8,3,0,<85,cpyN1To8V3
cpyN1To8,4,0,<85,cpyN1To8V4
cpyN1To8,5,0,<85,cpyN1To8V5
cpyN1To8,6,0,<85,cpyN1To8V6
cpyN1To8,7,0,<85,cpyN1To8V7
cpyN1To8,8,0,<85,cpyN1To8V8
cpyN1To8,9,0,<85,cpyN1To8V9
cpyN1To8,A,0,<85,cpyN1To8VA
cpyN1To8,B,0,<85,cpyN1To8VB
cpyN1To8,C,0,<85,cpyN1To8VC
cpyN1To8,D,0,<85,cpyN1To8VD
cpyN1To8,E,0,<85,cpyN1To8VE
cpyN1To8,F,0,<85,cpyN1To8VF

cpyN1To8V0,r,r,>33,setN1V0
cpyN1To8V0,*,*,<,cpyN1To8V0

cpyN1To8V1,r,r,>33,setN1V1
cpyN1To8V1,*,*,<,cpyN1To8V1

cpyN1To8V2,r,r,>33,setN1V2
cpyN1To8V2,*,*,<,cpyN1To8V2

cpyN1To8V3,r,r,>33,setN1V3
cpyN1To8V3,*,*,<,cpyN1To8V3

cpyN1To8V4,r,r,>33,setN1V4
cpyN1To8V4,*,*,<,cpyN1To8V4

cpyN1To8V5,r,r,>33,setN1V5
cpyN1To8V5,*,*,<,cpyN1To8V5

cpyN1To8V6,r,r,>33,setN1V6
cpyN1To8V6,*,*,<,cpyN1To8V6

cpyN1To8V7,r,r,>33,setN1V7
cpyN1To8V7,*,*,<,cpyN1To8V7

cpyN1To8V8,r,r,>33,setN1V8
cpyN1To8V8,*,*,<,cpyN1To8V8

cpyN1To8V9,r,r,>33,setN1V9
cpyN1To8V9,*,*,<,cpyN1To8V9

cpyN1To8VA,r,r,>33,setN1VA
cpyN1To8VA,*,*,<,cpyN1To8VA

cpyN1To8VB,r,r,>33,setN1VB
cpyN1To8VB,*,*,<,cpyN1To8VB

cpyN1To8VC,r,r,>33,setN1VC
cpyN1To8VC,*,*,<,cpyN1To8VC

cpyN1To8VD,r,r,>33,setN1VD
cpyN1To8VD,*,*,<,cpyN1To8VD

cpyN1To8VE,r,r,>33,setN1VE
cpyN1To8VE,*,*,<,cpyN1To8VE

cpyN1To8VF,r,r,>33,setN1VF
cpyN1To8VF,*,*,<,cpyN1To8VF

//-
cpyN1To9,0,0,<85,cpyN1To9V0
cpyN1To9,_,0,<85,cpyN1To9V0
cpyN1To9,1,0,<85,cpyN1To9V1
cpyN1To9,2,0,<85,cpyN1To9V2
cpyN1To9,3,0,<85,cpyN1To9V3
cpyN1To9,4,0,<85,cpyN1To9V4
cpyN1To9,5,0,<85,cpyN1To9V5
cpyN1To9,6,0,<85,cpyN1To9V6
cpyN1To9,7,0,<85,cpyN1To9V7
cpyN1To9,8,0,<85,cpyN1To9V8
cpyN1To9,9,0,<85,cpyN1To9V9
cpyN1To9,A,0,<85,cpyN1To9VA
cpyN1To9,B,0,<85,cpyN1To9VB
cpyN1To9,C,0,<85,cpyN1To9VC
cpyN1To9,D,0,<85,cpyN1To9VD
cpyN1To9,E,0,<85,cpyN1To9VE
cpyN1To9,F,0,<85,cpyN1To9VF

cpyN1To9V0,r,r,>37,setN1V0
cpyN1To9V0,*,*,<,cpyN1To9V0

cpyN1To9V1,r,r,>37,setN1V1
cpyN1To9V1,*,*,<,cpyN1To9V1

cpyN1To9V2,r,r,>37,setN1V2
cpyN1To9V2,*,*,<,cpyN1To9V2

cpyN1To9V3,r,r,>37,setN1V3
cpyN1To9V3,*,*,<,cpyN1To9V3

cpyN1To9V4,r,r,>37,setN1V4
cpyN1To9V4,*,*,<,cpyN1To9V4

cpyN1To9V5,r,r,>37,setN1V5
cpyN1To9V5,*,*,<,cpyN1To9V5

cpyN1To9V6,r,r,>37,setN1V6
cpyN1To9V6,*,*,<,cpyN1To9V6

cpyN1To9V7,r,r,>37,setN1V7
cpyN1To9V7,*,*,<,cpyN1To9V7

cpyN1To9V8,r,r,>37,setN1V8
cpyN1To9V8,*,*,<,cpyN1To9V8

cpyN1To9V9,r,r,>37,setN1V9
cpyN1To9V9,*,*,<,cpyN1To9V9

cpyN1To9VA,r,r,>37,setN1VA
cpyN1To9VA,*,*,<,cpyN1To9VA

cpyN1To9VB,r,r,>37,setN1VB
cpyN1To9VB,*,*,<,cpyN1To9VB

cpyN1To9VC,r,r,>37,setN1VC
cpyN1To9VC,*,*,<,cpyN1To9VC

cpyN1To9VD,r,r,>37,setN1VD
cpyN1To9VD,*,*,<,cpyN1To9VD

cpyN1To9VE,r,r,>37,setN1VE
cpyN1To9VE,*,*,<,cpyN1To9VE

cpyN1To9VF,r,r,>37,setN1VF
cpyN1To9VF,*,*,<,cpyN1To9VF

//-
cpyN1ToA,0,0,<85,cpyN1ToAV0
cpyN1ToA,_,0,<85,cpyN1ToAV0
cpyN1ToA,1,0,<85,cpyN1ToAV1
cpyN1ToA,2,0,<85,cpyN1ToAV2
cpyN1ToA,3,0,<85,cpyN1ToAV3
cpyN1ToA,4,0,<85,cpyN1ToAV4
cpyN1ToA,5,0,<85,cpyN1ToAV5
cpyN1ToA,6,0,<85,cpyN1ToAV6
cpyN1ToA,7,0,<85,cpyN1ToAV7
cpyN1ToA,8,0,<85,cpyN1ToAV8
cpyN1ToA,9,0,<85,cpyN1ToAV9
cpyN1ToA,A,0,<85,cpyN1ToAVA
cpyN1ToA,B,0,<85,cpyN1ToAVB
cpyN1ToA,C,0,<85,cpyN1ToAVC
cpyN1ToA,D,0,<85,cpyN1ToAVD
cpyN1ToA,E,0,<85,cpyN1ToAVE
cpyN1ToA,F,0,<85,cpyN1ToAVF

cpyN1ToAV0,r,r,>41,setN1V0
cpyN1ToAV0,*,*,<,cpyN1ToAV0

cpyN1ToAV1,r,r,>41,setN1V1
cpyN1ToAV1,*,*,<,cpyN1ToAV1

cpyN1ToAV2,r,r,>41,setN1V2
cpyN1ToAV2,*,*,<,cpyN1ToAV2

cpyN1ToAV3,r,r,>41,setN1V3
cpyN1ToAV3,*,*,<,cpyN1ToAV3

cpyN1ToAV4,r,r,>41,setN1V4
cpyN1ToAV4,*,*,<,cpyN1ToAV4

cpyN1ToAV5,r,r,>41,setN1V5
cpyN1ToAV5,*,*,<,cpyN1ToAV5

cpyN1ToAV6,r,r,>41,setN1V6
cpyN1ToAV6,*,*,<,cpyN1ToAV6

cpyN1ToAV7,r,r,>41,setN1V7
cpyN1ToAV7,*,*,<,cpyN1ToAV7

cpyN1ToAV8,r,r,>41,setN1V8
cpyN1ToAV8,*,*,<,cpyN1ToAV8

cpyN1ToAV9,r,r,>41,setN1V9
cpyN1ToAV9,*,*,<,cpyN1ToAV9

cpyN1ToAVA,r,r,>41,setN1VA
cpyN1ToAVA,*,*,<,cpyN1ToAVA

cpyN1ToAVB,r,r,>41,setN1VB
cpyN1ToAVB,*,*,<,cpyN1ToAVB

cpyN1ToAVC,r,r,>41,setN1VC
cpyN1ToAVC,*,*,<,cpyN1ToAVC

cpyN1ToAVD,r,r,>41,setN1VD
cpyN1ToAVD,*,*,<,cpyN1ToAVD

cpyN1ToAVE,r,r,>41,setN1VE
cpyN1ToAVE,*,*,<,cpyN1ToAVE

cpyN1ToAVF,r,r,>41,setN1VF
cpyN1ToAVF,*,*,<,cpyN1ToAVF

//-
cpyN1ToB,0,0,<85,cpyN1ToBV0
cpyN1ToB,_,0,<85,cpyN1ToBV0
cpyN1ToB,1,0,<85,cpyN1ToBV1
cpyN1ToB,2,0,<85,cpyN1ToBV2
cpyN1ToB,3,0,<85,cpyN1ToBV3
cpyN1ToB,4,0,<85,cpyN1ToBV4
cpyN1ToB,5,0,<85,cpyN1ToBV5
cpyN1ToB,6,0,<85,cpyN1ToBV6
cpyN1ToB,7,0,<85,cpyN1ToBV7
cpyN1ToB,8,0,<85,cpyN1ToBV8
cpyN1ToB,9,0,<85,cpyN1ToBV9
cpyN1ToB,A,0,<85,cpyN1ToBVA
cpyN1ToB,B,0,<85,cpyN1ToBVB
cpyN1ToB,C,0,<85,cpyN1ToBVC
cpyN1ToB,D,0,<85,cpyN1ToBVD
cpyN1ToB,E,0,<85,cpyN1ToBVE
cpyN1ToB,F,0,<85,cpyN1ToBVF

cpyN1ToBV0,r,r,>45,setN1V0
cpyN1ToBV0,*,*,<,cpyN1ToBV0

cpyN1ToBV1,r,r,>45,setN1V1
cpyN1ToBV1,*,*,<,cpyN1ToBV1

cpyN1ToBV2,r,r,>45,setN1V2
cpyN1ToBV2,*,*,<,cpyN1ToBV2

cpyN1ToBV3,r,r,>45,setN1V3
cpyN1ToBV3,*,*,<,cpyN1ToBV3

cpyN1ToBV4,r,r,>45,setN1V4
cpyN1ToBV4,*,*,<,cpyN1ToBV4

cpyN1ToBV5,r,r,>45,setN1V5
cpyN1ToBV5,*,*,<,cpyN1ToBV5

cpyN1ToBV6,r,r,>45,setN1V6
cpyN1ToBV6,*,*,<,cpyN1ToBV6

cpyN1ToBV7,r,r,>45,setN1V7
cpyN1ToBV7,*,*,<,cpyN1ToBV7

cpyN1ToBV8,r,r,>45,setN1V8
cpyN1ToBV8,*,*,<,cpyN1ToBV8

cpyN1ToBV9,r,r,>45,setN1V9
cpyN1ToBV9,*,*,<,cpyN1ToBV9

cpyN1ToBVA,r,r,>45,setN1VA
cpyN1ToBVA,*,*,<,cpyN1ToBVA

cpyN1ToBVB,r,r,>45,setN1VB
cpyN1ToBVB,*,*,<,cpyN1ToBVB

cpyN1ToBVC,r,r,>45,setN1VC
cpyN1ToBVC,*,*,<,cpyN1ToBVC

cpyN1ToBVD,r,r,>45,setN1VD
cpyN1ToBVD,*,*,<,cpyN1ToBVD

cpyN1ToBVE,r,r,>45,setN1VE
cpyN1ToBVE,*,*,<,cpyN1ToBVE

cpyN1ToBVF,r,r,>45,setN1VF
cpyN1ToBVF,*,*,<,cpyN1ToBVF

//-
cpyN1ToC,0,0,<85,cpyN1ToCV0
cpyN1ToC,_,0,<85,cpyN1ToCV0
cpyN1ToC,1,0,<85,cpyN1ToCV1
cpyN1ToC,2,0,<85,cpyN1ToCV2
cpyN1ToC,3,0,<85,cpyN1ToCV3
cpyN1ToC,4,0,<85,cpyN1ToCV4
cpyN1ToC,5,0,<85,cpyN1ToCV5
cpyN1ToC,6,0,<85,cpyN1ToCV6
cpyN1ToC,7,0,<85,cpyN1ToCV7
cpyN1ToC,8,0,<85,cpyN1ToCV8
cpyN1ToC,9,0,<85,cpyN1ToCV9
cpyN1ToC,A,0,<85,cpyN1ToCVA
cpyN1ToC,B,0,<85,cpyN1ToCVB
cpyN1ToC,C,0,<85,cpyN1ToCVC
cpyN1ToC,D,0,<85,cpyN1ToCVD
cpyN1ToC,E,0,<85,cpyN1ToCVE
cpyN1ToC,F,0,<85,cpyN1ToCVF

cpyN1ToCV0,r,r,>49,setN1V0
cpyN1ToCV0,*,*,<,cpyN1ToCV0

cpyN1ToCV1,r,r,>49,setN1V1
cpyN1ToCV1,*,*,<,cpyN1ToCV1

cpyN1ToCV2,r,r,>49,setN1V2
cpyN1ToCV2,*,*,<,cpyN1ToCV2

cpyN1ToCV3,r,r,>49,setN1V3
cpyN1ToCV3,*,*,<,cpyN1ToCV3

cpyN1ToCV4,r,r,>49,setN1V4
cpyN1ToCV4,*,*,<,cpyN1ToCV4

cpyN1ToCV5,r,r,>49,setN1V5
cpyN1ToCV5,*,*,<,cpyN1ToCV5

cpyN1ToCV6,r,r,>49,setN1V6
cpyN1ToCV6,*,*,<,cpyN1ToCV6

cpyN1ToCV7,r,r,>49,setN1V7
cpyN1ToCV7,*,*,<,cpyN1ToCV7

cpyN1ToCV8,r,r,>49,setN1V8
cpyN1ToCV8,*,*,<,cpyN1ToCV8

cpyN1ToCV9,r,r,>49,setN1V9
cpyN1ToCV9,*,*,<,cpyN1ToCV9

cpyN1ToCVA,r,r,>49,setN1VA
cpyN1ToCVA,*,*,<,cpyN1ToCVA

cpyN1ToCVB,r,r,>49,setN1VB
cpyN1ToCVB,*,*,<,cpyN1ToCVB

cpyN1ToCVC,r,r,>49,setN1VC
cpyN1ToCVC,*,*,<,cpyN1ToCVC

cpyN1ToCVD,r,r,>49,setN1VD
cpyN1ToCVD,*,*,<,cpyN1ToCVD

cpyN1ToCVE,r,r,>49,setN1VE
cpyN1ToCVE,*,*,<,cpyN1ToCVE

cpyN1ToCVF,r,r,>49,setN1VF
cpyN1ToCVF,*,*,<,cpyN1ToCVF

//-
cpyN1ToD,0,0,<85,cpyN1ToDV0
cpyN1ToD,_,0,<85,cpyN1ToDV0
cpyN1ToD,1,0,<85,cpyN1ToDV1
cpyN1ToD,2,0,<85,cpyN1ToDV2
cpyN1ToD,3,0,<85,cpyN1ToDV3
cpyN1ToD,4,0,<85,cpyN1ToDV4
cpyN1ToD,5,0,<85,cpyN1ToDV5
cpyN1ToD,6,0,<85,cpyN1ToDV6
cpyN1ToD,7,0,<85,cpyN1ToDV7
cpyN1ToD,8,0,<85,cpyN1ToDV8
cpyN1ToD,9,0,<85,cpyN1ToDV9
cpyN1ToD,A,0,<85,cpyN1ToDVA
cpyN1ToD,B,0,<85,cpyN1ToDVB
cpyN1ToD,C,0,<85,cpyN1ToDVC
cpyN1ToD,D,0,<85,cpyN1ToDVD
cpyN1ToD,E,0,<85,cpyN1ToDVE
cpyN1ToD,F,0,<85,cpyN1ToDVF

cpyN1ToDV0,r,r,>53,setN1V0
cpyN1ToDV0,*,*,<,cpyN1ToDV0

cpyN1ToDV1,r,r,>53,setN1V1
cpyN1ToDV1,*,*,<,cpyN1ToDV1

cpyN1ToDV2,r,r,>53,setN1V2
cpyN1ToDV2,*,*,<,cpyN1ToDV2

cpyN1ToDV3,r,r,>53,setN1V3
cpyN1ToDV3,*,*,<,cpyN1ToDV3

cpyN1ToDV4,r,r,>53,setN1V4
cpyN1ToDV4,*,*,<,cpyN1ToDV4

cpyN1ToDV5,r,r,>53,setN1V5
cpyN1ToDV5,*,*,<,cpyN1ToDV5

cpyN1ToDV6,r,r,>53,setN1V6
cpyN1ToDV6,*,*,<,cpyN1ToDV6

cpyN1ToDV7,r,r,>53,setN1V7
cpyN1ToDV7,*,*,<,cpyN1ToDV7

cpyN1ToDV8,r,r,>53,setN1V8
cpyN1ToDV8,*,*,<,cpyN1ToDV8

cpyN1ToDV9,r,r,>53,setN1V9
cpyN1ToDV9,*,*,<,cpyN1ToDV9

cpyN1ToDVA,r,r,>53,setN1VA
cpyN1ToDVA,*,*,<,cpyN1ToDVA

cpyN1ToDVB,r,r,>53,setN1VB
cpyN1ToDVB,*,*,<,cpyN1ToDVB

cpyN1ToDVC,r,r,>53,setN1VC
cpyN1ToDVC,*,*,<,cpyN1ToDVC

cpyN1ToDVD,r,r,>53,setN1VD
cpyN1ToDVD,*,*,<,cpyN1ToDVD

cpyN1ToDVE,r,r,>53,setN1VE
cpyN1ToDVE,*,*,<,cpyN1ToDVE

cpyN1ToDVF,r,r,>53,setN1VF
cpyN1ToDVF,*,*,<,cpyN1ToDVF

//-
cpyN1ToE,0,0,<85,cpyN1ToEV0
cpyN1ToE,_,0,<85,cpyN1ToEV0
cpyN1ToE,1,0,<85,cpyN1ToEV1
cpyN1ToE,2,0,<85,cpyN1ToEV2
cpyN1ToE,3,0,<85,cpyN1ToEV3
cpyN1ToE,4,0,<85,cpyN1ToEV4
cpyN1ToE,5,0,<85,cpyN1ToEV5
cpyN1ToE,6,0,<85,cpyN1ToEV6
cpyN1ToE,7,0,<85,cpyN1ToEV7
cpyN1ToE,8,0,<85,cpyN1ToEV8
cpyN1ToE,9,0,<85,cpyN1ToEV9
cpyN1ToE,A,0,<85,cpyN1ToEVA
cpyN1ToE,B,0,<85,cpyN1ToEVB
cpyN1ToE,C,0,<85,cpyN1ToEVC
cpyN1ToE,D,0,<85,cpyN1ToEVD
cpyN1ToE,E,0,<85,cpyN1ToEVE
cpyN1ToE,F,0,<85,cpyN1ToEVF

cpyN1ToEV0,r,r,>57,setN1V0
cpyN1ToEV0,*,*,<,cpyN1ToEV0

cpyN1ToEV1,r,r,>57,setN1V1
cpyN1ToEV1,*,*,<,cpyN1ToEV1

cpyN1ToEV2,r,r,>57,setN1V2
cpyN1ToEV2,*,*,<,cpyN1ToEV2

cpyN1ToEV3,r,r,>57,setN1V3
cpyN1ToEV3,*,*,<,cpyN1ToEV3

cpyN1ToEV4,r,r,>57,setN1V4
cpyN1ToEV4,*,*,<,cpyN1ToEV4

cpyN1ToEV5,r,r,>57,setN1V5
cpyN1ToEV5,*,*,<,cpyN1ToEV5

cpyN1ToEV6,r,r,>57,setN1V6
cpyN1ToEV6,*,*,<,cpyN1ToEV6

cpyN1ToEV7,r,r,>57,setN1V7
cpyN1ToEV7,*,*,<,cpyN1ToEV7

cpyN1ToEV8,r,r,>57,setN1V8
cpyN1ToEV8,*,*,<,cpyN1ToEV8

cpyN1ToEV9,r,r,>57,setN1V9
cpyN1ToEV9,*,*,<,cpyN1ToEV9

cpyN1ToEVA,r,r,>57,setN1VA
cpyN1ToEVA,*,*,<,cpyN1ToEVA

cpyN1ToEVB,r,r,>57,setN1VB
cpyN1ToEVB,*,*,<,cpyN1ToEVB

cpyN1ToEVC,r,r,>57,setN1VC
cpyN1ToEVC,*,*,<,cpyN1ToEVC

cpyN1ToEVD,r,r,>57,setN1VD
cpyN1ToEVD,*,*,<,cpyN1ToEVD

cpyN1ToEVE,r,r,>57,setN1VE
cpyN1ToEVE,*,*,<,cpyN1ToEVE

cpyN1ToEVF,r,r,>57,setN1VF
cpyN1ToEVF,*,*,<,cpyN1ToEVF

//-
cpyN1ToF,0,0,<85,cpyN1ToFV0
cpyN1ToF,_,0,<85,cpyN1ToFV0
cpyN1ToF,1,0,<85,cpyN1ToFV1
cpyN1ToF,2,0,<85,cpyN1ToFV2
cpyN1ToF,3,0,<85,cpyN1ToFV3
cpyN1ToF,4,0,<85,cpyN1ToFV4
cpyN1ToF,5,0,<85,cpyN1ToFV5
cpyN1ToF,6,0,<85,cpyN1ToFV6
cpyN1ToF,7,0,<85,cpyN1ToFV7
cpyN1ToF,8,0,<85,cpyN1ToFV8
cpyN1ToF,9,0,<85,cpyN1ToFV9
cpyN1ToF,A,0,<85,cpyN1ToFVA
cpyN1ToF,B,0,<85,cpyN1ToFVB
cpyN1ToF,C,0,<85,cpyN1ToFVC
cpyN1ToF,D,0,<85,cpyN1ToFVD
cpyN1ToF,E,0,<85,cpyN1ToFVE
cpyN1ToF,F,0,<85,cpyN1ToFVF

cpyN1ToFV0,r,r,>61,setN1V0
cpyN1ToFV0,*,*,<,cpyN1ToFV0

cpyN1ToFV1,r,r,>61,setN1V1
cpyN1ToFV1,*,*,<,cpyN1ToFV1

cpyN1ToFV2,r,r,>61,setN1V2
cpyN1ToFV2,*,*,<,cpyN1ToFV2

cpyN1ToFV3,r,r,>61,setN1V3
cpyN1ToFV3,*,*,<,cpyN1ToFV3

cpyN1ToFV4,r,r,>61,setN1V4
cpyN1ToFV4,*,*,<,cpyN1ToFV4

cpyN1ToFV5,r,r,>61,setN1V5
cpyN1ToFV5,*,*,<,cpyN1ToFV5

cpyN1ToFV6,r,r,>61,setN1V6
cpyN1ToFV6,*,*,<,cpyN1ToFV6

cpyN1ToFV7,r,r,>61,setN1V7
cpyN1ToFV7,*,*,<,cpyN1ToFV7

cpyN1ToFV8,r,r,>61,setN1V8
cpyN1ToFV8,*,*,<,cpyN1ToFV8

cpyN1ToFV9,r,r,>61,setN1V9
cpyN1ToFV9,*,*,<,cpyN1ToFV9

cpyN1ToFVA,r,r,>61,setN1VA
cpyN1ToFVA,*,*,<,cpyN1ToFVA

cpyN1ToFVB,r,r,>61,setN1VB
cpyN1ToFVB,*,*,<,cpyN1ToFVB

cpyN1ToFVC,r,r,>61,setN1VC
cpyN1ToFVC,*,*,<,cpyN1ToFVC

cpyN1ToFVD,r,r,>61,setN1VD
cpyN1ToFVD,*,*,<,cpyN1ToFVD

cpyN1ToFVE,r,r,>61,setN1VE
cpyN1ToFVE,*,*,<,cpyN1ToFVE

cpyN1ToFVF,r,r,>61,setN1VF
cpyN1ToFVF,*,*,<,cpyN1ToFVF
//..

cpyN2,1,1,<4,cpyN2To1
cpyN2,2,2,<4,cpyN2To2
cpyN2,3,3,<4,cpyN2To3
cpyN2,4,4,<4,cpyN2To4
cpyN2,5,5,<4,cpyN2To5
cpyN2,6,6,<4,cpyN2To6
cpyN2,7,7,<4,cpyN2To7
cpyN2,8,8,<4,cpyN2To8
cpyN2,9,9,<4,cpyN2To9
cpyN2,A,A,<4,cpyN2ToA
cpyN2,B,B,<4,cpyN2ToB
cpyN2,C,C,<4,cpyN2ToC
cpyN2,D,D,<4,cpyN2ToD
cpyN2,E,E,<4,cpyN2ToE
cpyN2,F,F,<4,cpyN2ToF

//..--..

//...
cpyN2To1,0,0,<86,cpyN2To1V0
cpyN2To1,_,0,<86,cpyN2To1V0
cpyN2To1,1,0,<86,cpyN2To1V1
cpyN2To1,2,0,<86,cpyN2To1V2
cpyN2To1,3,0,<86,cpyN2To1V3
cpyN2To1,4,0,<86,cpyN2To1V4
cpyN2To1,5,0,<86,cpyN2To1V5
cpyN2To1,6,0,<86,cpyN2To1V6
cpyN2To1,7,0,<86,cpyN2To1V7
cpyN2To1,8,0,<86,cpyN2To1V8
cpyN2To1,9,0,<86,cpyN2To1V9
cpyN2To1,A,0,<86,cpyN2To1VA
cpyN2To1,B,0,<86,cpyN2To1VB
cpyN2To1,C,0,<86,cpyN2To1VC
cpyN2To1,D,0,<86,cpyN2To1VD
cpyN2To1,E,0,<86,cpyN2To1VE
cpyN2To1,F,0,<86,cpyN2To1VF

cpyN2To1V0,r,r,>6,setN2V0
cpyN2To1V0,*,*,<,cpyN2To1V0
setN2V0,*,0,>,govN3
govN3,v,v,>,cpyN3
govN3,p,p,>25,govN3
govN3,*,*,>,govN3

cpyN2To1V1,r,r,>6,setN2V1
cpyN2To1V1,*,*,<,cpyN2To1V1
setN2V1,*,1,>,govN3

cpyN2To1V2,r,r,>6,setN2V2
cpyN2To1V2,*,*,<,cpyN2To1V2
setN2V2,*,2,>,govN3

cpyN2To1V3,r,r,>6,setN2V3
cpyN2To1V3,*,*,<,cpyN2To1V3
setN2V3,*,3,>,govN3

cpyN2To1V4,r,r,>6,setN2V4
cpyN2To1V4,*,*,<,cpyN2To1V4
setN2V4,*,4,>,govN3

cpyN2To1V5,r,r,>6,setN2V5
cpyN2To1V5,*,*,<,cpyN2To1V5
setN2V5,*,5,>,govN3

cpyN2To1V6,r,r,>6,setN2V6
cpyN2To1V6,*,*,<,cpyN2To1V6
setN2V6,*,6,>,govN3

cpyN2To1V7,r,r,>6,setN2V7
cpyN2To1V7,*,*,<,cpyN2To1V7
setN2V7,*,7,>,govN3

cpyN2To1V8,r,r,>6,setN2V8
cpyN2To1V8,*,*,<,cpyN2To1V8
setN2V8,*,8,>,govN3

cpyN2To1V9,r,r,>6,setN2V9
cpyN2To1V9,*,*,<,cpyN2To1V9
setN2V9,*,9,>,govN3

cpyN2To1VA,r,r,>6,setN2VA
cpyN2To1VA,*,*,<,cpyN2To1VA
setN2VA,*,A,>,govN3

cpyN2To1VB,r,r,>6,setN2VB
cpyN2To1VB,*,*,<,cpyN2To1VB
setN2VB,*,B,>,govN3

cpyN2To1VC,r,r,>6,setN2VC
cpyN2To1VC,*,*,<,cpyN2To1VC
setN2VC,*,C,>,govN3

cpyN2To1VD,r,r,>6,setN2VD
cpyN2To1VD,*,*,<,cpyN2To1VD
setN2VD,*,D,>,govN3

cpyN2To1VE,r,r,>6,setN2VE
cpyN2To1VE,*,*,<,cpyN2To1VE
setN2VE,*,E,>,govN3

cpyN2To1VF,r,r,>6,setN2VF
cpyN2To1VF,*,*,<,cpyN2To1VF
setN2VF,*,F,>,govN3

//-
cpyN2To2,0,0,<86,cpyN2To2V0
cpyN2To2,_,0,<86,cpyN2To2V0
cpyN2To2,1,0,<86,cpyN2To2V1
cpyN2To2,2,0,<86,cpyN2To2V2
cpyN2To2,3,0,<86,cpyN2To2V3
cpyN2To2,4,0,<86,cpyN2To2V4
cpyN2To2,5,0,<86,cpyN2To2V5
cpyN2To2,6,0,<86,cpyN2To2V6
cpyN2To2,7,0,<86,cpyN2To2V7
cpyN2To2,8,0,<86,cpyN2To2V8
cpyN2To2,9,0,<86,cpyN2To2V9
cpyN2To2,A,0,<86,cpyN2To2VA
cpyN2To2,B,0,<86,cpyN2To2VB
cpyN2To2,C,0,<86,cpyN2To2VC
cpyN2To2,D,0,<86,cpyN2To2VD
cpyN2To2,E,0,<86,cpyN2To2VE
cpyN2To2,F,0,<86,cpyN2To2VF

cpyN2To2V0,r,r,>10,setN2V0
cpyN2To2V0,*,*,<,cpyN2To2V0

cpyN2To2V1,r,r,>10,setN2V1
cpyN2To2V1,*,*,<,cpyN2To2V1

cpyN2To2V2,r,r,>10,setN2V2
cpyN2To2V2,*,*,<,cpyN2To2V2

cpyN2To2V3,r,r,>10,setN2V3
cpyN2To2V3,*,*,<,cpyN2To2V3

cpyN2To2V4,r,r,>10,setN2V4
cpyN2To2V4,*,*,<,cpyN2To2V4

cpyN2To2V5,r,r,>10,setN2V5
cpyN2To2V5,*,*,<,cpyN2To2V5

cpyN2To2V6,r,r,>10,setN2V6
cpyN2To2V6,*,*,<,cpyN2To2V6

cpyN2To2V7,r,r,>10,setN2V7
cpyN2To2V7,*,*,<,cpyN2To2V7

cpyN2To2V8,r,r,>10,setN2V8
cpyN2To2V8,*,*,<,cpyN2To2V8

cpyN2To2V9,r,r,>10,setN2V9
cpyN2To2V9,*,*,<,cpyN2To2V9

cpyN2To2VA,r,r,>10,setN2VA
cpyN2To2VA,*,*,<,cpyN2To2VA

cpyN2To2VB,r,r,>10,setN2VB
cpyN2To2VB,*,*,<,cpyN2To2VB

cpyN2To2VC,r,r,>10,setN2VC
cpyN2To2VC,*,*,<,cpyN2To2VC

cpyN2To2VD,r,r,>10,setN2VD
cpyN2To2VD,*,*,<,cpyN2To2VD

cpyN2To2VE,r,r,>10,setN2VE
cpyN2To2VE,*,*,<,cpyN2To2VE

cpyN2To2VF,r,r,>10,setN2VF
cpyN2To2VF,*,*,<,cpyN2To2VF

//-
cpyN2To3,0,0,<86,cpyN2To3V0
cpyN2To3,_,0,<86,cpyN2To3V0
cpyN2To3,1,0,<86,cpyN2To3V1
cpyN2To3,2,0,<86,cpyN2To3V2
cpyN2To3,3,0,<86,cpyN2To3V3
cpyN2To3,4,0,<86,cpyN2To3V4
cpyN2To3,5,0,<86,cpyN2To3V5
cpyN2To3,6,0,<86,cpyN2To3V6
cpyN2To3,7,0,<86,cpyN2To3V7
cpyN2To3,8,0,<86,cpyN2To3V8
cpyN2To3,9,0,<86,cpyN2To3V9
cpyN2To3,A,0,<86,cpyN2To3VA
cpyN2To3,B,0,<86,cpyN2To3VB
cpyN2To3,C,0,<86,cpyN2To3VC
cpyN2To3,D,0,<86,cpyN2To3VD
cpyN2To3,E,0,<86,cpyN2To3VE
cpyN2To3,F,0,<86,cpyN2To3VF

cpyN2To3V0,r,r,>14,setN2V0
cpyN2To3V0,*,*,<,cpyN2To3V0

cpyN2To3V1,r,r,>14,setN2V1
cpyN2To3V1,*,*,<,cpyN2To3V1

cpyN2To3V2,r,r,>14,setN2V2
cpyN2To3V2,*,*,<,cpyN2To3V2

cpyN2To3V3,r,r,>14,setN2V3
cpyN2To3V3,*,*,<,cpyN2To3V3

cpyN2To3V4,r,r,>14,setN2V4
cpyN2To3V4,*,*,<,cpyN2To3V4

cpyN2To3V5,r,r,>14,setN2V5
cpyN2To3V5,*,*,<,cpyN2To3V5

cpyN2To3V6,r,r,>14,setN2V6
cpyN2To3V6,*,*,<,cpyN2To3V6

cpyN2To3V7,r,r,>14,setN2V7
cpyN2To3V7,*,*,<,cpyN2To3V7

cpyN2To3V8,r,r,>14,setN2V8
cpyN2To3V8,*,*,<,cpyN2To3V8

cpyN2To3V9,r,r,>14,setN2V9
cpyN2To3V9,*,*,<,cpyN2To3V9

cpyN2To3VA,r,r,>14,setN2VA
cpyN2To3VA,*,*,<,cpyN2To3VA

cpyN2To3VB,r,r,>14,setN2VB
cpyN2To3VB,*,*,<,cpyN2To3VB

cpyN2To3VC,r,r,>14,setN2VC
cpyN2To3VC,*,*,<,cpyN2To3VC

cpyN2To3VD,r,r,>14,setN2VD
cpyN2To3VD,*,*,<,cpyN2To3VD

cpyN2To3VE,r,r,>14,setN2VE
cpyN2To3VE,*,*,<,cpyN2To3VE

cpyN2To3VF,r,r,>14,setN2VF
cpyN2To3VF,*,*,<,cpyN2To3VF

//-
cpyN2To4,0,0,<86,cpyN2To4V0
cpyN2To4,_,0,<86,cpyN2To4V0
cpyN2To4,1,0,<86,cpyN2To4V1
cpyN2To4,2,0,<86,cpyN2To4V2
cpyN2To4,3,0,<86,cpyN2To4V3
cpyN2To4,4,0,<86,cpyN2To4V4
cpyN2To4,5,0,<86,cpyN2To4V5
cpyN2To4,6,0,<86,cpyN2To4V6
cpyN2To4,7,0,<86,cpyN2To4V7
cpyN2To4,8,0,<86,cpyN2To4V8
cpyN2To4,9,0,<86,cpyN2To4V9
cpyN2To4,A,0,<86,cpyN2To4VA
cpyN2To4,B,0,<86,cpyN2To4VB
cpyN2To4,C,0,<86,cpyN2To4VC
cpyN2To4,D,0,<86,cpyN2To4VD
cpyN2To4,E,0,<86,cpyN2To4VE
cpyN2To4,F,0,<86,cpyN2To4VF

cpyN2To4V0,r,r,>18,setN2V0
cpyN2To4V0,*,*,<,cpyN2To4V0

cpyN2To4V1,r,r,>18,setN2V1
cpyN2To4V1,*,*,<,cpyN2To4V1

cpyN2To4V2,r,r,>18,setN2V2
cpyN2To4V2,*,*,<,cpyN2To4V2

cpyN2To4V3,r,r,>18,setN2V3
cpyN2To4V3,*,*,<,cpyN2To4V3

cpyN2To4V4,r,r,>18,setN2V4
cpyN2To4V4,*,*,<,cpyN2To4V4

cpyN2To4V5,r,r,>18,setN2V5
cpyN2To4V5,*,*,<,cpyN2To4V5

cpyN2To4V6,r,r,>18,setN2V6
cpyN2To4V6,*,*,<,cpyN2To4V6

cpyN2To4V7,r,r,>18,setN2V7
cpyN2To4V7,*,*,<,cpyN2To4V7

cpyN2To4V8,r,r,>18,setN2V8
cpyN2To4V8,*,*,<,cpyN2To4V8

cpyN2To4V9,r,r,>18,setN2V9
cpyN2To4V9,*,*,<,cpyN2To4V9

cpyN2To4VA,r,r,>18,setN2VA
cpyN2To4VA,*,*,<,cpyN2To4VA

cpyN2To4VB,r,r,>18,setN2VB
cpyN2To4VB,*,*,<,cpyN2To4VB

cpyN2To4VC,r,r,>18,setN2VC
cpyN2To4VC,*,*,<,cpyN2To4VC

cpyN2To4VD,r,r,>18,setN2VD
cpyN2To4VD,*,*,<,cpyN2To4VD

cpyN2To4VE,r,r,>18,setN2VE
cpyN2To4VE,*,*,<,cpyN2To4VE

cpyN2To4VF,r,r,>18,setN2VF
cpyN2To4VF,*,*,<,cpyN2To4VF

//-
cpyN2To5,0,0,<86,cpyN2To5V0
cpyN2To5,_,0,<86,cpyN2To5V0
cpyN2To5,1,0,<86,cpyN2To5V1
cpyN2To5,2,0,<86,cpyN2To5V2
cpyN2To5,3,0,<86,cpyN2To5V3
cpyN2To5,4,0,<86,cpyN2To5V4
cpyN2To5,5,0,<86,cpyN2To5V5
cpyN2To5,6,0,<86,cpyN2To5V6
cpyN2To5,7,0,<86,cpyN2To5V7
cpyN2To5,8,0,<86,cpyN2To5V8
cpyN2To5,9,0,<86,cpyN2To5V9
cpyN2To5,A,0,<86,cpyN2To5VA
cpyN2To5,B,0,<86,cpyN2To5VB
cpyN2To5,C,0,<86,cpyN2To5VC
cpyN2To5,D,0,<86,cpyN2To5VD
cpyN2To5,E,0,<86,cpyN2To5VE
cpyN2To5,F,0,<86,cpyN2To5VF

cpyN2To5V0,r,r,>22,setN2V0
cpyN2To5V0,*,*,<,cpyN2To5V0

cpyN2To5V1,r,r,>22,setN2V1
cpyN2To5V1,*,*,<,cpyN2To5V1

cpyN2To5V2,r,r,>22,setN2V2
cpyN2To5V2,*,*,<,cpyN2To5V2

cpyN2To5V3,r,r,>22,setN2V3
cpyN2To5V3,*,*,<,cpyN2To5V3

cpyN2To5V4,r,r,>22,setN2V4
cpyN2To5V4,*,*,<,cpyN2To5V4

cpyN2To5V5,r,r,>22,setN2V5
cpyN2To5V5,*,*,<,cpyN2To5V5

cpyN2To5V6,r,r,>22,setN2V6
cpyN2To5V6,*,*,<,cpyN2To5V6

cpyN2To5V7,r,r,>22,setN2V7
cpyN2To5V7,*,*,<,cpyN2To5V7

cpyN2To5V8,r,r,>22,setN2V8
cpyN2To5V8,*,*,<,cpyN2To5V8

cpyN2To5V9,r,r,>22,setN2V9
cpyN2To5V9,*,*,<,cpyN2To5V9

cpyN2To5VA,r,r,>22,setN2VA
cpyN2To5VA,*,*,<,cpyN2To5VA

cpyN2To5VB,r,r,>22,setN2VB
cpyN2To5VB,*,*,<,cpyN2To5VB

cpyN2To5VC,r,r,>22,setN2VC
cpyN2To5VC,*,*,<,cpyN2To5VC

cpyN2To5VD,r,r,>22,setN2VD
cpyN2To5VD,*,*,<,cpyN2To5VD

cpyN2To5VE,r,r,>22,setN2VE
cpyN2To5VE,*,*,<,cpyN2To5VE

cpyN2To5VF,r,r,>22,setN2VF
cpyN2To5VF,*,*,<,cpyN2To5VF

//-
cpyN2To6,0,0,<86,cpyN2To6V0
cpyN2To6,_,0,<86,cpyN2To6V0
cpyN2To6,1,0,<86,cpyN2To6V1
cpyN2To6,2,0,<86,cpyN2To6V2
cpyN2To6,3,0,<86,cpyN2To6V3
cpyN2To6,4,0,<86,cpyN2To6V4
cpyN2To6,5,0,<86,cpyN2To6V5
cpyN2To6,6,0,<86,cpyN2To6V6
cpyN2To6,7,0,<86,cpyN2To6V7
cpyN2To6,8,0,<86,cpyN2To6V8
cpyN2To6,9,0,<86,cpyN2To6V9
cpyN2To6,A,0,<86,cpyN2To6VA
cpyN2To6,B,0,<86,cpyN2To6VB
cpyN2To6,C,0,<86,cpyN2To6VC
cpyN2To6,D,0,<86,cpyN2To6VD
cpyN2To6,E,0,<86,cpyN2To6VE
cpyN2To6,F,0,<86,cpyN2To6VF

cpyN2To6V0,r,r,>26,setN2V0
cpyN2To6V0,*,*,<,cpyN2To6V0

cpyN2To6V1,r,r,>26,setN2V1
cpyN2To6V1,*,*,<,cpyN2To6V1

cpyN2To6V2,r,r,>26,setN2V2
cpyN2To6V2,*,*,<,cpyN2To6V2

cpyN2To6V3,r,r,>26,setN2V3
cpyN2To6V3,*,*,<,cpyN2To6V3

cpyN2To6V4,r,r,>26,setN2V4
cpyN2To6V4,*,*,<,cpyN2To6V4

cpyN2To6V5,r,r,>26,setN2V5
cpyN2To6V5,*,*,<,cpyN2To6V5

cpyN2To6V6,r,r,>26,setN2V6
cpyN2To6V6,*,*,<,cpyN2To6V6

cpyN2To6V7,r,r,>26,setN2V7
cpyN2To6V7,*,*,<,cpyN2To6V7

cpyN2To6V8,r,r,>26,setN2V8
cpyN2To6V8,*,*,<,cpyN2To6V8

cpyN2To6V9,r,r,>26,setN2V9
cpyN2To6V9,*,*,<,cpyN2To6V9

cpyN2To6VA,r,r,>26,setN2VA
cpyN2To6VA,*,*,<,cpyN2To6VA

cpyN2To6VB,r,r,>26,setN2VB
cpyN2To6VB,*,*,<,cpyN2To6VB

cpyN2To6VC,r,r,>26,setN2VC
cpyN2To6VC,*,*,<,cpyN2To6VC

cpyN2To6VD,r,r,>26,setN2VD
cpyN2To6VD,*,*,<,cpyN2To6VD

cpyN2To6VE,r,r,>26,setN2VE
cpyN2To6VE,*,*,<,cpyN2To6VE

cpyN2To6VF,r,r,>26,setN2VF
cpyN2To6VF,*,*,<,cpyN2To6VF

//-
cpyN2To7,0,0,<86,cpyN2To7V0
cpyN2To7,_,0,<86,cpyN2To7V0
cpyN2To7,1,0,<86,cpyN2To7V1
cpyN2To7,2,0,<86,cpyN2To7V2
cpyN2To7,3,0,<86,cpyN2To7V3
cpyN2To7,4,0,<86,cpyN2To7V4
cpyN2To7,5,0,<86,cpyN2To7V5
cpyN2To7,6,0,<86,cpyN2To7V6
cpyN2To7,7,0,<86,cpyN2To7V7
cpyN2To7,8,0,<86,cpyN2To7V8
cpyN2To7,9,0,<86,cpyN2To7V9
cpyN2To7,A,0,<86,cpyN2To7VA
cpyN2To7,B,0,<86,cpyN2To7VB
cpyN2To7,C,0,<86,cpyN2To7VC
cpyN2To7,D,0,<86,cpyN2To7VD
cpyN2To7,E,0,<86,cpyN2To7VE
cpyN2To7,F,0,<86,cpyN2To7VF

cpyN2To7V0,r,r,>30,setN2V0
cpyN2To7V0,*,*,<,cpyN2To7V0

cpyN2To7V1,r,r,>30,setN2V1
cpyN2To7V1,*,*,<,cpyN2To7V1

cpyN2To7V2,r,r,>30,setN2V2
cpyN2To7V2,*,*,<,cpyN2To7V2

cpyN2To7V3,r,r,>30,setN2V3
cpyN2To7V3,*,*,<,cpyN2To7V3

cpyN2To7V4,r,r,>30,setN2V4
cpyN2To7V4,*,*,<,cpyN2To7V4

cpyN2To7V5,r,r,>30,setN2V5
cpyN2To7V5,*,*,<,cpyN2To7V5

cpyN2To7V6,r,r,>30,setN2V6
cpyN2To7V6,*,*,<,cpyN2To7V6

cpyN2To7V7,r,r,>30,setN2V7
cpyN2To7V7,*,*,<,cpyN2To7V7

cpyN2To7V8,r,r,>30,setN2V8
cpyN2To7V8,*,*,<,cpyN2To7V8

cpyN2To7V9,r,r,>30,setN2V9
cpyN2To7V9,*,*,<,cpyN2To7V9

cpyN2To7VA,r,r,>30,setN2VA
cpyN2To7VA,*,*,<,cpyN2To7VA

cpyN2To7VB,r,r,>30,setN2VB
cpyN2To7VB,*,*,<,cpyN2To7VB

cpyN2To7VC,r,r,>30,setN2VC
cpyN2To7VC,*,*,<,cpyN2To7VC

cpyN2To7VD,r,r,>30,setN2VD
cpyN2To7VD,*,*,<,cpyN2To7VD

cpyN2To7VE,r,r,>30,setN2VE
cpyN2To7VE,*,*,<,cpyN2To7VE

cpyN2To7VF,r,r,>30,setN2VF
cpyN2To7VF,*,*,<,cpyN2To7VF

//-
cpyN2To8,0,0,<86,cpyN2To8V0
cpyN2To8,_,0,<86,cpyN2To8V0
cpyN2To8,1,0,<86,cpyN2To8V1
cpyN2To8,2,0,<86,cpyN2To8V2
cpyN2To8,3,0,<86,cpyN2To8V3
cpyN2To8,4,0,<86,cpyN2To8V4
cpyN2To8,5,0,<86,cpyN2To8V5
cpyN2To8,6,0,<86,cpyN2To8V6
cpyN2To8,7,0,<86,cpyN2To8V7
cpyN2To8,8,0,<86,cpyN2To8V8
cpyN2To8,9,0,<86,cpyN2To8V9
cpyN2To8,A,0,<86,cpyN2To8VA
cpyN2To8,B,0,<86,cpyN2To8VB
cpyN2To8,C,0,<86,cpyN2To8VC
cpyN2To8,D,0,<86,cpyN2To8VD
cpyN2To8,E,0,<86,cpyN2To8VE
cpyN2To8,F,0,<86,cpyN2To8VF

cpyN2To8V0,r,r,>34,setN2V0
cpyN2To8V0,*,*,<,cpyN2To8V0

cpyN2To8V1,r,r,>34,setN2V1
cpyN2To8V1,*,*,<,cpyN2To8V1

cpyN2To8V2,r,r,>34,setN2V2
cpyN2To8V2,*,*,<,cpyN2To8V2

cpyN2To8V3,r,r,>34,setN2V3
cpyN2To8V3,*,*,<,cpyN2To8V3

cpyN2To8V4,r,r,>34,setN2V4
cpyN2To8V4,*,*,<,cpyN2To8V4

cpyN2To8V5,r,r,>34,setN2V5
cpyN2To8V5,*,*,<,cpyN2To8V5

cpyN2To8V6,r,r,>34,setN2V6
cpyN2To8V6,*,*,<,cpyN2To8V6

cpyN2To8V7,r,r,>34,setN2V7
cpyN2To8V7,*,*,<,cpyN2To8V7

cpyN2To8V8,r,r,>34,setN2V8
cpyN2To8V8,*,*,<,cpyN2To8V8

cpyN2To8V9,r,r,>34,setN2V9
cpyN2To8V9,*,*,<,cpyN2To8V9

cpyN2To8VA,r,r,>34,setN2VA
cpyN2To8VA,*,*,<,cpyN2To8VA

cpyN2To8VB,r,r,>34,setN2VB
cpyN2To8VB,*,*,<,cpyN2To8VB

cpyN2To8VC,r,r,>34,setN2VC
cpyN2To8VC,*,*,<,cpyN2To8VC

cpyN2To8VD,r,r,>34,setN2VD
cpyN2To8VD,*,*,<,cpyN2To8VD

cpyN2To8VE,r,r,>34,setN2VE
cpyN2To8VE,*,*,<,cpyN2To8VE

cpyN2To8VF,r,r,>34,setN2VF
cpyN2To8VF,*,*,<,cpyN2To8VF

//-
cpyN2To9,0,0,<86,cpyN2To9V0
cpyN2To9,_,0,<86,cpyN2To9V0
cpyN2To9,1,0,<86,cpyN2To9V1
cpyN2To9,2,0,<86,cpyN2To9V2
cpyN2To9,3,0,<86,cpyN2To9V3
cpyN2To9,4,0,<86,cpyN2To9V4
cpyN2To9,5,0,<86,cpyN2To9V5
cpyN2To9,6,0,<86,cpyN2To9V6
cpyN2To9,7,0,<86,cpyN2To9V7
cpyN2To9,8,0,<86,cpyN2To9V8
cpyN2To9,9,0,<86,cpyN2To9V9
cpyN2To9,A,0,<86,cpyN2To9VA
cpyN2To9,B,0,<86,cpyN2To9VB
cpyN2To9,C,0,<86,cpyN2To9VC
cpyN2To9,D,0,<86,cpyN2To9VD
cpyN2To9,E,0,<86,cpyN2To9VE
cpyN2To9,F,0,<86,cpyN2To9VF

cpyN2To9V0,r,r,>38,setN2V0
cpyN2To9V0,*,*,<,cpyN2To9V0

cpyN2To9V1,r,r,>38,setN2V1
cpyN2To9V1,*,*,<,cpyN2To9V1

cpyN2To9V2,r,r,>38,setN2V2
cpyN2To9V2,*,*,<,cpyN2To9V2

cpyN2To9V3,r,r,>38,setN2V3
cpyN2To9V3,*,*,<,cpyN2To9V3

cpyN2To9V4,r,r,>38,setN2V4
cpyN2To9V4,*,*,<,cpyN2To9V4

cpyN2To9V5,r,r,>38,setN2V5
cpyN2To9V5,*,*,<,cpyN2To9V5

cpyN2To9V6,r,r,>38,setN2V6
cpyN2To9V6,*,*,<,cpyN2To9V6

cpyN2To9V7,r,r,>38,setN2V7
cpyN2To9V7,*,*,<,cpyN2To9V7

cpyN2To9V8,r,r,>38,setN2V8
cpyN2To9V8,*,*,<,cpyN2To9V8

cpyN2To9V9,r,r,>38,setN2V9
cpyN2To9V9,*,*,<,cpyN2To9V9

cpyN2To9VA,r,r,>38,setN2VA
cpyN2To9VA,*,*,<,cpyN2To9VA

cpyN2To9VB,r,r,>38,setN2VB
cpyN2To9VB,*,*,<,cpyN2To9VB

cpyN2To9VC,r,r,>38,setN2VC
cpyN2To9VC,*,*,<,cpyN2To9VC

cpyN2To9VD,r,r,>38,setN2VD
cpyN2To9VD,*,*,<,cpyN2To9VD

cpyN2To9VE,r,r,>38,setN2VE
cpyN2To9VE,*,*,<,cpyN2To9VE

cpyN2To9VF,r,r,>38,setN2VF
cpyN2To9VF,*,*,<,cpyN2To9VF

//-
cpyN2ToA,0,0,<86,cpyN2ToAV0
cpyN2ToA,_,0,<86,cpyN2ToAV0
cpyN2ToA,1,0,<86,cpyN2ToAV1
cpyN2ToA,2,0,<86,cpyN2ToAV2
cpyN2ToA,3,0,<86,cpyN2ToAV3
cpyN2ToA,4,0,<86,cpyN2ToAV4
cpyN2ToA,5,0,<86,cpyN2ToAV5
cpyN2ToA,6,0,<86,cpyN2ToAV6
cpyN2ToA,7,0,<86,cpyN2ToAV7
cpyN2ToA,8,0,<86,cpyN2ToAV8
cpyN2ToA,9,0,<86,cpyN2ToAV9
cpyN2ToA,A,0,<86,cpyN2ToAVA
cpyN2ToA,B,0,<86,cpyN2ToAVB
cpyN2ToA,C,0,<86,cpyN2ToAVC
cpyN2ToA,D,0,<86,cpyN2ToAVD
cpyN2ToA,E,0,<86,cpyN2ToAVE
cpyN2ToA,F,0,<86,cpyN2ToAVF

cpyN2ToAV0,r,r,>42,setN2V0
cpyN2ToAV0,*,*,<,cpyN2ToAV0

cpyN2ToAV1,r,r,>42,setN2V1
cpyN2ToAV1,*,*,<,cpyN2ToAV1

cpyN2ToAV2,r,r,>42,setN2V2
cpyN2ToAV2,*,*,<,cpyN2ToAV2

cpyN2ToAV3,r,r,>42,setN2V3
cpyN2ToAV3,*,*,<,cpyN2ToAV3

cpyN2ToAV4,r,r,>42,setN2V4
cpyN2ToAV4,*,*,<,cpyN2ToAV4

cpyN2ToAV5,r,r,>42,setN2V5
cpyN2ToAV5,*,*,<,cpyN2ToAV5

cpyN2ToAV6,r,r,>42,setN2V6
cpyN2ToAV6,*,*,<,cpyN2ToAV6

cpyN2ToAV7,r,r,>42,setN2V7
cpyN2ToAV7,*,*,<,cpyN2ToAV7

cpyN2ToAV8,r,r,>42,setN2V8
cpyN2ToAV8,*,*,<,cpyN2ToAV8

cpyN2ToAV9,r,r,>42,setN2V9
cpyN2ToAV9,*,*,<,cpyN2ToAV9

cpyN2ToAVA,r,r,>42,setN2VA
cpyN2ToAVA,*,*,<,cpyN2ToAVA

cpyN2ToAVB,r,r,>42,setN2VB
cpyN2ToAVB,*,*,<,cpyN2ToAVB

cpyN2ToAVC,r,r,>42,setN2VC
cpyN2ToAVC,*,*,<,cpyN2ToAVC

cpyN2ToAVD,r,r,>42,setN2VD
cpyN2ToAVD,*,*,<,cpyN2ToAVD

cpyN2ToAVE,r,r,>42,setN2VE
cpyN2ToAVE,*,*,<,cpyN2ToAVE

cpyN2ToAVF,r,r,>42,setN2VF
cpyN2ToAVF,*,*,<,cpyN2ToAVF

//-
cpyN2ToB,0,0,<86,cpyN2ToBV0
cpyN2ToB,_,0,<86,cpyN2ToBV0
cpyN2ToB,1,0,<86,cpyN2ToBV1
cpyN2ToB,2,0,<86,cpyN2ToBV2
cpyN2ToB,3,0,<86,cpyN2ToBV3
cpyN2ToB,4,0,<86,cpyN2ToBV4
cpyN2ToB,5,0,<86,cpyN2ToBV5
cpyN2ToB,6,0,<86,cpyN2ToBV6
cpyN2ToB,7,0,<86,cpyN2ToBV7
cpyN2ToB,8,0,<86,cpyN2ToBV8
cpyN2ToB,9,0,<86,cpyN2ToBV9
cpyN2ToB,A,0,<86,cpyN2ToBVA
cpyN2ToB,B,0,<86,cpyN2ToBVB
cpyN2ToB,C,0,<86,cpyN2ToBVC
cpyN2ToB,D,0,<86,cpyN2ToBVD
cpyN2ToB,E,0,<86,cpyN2ToBVE
cpyN2ToB,F,0,<86,cpyN2ToBVF

cpyN2ToBV0,r,r,>46,setN2V0
cpyN2ToBV0,*,*,<,cpyN2ToBV0

cpyN2ToBV1,r,r,>46,setN2V1
cpyN2ToBV1,*,*,<,cpyN2ToBV1

cpyN2ToBV2,r,r,>46,setN2V2
cpyN2ToBV2,*,*,<,cpyN2ToBV2

cpyN2ToBV3,r,r,>46,setN2V3
cpyN2ToBV3,*,*,<,cpyN2ToBV3

cpyN2ToBV4,r,r,>46,setN2V4
cpyN2ToBV4,*,*,<,cpyN2ToBV4

cpyN2ToBV5,r,r,>46,setN2V5
cpyN2ToBV5,*,*,<,cpyN2ToBV5

cpyN2ToBV6,r,r,>46,setN2V6
cpyN2ToBV6,*,*,<,cpyN2ToBV6

cpyN2ToBV7,r,r,>46,setN2V7
cpyN2ToBV7,*,*,<,cpyN2ToBV7

cpyN2ToBV8,r,r,>46,setN2V8
cpyN2ToBV8,*,*,<,cpyN2ToBV8

cpyN2ToBV9,r,r,>46,setN2V9
cpyN2ToBV9,*,*,<,cpyN2ToBV9

cpyN2ToBVA,r,r,>46,setN2VA
cpyN2ToBVA,*,*,<,cpyN2ToBVA

cpyN2ToBVB,r,r,>46,setN2VB
cpyN2ToBVB,*,*,<,cpyN2ToBVB

cpyN2ToBVC,r,r,>46,setN2VC
cpyN2ToBVC,*,*,<,cpyN2ToBVC

cpyN2ToBVD,r,r,>46,setN2VD
cpyN2ToBVD,*,*,<,cpyN2ToBVD

cpyN2ToBVE,r,r,>46,setN2VE
cpyN2ToBVE,*,*,<,cpyN2ToBVE

cpyN2ToBVF,r,r,>46,setN2VF
cpyN2ToBVF,*,*,<,cpyN2ToBVF

//-
cpyN2ToC,0,0,<86,cpyN2ToCV0
cpyN2ToC,_,0,<86,cpyN2ToCV0
cpyN2ToC,1,0,<86,cpyN2ToCV1
cpyN2ToC,2,0,<86,cpyN2ToCV2
cpyN2ToC,3,0,<86,cpyN2ToCV3
cpyN2ToC,4,0,<86,cpyN2ToCV4
cpyN2ToC,5,0,<86,cpyN2ToCV5
cpyN2ToC,6,0,<86,cpyN2ToCV6
cpyN2ToC,7,0,<86,cpyN2ToCV7
cpyN2ToC,8,0,<86,cpyN2ToCV8
cpyN2ToC,9,0,<86,cpyN2ToCV9
cpyN2ToC,A,0,<86,cpyN2ToCVA
cpyN2ToC,B,0,<86,cpyN2ToCVB
cpyN2ToC,C,0,<86,cpyN2ToCVC
cpyN2ToC,D,0,<86,cpyN2ToCVD
cpyN2ToC,E,0,<86,cpyN2ToCVE
cpyN2ToC,F,0,<86,cpyN2ToCVF

cpyN2ToCV0,r,r,>50,setN2V0
cpyN2ToCV0,*,*,<,cpyN2ToCV0

cpyN2ToCV1,r,r,>50,setN2V1
cpyN2ToCV1,*,*,<,cpyN2ToCV1

cpyN2ToCV2,r,r,>50,setN2V2
cpyN2ToCV2,*,*,<,cpyN2ToCV2

cpyN2ToCV3,r,r,>50,setN2V3
cpyN2ToCV3,*,*,<,cpyN2ToCV3

cpyN2ToCV4,r,r,>50,setN2V4
cpyN2ToCV4,*,*,<,cpyN2ToCV4

cpyN2ToCV5,r,r,>50,setN2V5
cpyN2ToCV5,*,*,<,cpyN2ToCV5

cpyN2ToCV6,r,r,>50,setN2V6
cpyN2ToCV6,*,*,<,cpyN2ToCV6

cpyN2ToCV7,r,r,>50,setN2V7
cpyN2ToCV7,*,*,<,cpyN2ToCV7

cpyN2ToCV8,r,r,>50,setN2V8
cpyN2ToCV8,*,*,<,cpyN2ToCV8

cpyN2ToCV9,r,r,>50,setN2V9
cpyN2ToCV9,*,*,<,cpyN2ToCV9

cpyN2ToCVA,r,r,>50,setN2VA
cpyN2ToCVA,*,*,<,cpyN2ToCVA

cpyN2ToCVB,r,r,>50,setN2VB
cpyN2ToCVB,*,*,<,cpyN2ToCVB

cpyN2ToCVC,r,r,>50,setN2VC
cpyN2ToCVC,*,*,<,cpyN2ToCVC

cpyN2ToCVD,r,r,>50,setN2VD
cpyN2ToCVD,*,*,<,cpyN2ToCVD

cpyN2ToCVE,r,r,>50,setN2VE
cpyN2ToCVE,*,*,<,cpyN2ToCVE

cpyN2ToCVF,r,r,>50,setN2VF
cpyN2ToCVF,*,*,<,cpyN2ToCVF

//-
cpyN2ToD,0,0,<86,cpyN2ToDV0
cpyN2ToD,_,0,<86,cpyN2ToDV0
cpyN2ToD,1,0,<86,cpyN2ToDV1
cpyN2ToD,2,0,<86,cpyN2ToDV2
cpyN2ToD,3,0,<86,cpyN2ToDV3
cpyN2ToD,4,0,<86,cpyN2ToDV4
cpyN2ToD,5,0,<86,cpyN2ToDV5
cpyN2ToD,6,0,<86,cpyN2ToDV6
cpyN2ToD,7,0,<86,cpyN2ToDV7
cpyN2ToD,8,0,<86,cpyN2ToDV8
cpyN2ToD,9,0,<86,cpyN2ToDV9
cpyN2ToD,A,0,<86,cpyN2ToDVA
cpyN2ToD,B,0,<86,cpyN2ToDVB
cpyN2ToD,C,0,<86,cpyN2ToDVC
cpyN2ToD,D,0,<86,cpyN2ToDVD
cpyN2ToD,E,0,<86,cpyN2ToDVE
cpyN2ToD,F,0,<86,cpyN2ToDVF

cpyN2ToDV0,r,r,>54,setN2V0
cpyN2ToDV0,*,*,<,cpyN2ToDV0

cpyN2ToDV1,r,r,>54,setN2V1
cpyN2ToDV1,*,*,<,cpyN2ToDV1

cpyN2ToDV2,r,r,>54,setN2V2
cpyN2ToDV2,*,*,<,cpyN2ToDV2

cpyN2ToDV3,r,r,>54,setN2V3
cpyN2ToDV3,*,*,<,cpyN2ToDV3

cpyN2ToDV4,r,r,>54,setN2V4
cpyN2ToDV4,*,*,<,cpyN2ToDV4

cpyN2ToDV5,r,r,>54,setN2V5
cpyN2ToDV5,*,*,<,cpyN2ToDV5

cpyN2ToDV6,r,r,>54,setN2V6
cpyN2ToDV6,*,*,<,cpyN2ToDV6

cpyN2ToDV7,r,r,>54,setN2V7
cpyN2ToDV7,*,*,<,cpyN2ToDV7

cpyN2ToDV8,r,r,>54,setN2V8
cpyN2ToDV8,*,*,<,cpyN2ToDV8

cpyN2ToDV9,r,r,>54,setN2V9
cpyN2ToDV9,*,*,<,cpyN2ToDV9

cpyN2ToDVA,r,r,>54,setN2VA
cpyN2ToDVA,*,*,<,cpyN2ToDVA

cpyN2ToDVB,r,r,>54,setN2VB
cpyN2ToDVB,*,*,<,cpyN2ToDVB

cpyN2ToDVC,r,r,>54,setN2VC
cpyN2ToDVC,*,*,<,cpyN2ToDVC

cpyN2ToDVD,r,r,>54,setN2VD
cpyN2ToDVD,*,*,<,cpyN2ToDVD

cpyN2ToDVE,r,r,>54,setN2VE
cpyN2ToDVE,*,*,<,cpyN2ToDVE

cpyN2ToDVF,r,r,>54,setN2VF
cpyN2ToDVF,*,*,<,cpyN2ToDVF

//-
cpyN2ToE,0,0,<86,cpyN2ToEV0
cpyN2ToE,_,0,<86,cpyN2ToEV0
cpyN2ToE,1,0,<86,cpyN2ToEV1
cpyN2ToE,2,0,<86,cpyN2ToEV2
cpyN2ToE,3,0,<86,cpyN2ToEV3
cpyN2ToE,4,0,<86,cpyN2ToEV4
cpyN2ToE,5,0,<86,cpyN2ToEV5
cpyN2ToE,6,0,<86,cpyN2ToEV6
cpyN2ToE,7,0,<86,cpyN2ToEV7
cpyN2ToE,8,0,<86,cpyN2ToEV8
cpyN2ToE,9,0,<86,cpyN2ToEV9
cpyN2ToE,A,0,<86,cpyN2ToEVA
cpyN2ToE,B,0,<86,cpyN2ToEVB
cpyN2ToE,C,0,<86,cpyN2ToEVC
cpyN2ToE,D,0,<86,cpyN2ToEVD
cpyN2ToE,E,0,<86,cpyN2ToEVE
cpyN2ToE,F,0,<86,cpyN2ToEVF

cpyN2ToEV0,r,r,>58,setN2V0
cpyN2ToEV0,*,*,<,cpyN2ToEV0

cpyN2ToEV1,r,r,>58,setN2V1
cpyN2ToEV1,*,*,<,cpyN2ToEV1

cpyN2ToEV2,r,r,>58,setN2V2
cpyN2ToEV2,*,*,<,cpyN2ToEV2

cpyN2ToEV3,r,r,>58,setN2V3
cpyN2ToEV3,*,*,<,cpyN2ToEV3

cpyN2ToEV4,r,r,>58,setN2V4
cpyN2ToEV4,*,*,<,cpyN2ToEV4

cpyN2ToEV5,r,r,>58,setN2V5
cpyN2ToEV5,*,*,<,cpyN2ToEV5

cpyN2ToEV6,r,r,>58,setN2V6
cpyN2ToEV6,*,*,<,cpyN2ToEV6

cpyN2ToEV7,r,r,>58,setN2V7
cpyN2ToEV7,*,*,<,cpyN2ToEV7

cpyN2ToEV8,r,r,>58,setN2V8
cpyN2ToEV8,*,*,<,cpyN2ToEV8

cpyN2ToEV9,r,r,>58,setN2V9
cpyN2ToEV9,*,*,<,cpyN2ToEV9

cpyN2ToEVA,r,r,>58,setN2VA
cpyN2ToEVA,*,*,<,cpyN2ToEVA

cpyN2ToEVB,r,r,>58,setN2VB
cpyN2ToEVB,*,*,<,cpyN2ToEVB

cpyN2ToEVC,r,r,>58,setN2VC
cpyN2ToEVC,*,*,<,cpyN2ToEVC

cpyN2ToEVD,r,r,>58,setN2VD
cpyN2ToEVD,*,*,<,cpyN2ToEVD

cpyN2ToEVE,r,r,>58,setN2VE
cpyN2ToEVE,*,*,<,cpyN2ToEVE

cpyN2ToEVF,r,r,>58,setN2VF
cpyN2ToEVF,*,*,<,cpyN2ToEVF

//-
cpyN2ToF,0,0,<86,cpyN2ToFV0
cpyN2ToF,_,0,<86,cpyN2ToFV0
cpyN2ToF,1,0,<86,cpyN2ToFV1
cpyN2ToF,2,0,<86,cpyN2ToFV2
cpyN2ToF,3,0,<86,cpyN2ToFV3
cpyN2ToF,4,0,<86,cpyN2ToFV4
cpyN2ToF,5,0,<86,cpyN2ToFV5
cpyN2ToF,6,0,<86,cpyN2ToFV6
cpyN2ToF,7,0,<86,cpyN2ToFV7
cpyN2ToF,8,0,<86,cpyN2ToFV8
cpyN2ToF,9,0,<86,cpyN2ToFV9
cpyN2ToF,A,0,<86,cpyN2ToFVA
cpyN2ToF,B,0,<86,cpyN2ToFVB
cpyN2ToF,C,0,<86,cpyN2ToFVC
cpyN2ToF,D,0,<86,cpyN2ToFVD
cpyN2ToF,E,0,<86,cpyN2ToFVE
cpyN2ToF,F,0,<86,cpyN2ToFVF

cpyN2ToFV0,r,r,>62,setN2V0
cpyN2ToFV0,*,*,<,cpyN2ToFV0

cpyN2ToFV1,r,r,>62,setN2V1
cpyN2ToFV1,*,*,<,cpyN2ToFV1

cpyN2ToFV2,r,r,>62,setN2V2
cpyN2ToFV2,*,*,<,cpyN2ToFV2

cpyN2ToFV3,r,r,>62,setN2V3
cpyN2ToFV3,*,*,<,cpyN2ToFV3

cpyN2ToFV4,r,r,>62,setN2V4
cpyN2ToFV4,*,*,<,cpyN2ToFV4

cpyN2ToFV5,r,r,>62,setN2V5
cpyN2ToFV5,*,*,<,cpyN2ToFV5

cpyN2ToFV6,r,r,>62,setN2V6
cpyN2ToFV6,*,*,<,cpyN2ToFV6

cpyN2ToFV7,r,r,>62,setN2V7
cpyN2ToFV7,*,*,<,cpyN2ToFV7

cpyN2ToFV8,r,r,>62,setN2V8
cpyN2ToFV8,*,*,<,cpyN2ToFV8

cpyN2ToFV9,r,r,>62,setN2V9
cpyN2ToFV9,*,*,<,cpyN2ToFV9

cpyN2ToFVA,r,r,>62,setN2VA
cpyN2ToFVA,*,*,<,cpyN2ToFVA

cpyN2ToFVB,r,r,>62,setN2VB
cpyN2ToFVB,*,*,<,cpyN2ToFVB

cpyN2ToFVC,r,r,>62,setN2VC
cpyN2ToFVC,*,*,<,cpyN2ToFVC

cpyN2ToFVD,r,r,>62,setN2VD
cpyN2ToFVD,*,*,<,cpyN2ToFVD

cpyN2ToFVE,r,r,>62,setN2VE
cpyN2ToFVE,*,*,<,cpyN2ToFVE

cpyN2ToFVF,r,r,>62,setN2VF
cpyN2ToFVF,*,*,<,cpyN2ToFVF
//..

cpyN3,1,1,<3,cpyN3To1
cpyN3,2,2,<3,cpyN3To2
cpyN3,3,3,<3,cpyN3To3
cpyN3,4,4,<3,cpyN3To4
cpyN3,5,5,<3,cpyN3To5
cpyN3,6,6,<3,cpyN3To6
cpyN3,7,7,<3,cpyN3To7
cpyN3,8,8,<3,cpyN3To8
cpyN3,9,9,<3,cpyN3To9
cpyN3,A,A,<3,cpyN3ToA
cpyN3,B,B,<3,cpyN3ToB
cpyN3,C,C,<3,cpyN3ToC
cpyN3,D,D,<3,cpyN3ToD
cpyN3,E,E,<3,cpyN3ToE
cpyN3,F,F,<3,cpyN3ToF

//..--..

//...
cpyN3To1,0,0,<87,cpyN3To1V0
cpyN3To1,_,0,<87,cpyN3To1V0
cpyN3To1,1,0,<87,cpyN3To1V1
cpyN3To1,2,0,<87,cpyN3To1V2
cpyN3To1,3,0,<87,cpyN3To1V3
cpyN3To1,4,0,<87,cpyN3To1V4
cpyN3To1,5,0,<87,cpyN3To1V5
cpyN3To1,6,0,<87,cpyN3To1V6
cpyN3To1,7,0,<87,cpyN3To1V7
cpyN3To1,8,0,<87,cpyN3To1V8
cpyN3To1,9,0,<87,cpyN3To1V9
cpyN3To1,A,0,<87,cpyN3To1VA
cpyN3To1,B,0,<87,cpyN3To1VB
cpyN3To1,C,0,<87,cpyN3To1VC
cpyN3To1,D,0,<87,cpyN3To1VD
cpyN3To1,E,0,<87,cpyN3To1VE
cpyN3To1,F,0,<87,cpyN3To1VF

cpyN3To1V0,r,r,>7,setN3V0
cpyN3To1V0,*,*,<,cpyN3To1V0
setN3V0,*,0,>,govN4
govN4,v,v,>,cpyN4
govN4,p,p,>25,govN4
govN4,*,*,>,govN4

cpyN3To1V1,r,r,>7,setN3V1
cpyN3To1V1,*,*,<,cpyN3To1V1
setN3V1,*,1,>,govN4

cpyN3To1V2,r,r,>7,setN3V2
cpyN3To1V2,*,*,<,cpyN3To1V2
setN3V2,*,2,>,govN4

cpyN3To1V3,r,r,>7,setN3V3
cpyN3To1V3,*,*,<,cpyN3To1V3
setN3V3,*,3,>,govN4

cpyN3To1V4,r,r,>7,setN3V4
cpyN3To1V4,*,*,<,cpyN3To1V4
setN3V4,*,4,>,govN4

cpyN3To1V5,r,r,>7,setN3V5
cpyN3To1V5,*,*,<,cpyN3To1V5
setN3V5,*,5,>,govN4

cpyN3To1V6,r,r,>7,setN3V6
cpyN3To1V6,*,*,<,cpyN3To1V6
setN3V6,*,6,>,govN4

cpyN3To1V7,r,r,>7,setN3V7
cpyN3To1V7,*,*,<,cpyN3To1V7
setN3V7,*,7,>,govN4

cpyN3To1V8,r,r,>7,setN3V8
cpyN3To1V8,*,*,<,cpyN3To1V8
setN3V8,*,8,>,govN4

cpyN3To1V9,r,r,>7,setN3V9
cpyN3To1V9,*,*,<,cpyN3To1V9
setN3V9,*,9,>,govN4

cpyN3To1VA,r,r,>7,setN3VA
cpyN3To1VA,*,*,<,cpyN3To1VA
setN3VA,*,A,>,govN4

cpyN3To1VB,r,r,>7,setN3VB
cpyN3To1VB,*,*,<,cpyN3To1VB
setN3VB,*,B,>,govN4

cpyN3To1VC,r,r,>7,setN3VC
cpyN3To1VC,*,*,<,cpyN3To1VC
setN3VC,*,C,>,govN4

cpyN3To1VD,r,r,>7,setN3VD
cpyN3To1VD,*,*,<,cpyN3To1VD
setN3VD,*,D,>,govN4

cpyN3To1VE,r,r,>7,setN3VE
cpyN3To1VE,*,*,<,cpyN3To1VE
setN3VE,*,E,>,govN4

cpyN3To1VF,r,r,>7,setN3VF
cpyN3To1VF,*,*,<,cpyN3To1VF
setN3VF,*,F,>,govN4

//-
cpyN3To2,0,0,<87,cpyN3To2V0
cpyN3To2,_,0,<87,cpyN3To2V0
cpyN3To2,1,0,<87,cpyN3To2V1
cpyN3To2,2,0,<87,cpyN3To2V2
cpyN3To2,3,0,<87,cpyN3To2V3
cpyN3To2,4,0,<87,cpyN3To2V4
cpyN3To2,5,0,<87,cpyN3To2V5
cpyN3To2,6,0,<87,cpyN3To2V6
cpyN3To2,7,0,<87,cpyN3To2V7
cpyN3To2,8,0,<87,cpyN3To2V8
cpyN3To2,9,0,<87,cpyN3To2V9
cpyN3To2,A,0,<87,cpyN3To2VA
cpyN3To2,B,0,<87,cpyN3To2VB
cpyN3To2,C,0,<87,cpyN3To2VC
cpyN3To2,D,0,<87,cpyN3To2VD
cpyN3To2,E,0,<87,cpyN3To2VE
cpyN3To2,F,0,<87,cpyN3To2VF

cpyN3To2V0,r,r,>11,setN3V0
cpyN3To2V0,*,*,<,cpyN3To2V0

cpyN3To2V1,r,r,>11,setN3V1
cpyN3To2V1,*,*,<,cpyN3To2V1

cpyN3To2V2,r,r,>11,setN3V2
cpyN3To2V2,*,*,<,cpyN3To2V2

cpyN3To2V3,r,r,>11,setN3V3
cpyN3To2V3,*,*,<,cpyN3To2V3

cpyN3To2V4,r,r,>11,setN3V4
cpyN3To2V4,*,*,<,cpyN3To2V4

cpyN3To2V5,r,r,>11,setN3V5
cpyN3To2V5,*,*,<,cpyN3To2V5

cpyN3To2V6,r,r,>11,setN3V6
cpyN3To2V6,*,*,<,cpyN3To2V6

cpyN3To2V7,r,r,>11,setN3V7
cpyN3To2V7,*,*,<,cpyN3To2V7

cpyN3To2V8,r,r,>11,setN3V8
cpyN3To2V8,*,*,<,cpyN3To2V8

cpyN3To2V9,r,r,>11,setN3V9
cpyN3To2V9,*,*,<,cpyN3To2V9

cpyN3To2VA,r,r,>11,setN3VA
cpyN3To2VA,*,*,<,cpyN3To2VA

cpyN3To2VB,r,r,>11,setN3VB
cpyN3To2VB,*,*,<,cpyN3To2VB

cpyN3To2VC,r,r,>11,setN3VC
cpyN3To2VC,*,*,<,cpyN3To2VC

cpyN3To2VD,r,r,>11,setN3VD
cpyN3To2VD,*,*,<,cpyN3To2VD

cpyN3To2VE,r,r,>11,setN3VE
cpyN3To2VE,*,*,<,cpyN3To2VE

cpyN3To2VF,r,r,>11,setN3VF
cpyN3To2VF,*,*,<,cpyN3To2VF

//-
cpyN3To3,0,0,<87,cpyN3To3V0
cpyN3To3,_,0,<87,cpyN3To3V0
cpyN3To3,1,0,<87,cpyN3To3V1
cpyN3To3,2,0,<87,cpyN3To3V2
cpyN3To3,3,0,<87,cpyN3To3V3
cpyN3To3,4,0,<87,cpyN3To3V4
cpyN3To3,5,0,<87,cpyN3To3V5
cpyN3To3,6,0,<87,cpyN3To3V6
cpyN3To3,7,0,<87,cpyN3To3V7
cpyN3To3,8,0,<87,cpyN3To3V8
cpyN3To3,9,0,<87,cpyN3To3V9
cpyN3To3,A,0,<87,cpyN3To3VA
cpyN3To3,B,0,<87,cpyN3To3VB
cpyN3To3,C,0,<87,cpyN3To3VC
cpyN3To3,D,0,<87,cpyN3To3VD
cpyN3To3,E,0,<87,cpyN3To3VE
cpyN3To3,F,0,<87,cpyN3To3VF

cpyN3To3V0,r,r,>15,setN3V0
cpyN3To3V0,*,*,<,cpyN3To3V0

cpyN3To3V1,r,r,>15,setN3V1
cpyN3To3V1,*,*,<,cpyN3To3V1

cpyN3To3V2,r,r,>15,setN3V2
cpyN3To3V2,*,*,<,cpyN3To3V2

cpyN3To3V3,r,r,>15,setN3V3
cpyN3To3V3,*,*,<,cpyN3To3V3

cpyN3To3V4,r,r,>15,setN3V4
cpyN3To3V4,*,*,<,cpyN3To3V4

cpyN3To3V5,r,r,>15,setN3V5
cpyN3To3V5,*,*,<,cpyN3To3V5

cpyN3To3V6,r,r,>15,setN3V6
cpyN3To3V6,*,*,<,cpyN3To3V6

cpyN3To3V7,r,r,>15,setN3V7
cpyN3To3V7,*,*,<,cpyN3To3V7

cpyN3To3V8,r,r,>15,setN3V8
cpyN3To3V8,*,*,<,cpyN3To3V8

cpyN3To3V9,r,r,>15,setN3V9
cpyN3To3V9,*,*,<,cpyN3To3V9

cpyN3To3VA,r,r,>15,setN3VA
cpyN3To3VA,*,*,<,cpyN3To3VA

cpyN3To3VB,r,r,>15,setN3VB
cpyN3To3VB,*,*,<,cpyN3To3VB

cpyN3To3VC,r,r,>15,setN3VC
cpyN3To3VC,*,*,<,cpyN3To3VC

cpyN3To3VD,r,r,>15,setN3VD
cpyN3To3VD,*,*,<,cpyN3To3VD

cpyN3To3VE,r,r,>15,setN3VE
cpyN3To3VE,*,*,<,cpyN3To3VE

cpyN3To3VF,r,r,>15,setN3VF
cpyN3To3VF,*,*,<,cpyN3To3VF

//-
cpyN3To4,0,0,<87,cpyN3To4V0
cpyN3To4,_,0,<87,cpyN3To4V0
cpyN3To4,1,0,<87,cpyN3To4V1
cpyN3To4,2,0,<87,cpyN3To4V2
cpyN3To4,3,0,<87,cpyN3To4V3
cpyN3To4,4,0,<87,cpyN3To4V4
cpyN3To4,5,0,<87,cpyN3To4V5
cpyN3To4,6,0,<87,cpyN3To4V6
cpyN3To4,7,0,<87,cpyN3To4V7
cpyN3To4,8,0,<87,cpyN3To4V8
cpyN3To4,9,0,<87,cpyN3To4V9
cpyN3To4,A,0,<87,cpyN3To4VA
cpyN3To4,B,0,<87,cpyN3To4VB
cpyN3To4,C,0,<87,cpyN3To4VC
cpyN3To4,D,0,<87,cpyN3To4VD
cpyN3To4,E,0,<87,cpyN3To4VE
cpyN3To4,F,0,<87,cpyN3To4VF

cpyN3To4V0,r,r,>19,setN3V0
cpyN3To4V0,*,*,<,cpyN3To4V0

cpyN3To4V1,r,r,>19,setN3V1
cpyN3To4V1,*,*,<,cpyN3To4V1

cpyN3To4V2,r,r,>19,setN3V2
cpyN3To4V2,*,*,<,cpyN3To4V2

cpyN3To4V3,r,r,>19,setN3V3
cpyN3To4V3,*,*,<,cpyN3To4V3

cpyN3To4V4,r,r,>19,setN3V4
cpyN3To4V4,*,*,<,cpyN3To4V4

cpyN3To4V5,r,r,>19,setN3V5
cpyN3To4V5,*,*,<,cpyN3To4V5

cpyN3To4V6,r,r,>19,setN3V6
cpyN3To4V6,*,*,<,cpyN3To4V6

cpyN3To4V7,r,r,>19,setN3V7
cpyN3To4V7,*,*,<,cpyN3To4V7

cpyN3To4V8,r,r,>19,setN3V8
cpyN3To4V8,*,*,<,cpyN3To4V8

cpyN3To4V9,r,r,>19,setN3V9
cpyN3To4V9,*,*,<,cpyN3To4V9

cpyN3To4VA,r,r,>19,setN3VA
cpyN3To4VA,*,*,<,cpyN3To4VA

cpyN3To4VB,r,r,>19,setN3VB
cpyN3To4VB,*,*,<,cpyN3To4VB

cpyN3To4VC,r,r,>19,setN3VC
cpyN3To4VC,*,*,<,cpyN3To4VC

cpyN3To4VD,r,r,>19,setN3VD
cpyN3To4VD,*,*,<,cpyN3To4VD

cpyN3To4VE,r,r,>19,setN3VE
cpyN3To4VE,*,*,<,cpyN3To4VE

cpyN3To4VF,r,r,>19,setN3VF
cpyN3To4VF,*,*,<,cpyN3To4VF

//-
cpyN3To5,0,0,<87,cpyN3To5V0
cpyN3To5,_,0,<87,cpyN3To5V0
cpyN3To5,1,0,<87,cpyN3To5V1
cpyN3To5,2,0,<87,cpyN3To5V2
cpyN3To5,3,0,<87,cpyN3To5V3
cpyN3To5,4,0,<87,cpyN3To5V4
cpyN3To5,5,0,<87,cpyN3To5V5
cpyN3To5,6,0,<87,cpyN3To5V6
cpyN3To5,7,0,<87,cpyN3To5V7
cpyN3To5,8,0,<87,cpyN3To5V8
cpyN3To5,9,0,<87,cpyN3To5V9
cpyN3To5,A,0,<87,cpyN3To5VA
cpyN3To5,B,0,<87,cpyN3To5VB
cpyN3To5,C,0,<87,cpyN3To5VC
cpyN3To5,D,0,<87,cpyN3To5VD
cpyN3To5,E,0,<87,cpyN3To5VE
cpyN3To5,F,0,<87,cpyN3To5VF

cpyN3To5V0,r,r,>23,setN3V0
cpyN3To5V0,*,*,<,cpyN3To5V0

cpyN3To5V1,r,r,>23,setN3V1
cpyN3To5V1,*,*,<,cpyN3To5V1

cpyN3To5V2,r,r,>23,setN3V2
cpyN3To5V2,*,*,<,cpyN3To5V2

cpyN3To5V3,r,r,>23,setN3V3
cpyN3To5V3,*,*,<,cpyN3To5V3

cpyN3To5V4,r,r,>23,setN3V4
cpyN3To5V4,*,*,<,cpyN3To5V4

cpyN3To5V5,r,r,>23,setN3V5
cpyN3To5V5,*,*,<,cpyN3To5V5

cpyN3To5V6,r,r,>23,setN3V6
cpyN3To5V6,*,*,<,cpyN3To5V6

cpyN3To5V7,r,r,>23,setN3V7
cpyN3To5V7,*,*,<,cpyN3To5V7

cpyN3To5V8,r,r,>23,setN3V8
cpyN3To5V8,*,*,<,cpyN3To5V8

cpyN3To5V9,r,r,>23,setN3V9
cpyN3To5V9,*,*,<,cpyN3To5V9

cpyN3To5VA,r,r,>23,setN3VA
cpyN3To5VA,*,*,<,cpyN3To5VA

cpyN3To5VB,r,r,>23,setN3VB
cpyN3To5VB,*,*,<,cpyN3To5VB

cpyN3To5VC,r,r,>23,setN3VC
cpyN3To5VC,*,*,<,cpyN3To5VC

cpyN3To5VD,r,r,>23,setN3VD
cpyN3To5VD,*,*,<,cpyN3To5VD

cpyN3To5VE,r,r,>23,setN3VE
cpyN3To5VE,*,*,<,cpyN3To5VE

cpyN3To5VF,r,r,>23,setN3VF
cpyN3To5VF,*,*,<,cpyN3To5VF

//-
cpyN3To6,0,0,<87,cpyN3To6V0
cpyN3To6,_,0,<87,cpyN3To6V0
cpyN3To6,1,0,<87,cpyN3To6V1
cpyN3To6,2,0,<87,cpyN3To6V2
cpyN3To6,3,0,<87,cpyN3To6V3
cpyN3To6,4,0,<87,cpyN3To6V4
cpyN3To6,5,0,<87,cpyN3To6V5
cpyN3To6,6,0,<87,cpyN3To6V6
cpyN3To6,7,0,<87,cpyN3To6V7
cpyN3To6,8,0,<87,cpyN3To6V8
cpyN3To6,9,0,<87,cpyN3To6V9
cpyN3To6,A,0,<87,cpyN3To6VA
cpyN3To6,B,0,<87,cpyN3To6VB
cpyN3To6,C,0,<87,cpyN3To6VC
cpyN3To6,D,0,<87,cpyN3To6VD
cpyN3To6,E,0,<87,cpyN3To6VE
cpyN3To6,F,0,<87,cpyN3To6VF

cpyN3To6V0,r,r,>27,setN3V0
cpyN3To6V0,*,*,<,cpyN3To6V0

cpyN3To6V1,r,r,>27,setN3V1
cpyN3To6V1,*,*,<,cpyN3To6V1

cpyN3To6V2,r,r,>27,setN3V2
cpyN3To6V2,*,*,<,cpyN3To6V2

cpyN3To6V3,r,r,>27,setN3V3
cpyN3To6V3,*,*,<,cpyN3To6V3

cpyN3To6V4,r,r,>27,setN3V4
cpyN3To6V4,*,*,<,cpyN3To6V4

cpyN3To6V5,r,r,>27,setN3V5
cpyN3To6V5,*,*,<,cpyN3To6V5

cpyN3To6V6,r,r,>27,setN3V6
cpyN3To6V6,*,*,<,cpyN3To6V6

cpyN3To6V7,r,r,>27,setN3V7
cpyN3To6V7,*,*,<,cpyN3To6V7

cpyN3To6V8,r,r,>27,setN3V8
cpyN3To6V8,*,*,<,cpyN3To6V8

cpyN3To6V9,r,r,>27,setN3V9
cpyN3To6V9,*,*,<,cpyN3To6V9

cpyN3To6VA,r,r,>27,setN3VA
cpyN3To6VA,*,*,<,cpyN3To6VA

cpyN3To6VB,r,r,>27,setN3VB
cpyN3To6VB,*,*,<,cpyN3To6VB

cpyN3To6VC,r,r,>27,setN3VC
cpyN3To6VC,*,*,<,cpyN3To6VC

cpyN3To6VD,r,r,>27,setN3VD
cpyN3To6VD,*,*,<,cpyN3To6VD

cpyN3To6VE,r,r,>27,setN3VE
cpyN3To6VE,*,*,<,cpyN3To6VE

cpyN3To6VF,r,r,>27,setN3VF
cpyN3To6VF,*,*,<,cpyN3To6VF

//-
cpyN3To7,0,0,<87,cpyN3To7V0
cpyN3To7,_,0,<87,cpyN3To7V0
cpyN3To7,1,0,<87,cpyN3To7V1
cpyN3To7,2,0,<87,cpyN3To7V2
cpyN3To7,3,0,<87,cpyN3To7V3
cpyN3To7,4,0,<87,cpyN3To7V4
cpyN3To7,5,0,<87,cpyN3To7V5
cpyN3To7,6,0,<87,cpyN3To7V6
cpyN3To7,7,0,<87,cpyN3To7V7
cpyN3To7,8,0,<87,cpyN3To7V8
cpyN3To7,9,0,<87,cpyN3To7V9
cpyN3To7,A,0,<87,cpyN3To7VA
cpyN3To7,B,0,<87,cpyN3To7VB
cpyN3To7,C,0,<87,cpyN3To7VC
cpyN3To7,D,0,<87,cpyN3To7VD
cpyN3To7,E,0,<87,cpyN3To7VE
cpyN3To7,F,0,<87,cpyN3To7VF

cpyN3To7V0,r,r,>31,setN3V0
cpyN3To7V0,*,*,<,cpyN3To7V0

cpyN3To7V1,r,r,>31,setN3V1
cpyN3To7V1,*,*,<,cpyN3To7V1

cpyN3To7V2,r,r,>31,setN3V2
cpyN3To7V2,*,*,<,cpyN3To7V2

cpyN3To7V3,r,r,>31,setN3V3
cpyN3To7V3,*,*,<,cpyN3To7V3

cpyN3To7V4,r,r,>31,setN3V4
cpyN3To7V4,*,*,<,cpyN3To7V4

cpyN3To7V5,r,r,>31,setN3V5
cpyN3To7V5,*,*,<,cpyN3To7V5

cpyN3To7V6,r,r,>31,setN3V6
cpyN3To7V6,*,*,<,cpyN3To7V6

cpyN3To7V7,r,r,>31,setN3V7
cpyN3To7V7,*,*,<,cpyN3To7V7

cpyN3To7V8,r,r,>31,setN3V8
cpyN3To7V8,*,*,<,cpyN3To7V8

cpyN3To7V9,r,r,>31,setN3V9
cpyN3To7V9,*,*,<,cpyN3To7V9

cpyN3To7VA,r,r,>31,setN3VA
cpyN3To7VA,*,*,<,cpyN3To7VA

cpyN3To7VB,r,r,>31,setN3VB
cpyN3To7VB,*,*,<,cpyN3To7VB

cpyN3To7VC,r,r,>31,setN3VC
cpyN3To7VC,*,*,<,cpyN3To7VC

cpyN3To7VD,r,r,>31,setN3VD
cpyN3To7VD,*,*,<,cpyN3To7VD

cpyN3To7VE,r,r,>31,setN3VE
cpyN3To7VE,*,*,<,cpyN3To7VE

cpyN3To7VF,r,r,>31,setN3VF
cpyN3To7VF,*,*,<,cpyN3To7VF

//-
cpyN3To8,0,0,<87,cpyN3To8V0
cpyN3To8,_,0,<87,cpyN3To8V0
cpyN3To8,1,0,<87,cpyN3To8V1
cpyN3To8,2,0,<87,cpyN3To8V2
cpyN3To8,3,0,<87,cpyN3To8V3
cpyN3To8,4,0,<87,cpyN3To8V4
cpyN3To8,5,0,<87,cpyN3To8V5
cpyN3To8,6,0,<87,cpyN3To8V6
cpyN3To8,7,0,<87,cpyN3To8V7
cpyN3To8,8,0,<87,cpyN3To8V8
cpyN3To8,9,0,<87,cpyN3To8V9
cpyN3To8,A,0,<87,cpyN3To8VA
cpyN3To8,B,0,<87,cpyN3To8VB
cpyN3To8,C,0,<87,cpyN3To8VC
cpyN3To8,D,0,<87,cpyN3To8VD
cpyN3To8,E,0,<87,cpyN3To8VE
cpyN3To8,F,0,<87,cpyN3To8VF

cpyN3To8V0,r,r,>35,setN3V0
cpyN3To8V0,*,*,<,cpyN3To8V0

cpyN3To8V1,r,r,>35,setN3V1
cpyN3To8V1,*,*,<,cpyN3To8V1

cpyN3To8V2,r,r,>35,setN3V2
cpyN3To8V2,*,*,<,cpyN3To8V2

cpyN3To8V3,r,r,>35,setN3V3
cpyN3To8V3,*,*,<,cpyN3To8V3

cpyN3To8V4,r,r,>35,setN3V4
cpyN3To8V4,*,*,<,cpyN3To8V4

cpyN3To8V5,r,r,>35,setN3V5
cpyN3To8V5,*,*,<,cpyN3To8V5

cpyN3To8V6,r,r,>35,setN3V6
cpyN3To8V6,*,*,<,cpyN3To8V6

cpyN3To8V7,r,r,>35,setN3V7
cpyN3To8V7,*,*,<,cpyN3To8V7

cpyN3To8V8,r,r,>35,setN3V8
cpyN3To8V8,*,*,<,cpyN3To8V8

cpyN3To8V9,r,r,>35,setN3V9
cpyN3To8V9,*,*,<,cpyN3To8V9

cpyN3To8VA,r,r,>35,setN3VA
cpyN3To8VA,*,*,<,cpyN3To8VA

cpyN3To8VB,r,r,>35,setN3VB
cpyN3To8VB,*,*,<,cpyN3To8VB

cpyN3To8VC,r,r,>35,setN3VC
cpyN3To8VC,*,*,<,cpyN3To8VC

cpyN3To8VD,r,r,>35,setN3VD
cpyN3To8VD,*,*,<,cpyN3To8VD

cpyN3To8VE,r,r,>35,setN3VE
cpyN3To8VE,*,*,<,cpyN3To8VE

cpyN3To8VF,r,r,>35,setN3VF
cpyN3To8VF,*,*,<,cpyN3To8VF

//-
cpyN3To9,0,0,<87,cpyN3To9V0
cpyN3To9,_,0,<87,cpyN3To9V0
cpyN3To9,1,0,<87,cpyN3To9V1
cpyN3To9,2,0,<87,cpyN3To9V2
cpyN3To9,3,0,<87,cpyN3To9V3
cpyN3To9,4,0,<87,cpyN3To9V4
cpyN3To9,5,0,<87,cpyN3To9V5
cpyN3To9,6,0,<87,cpyN3To9V6
cpyN3To9,7,0,<87,cpyN3To9V7
cpyN3To9,8,0,<87,cpyN3To9V8
cpyN3To9,9,0,<87,cpyN3To9V9
cpyN3To9,A,0,<87,cpyN3To9VA
cpyN3To9,B,0,<87,cpyN3To9VB
cpyN3To9,C,0,<87,cpyN3To9VC
cpyN3To9,D,0,<87,cpyN3To9VD
cpyN3To9,E,0,<87,cpyN3To9VE
cpyN3To9,F,0,<87,cpyN3To9VF

cpyN3To9V0,r,r,>39,setN3V0
cpyN3To9V0,*,*,<,cpyN3To9V0

cpyN3To9V1,r,r,>39,setN3V1
cpyN3To9V1,*,*,<,cpyN3To9V1

cpyN3To9V2,r,r,>39,setN3V2
cpyN3To9V2,*,*,<,cpyN3To9V2

cpyN3To9V3,r,r,>39,setN3V3
cpyN3To9V3,*,*,<,cpyN3To9V3

cpyN3To9V4,r,r,>39,setN3V4
cpyN3To9V4,*,*,<,cpyN3To9V4

cpyN3To9V5,r,r,>39,setN3V5
cpyN3To9V5,*,*,<,cpyN3To9V5

cpyN3To9V6,r,r,>39,setN3V6
cpyN3To9V6,*,*,<,cpyN3To9V6

cpyN3To9V7,r,r,>39,setN3V7
cpyN3To9V7,*,*,<,cpyN3To9V7

cpyN3To9V8,r,r,>39,setN3V8
cpyN3To9V8,*,*,<,cpyN3To9V8

cpyN3To9V9,r,r,>39,setN3V9
cpyN3To9V9,*,*,<,cpyN3To9V9

cpyN3To9VA,r,r,>39,setN3VA
cpyN3To9VA,*,*,<,cpyN3To9VA

cpyN3To9VB,r,r,>39,setN3VB
cpyN3To9VB,*,*,<,cpyN3To9VB

cpyN3To9VC,r,r,>39,setN3VC
cpyN3To9VC,*,*,<,cpyN3To9VC

cpyN3To9VD,r,r,>39,setN3VD
cpyN3To9VD,*,*,<,cpyN3To9VD

cpyN3To9VE,r,r,>39,setN3VE
cpyN3To9VE,*,*,<,cpyN3To9VE

cpyN3To9VF,r,r,>39,setN3VF
cpyN3To9VF,*,*,<,cpyN3To9VF

//-
cpyN3ToA,0,0,<87,cpyN3ToAV0
cpyN3ToA,_,0,<87,cpyN3ToAV0
cpyN3ToA,1,0,<87,cpyN3ToAV1
cpyN3ToA,2,0,<87,cpyN3ToAV2
cpyN3ToA,3,0,<87,cpyN3ToAV3
cpyN3ToA,4,0,<87,cpyN3ToAV4
cpyN3ToA,5,0,<87,cpyN3ToAV5
cpyN3ToA,6,0,<87,cpyN3ToAV6
cpyN3ToA,7,0,<87,cpyN3ToAV7
cpyN3ToA,8,0,<87,cpyN3ToAV8
cpyN3ToA,9,0,<87,cpyN3ToAV9
cpyN3ToA,A,0,<87,cpyN3ToAVA
cpyN3ToA,B,0,<87,cpyN3ToAVB
cpyN3ToA,C,0,<87,cpyN3ToAVC
cpyN3ToA,D,0,<87,cpyN3ToAVD
cpyN3ToA,E,0,<87,cpyN3ToAVE
cpyN3ToA,F,0,<87,cpyN3ToAVF

cpyN3ToAV0,r,r,>43,setN3V0
cpyN3ToAV0,*,*,<,cpyN3ToAV0

cpyN3ToAV1,r,r,>43,setN3V1
cpyN3ToAV1,*,*,<,cpyN3ToAV1

cpyN3ToAV2,r,r,>43,setN3V2
cpyN3ToAV2,*,*,<,cpyN3ToAV2

cpyN3ToAV3,r,r,>43,setN3V3
cpyN3ToAV3,*,*,<,cpyN3ToAV3

cpyN3ToAV4,r,r,>43,setN3V4
cpyN3ToAV4,*,*,<,cpyN3ToAV4

cpyN3ToAV5,r,r,>43,setN3V5
cpyN3ToAV5,*,*,<,cpyN3ToAV5

cpyN3ToAV6,r,r,>43,setN3V6
cpyN3ToAV6,*,*,<,cpyN3ToAV6

cpyN3ToAV7,r,r,>43,setN3V7
cpyN3ToAV7,*,*,<,cpyN3ToAV7

cpyN3ToAV8,r,r,>43,setN3V8
cpyN3ToAV8,*,*,<,cpyN3ToAV8

cpyN3ToAV9,r,r,>43,setN3V9
cpyN3ToAV9,*,*,<,cpyN3ToAV9

cpyN3ToAVA,r,r,>43,setN3VA
cpyN3ToAVA,*,*,<,cpyN3ToAVA

cpyN3ToAVB,r,r,>43,setN3VB
cpyN3ToAVB,*,*,<,cpyN3ToAVB

cpyN3ToAVC,r,r,>43,setN3VC
cpyN3ToAVC,*,*,<,cpyN3ToAVC

cpyN3ToAVD,r,r,>43,setN3VD
cpyN3ToAVD,*,*,<,cpyN3ToAVD

cpyN3ToAVE,r,r,>43,setN3VE
cpyN3ToAVE,*,*,<,cpyN3ToAVE

cpyN3ToAVF,r,r,>43,setN3VF
cpyN3ToAVF,*,*,<,cpyN3ToAVF

//-
cpyN3ToB,0,0,<87,cpyN3ToBV0
cpyN3ToB,_,0,<87,cpyN3ToBV0
cpyN3ToB,1,0,<87,cpyN3ToBV1
cpyN3ToB,2,0,<87,cpyN3ToBV2
cpyN3ToB,3,0,<87,cpyN3ToBV3
cpyN3ToB,4,0,<87,cpyN3ToBV4
cpyN3ToB,5,0,<87,cpyN3ToBV5
cpyN3ToB,6,0,<87,cpyN3ToBV6
cpyN3ToB,7,0,<87,cpyN3ToBV7
cpyN3ToB,8,0,<87,cpyN3ToBV8
cpyN3ToB,9,0,<87,cpyN3ToBV9
cpyN3ToB,A,0,<87,cpyN3ToBVA
cpyN3ToB,B,0,<87,cpyN3ToBVB
cpyN3ToB,C,0,<87,cpyN3ToBVC
cpyN3ToB,D,0,<87,cpyN3ToBVD
cpyN3ToB,E,0,<87,cpyN3ToBVE
cpyN3ToB,F,0,<87,cpyN3ToBVF

cpyN3ToBV0,r,r,>47,setN3V0
cpyN3ToBV0,*,*,<,cpyN3ToBV0

cpyN3ToBV1,r,r,>47,setN3V1
cpyN3ToBV1,*,*,<,cpyN3ToBV1

cpyN3ToBV2,r,r,>47,setN3V2
cpyN3ToBV2,*,*,<,cpyN3ToBV2

cpyN3ToBV3,r,r,>47,setN3V3
cpyN3ToBV3,*,*,<,cpyN3ToBV3

cpyN3ToBV4,r,r,>47,setN3V4
cpyN3ToBV4,*,*,<,cpyN3ToBV4

cpyN3ToBV5,r,r,>47,setN3V5
cpyN3ToBV5,*,*,<,cpyN3ToBV5

cpyN3ToBV6,r,r,>47,setN3V6
cpyN3ToBV6,*,*,<,cpyN3ToBV6

cpyN3ToBV7,r,r,>47,setN3V7
cpyN3ToBV7,*,*,<,cpyN3ToBV7

cpyN3ToBV8,r,r,>47,setN3V8
cpyN3ToBV8,*,*,<,cpyN3ToBV8

cpyN3ToBV9,r,r,>47,setN3V9
cpyN3ToBV9,*,*,<,cpyN3ToBV9

cpyN3ToBVA,r,r,>47,setN3VA
cpyN3ToBVA,*,*,<,cpyN3ToBVA

cpyN3ToBVB,r,r,>47,setN3VB
cpyN3ToBVB,*,*,<,cpyN3ToBVB

cpyN3ToBVC,r,r,>47,setN3VC
cpyN3ToBVC,*,*,<,cpyN3ToBVC

cpyN3ToBVD,r,r,>47,setN3VD
cpyN3ToBVD,*,*,<,cpyN3ToBVD

cpyN3ToBVE,r,r,>47,setN3VE
cpyN3ToBVE,*,*,<,cpyN3ToBVE

cpyN3ToBVF,r,r,>47,setN3VF
cpyN3ToBVF,*,*,<,cpyN3ToBVF

//-
cpyN3ToC,0,0,<87,cpyN3ToCV0
cpyN3ToC,_,0,<87,cpyN3ToCV0
cpyN3ToC,1,0,<87,cpyN3ToCV1
cpyN3ToC,2,0,<87,cpyN3ToCV2
cpyN3ToC,3,0,<87,cpyN3ToCV3
cpyN3ToC,4,0,<87,cpyN3ToCV4
cpyN3ToC,5,0,<87,cpyN3ToCV5
cpyN3ToC,6,0,<87,cpyN3ToCV6
cpyN3ToC,7,0,<87,cpyN3ToCV7
cpyN3ToC,8,0,<87,cpyN3ToCV8
cpyN3ToC,9,0,<87,cpyN3ToCV9
cpyN3ToC,A,0,<87,cpyN3ToCVA
cpyN3ToC,B,0,<87,cpyN3ToCVB
cpyN3ToC,C,0,<87,cpyN3ToCVC
cpyN3ToC,D,0,<87,cpyN3ToCVD
cpyN3ToC,E,0,<87,cpyN3ToCVE
cpyN3ToC,F,0,<87,cpyN3ToCVF

cpyN3ToCV0,r,r,>51,setN3V0
cpyN3ToCV0,*,*,<,cpyN3ToCV0

cpyN3ToCV1,r,r,>51,setN3V1
cpyN3ToCV1,*,*,<,cpyN3ToCV1

cpyN3ToCV2,r,r,>51,setN3V2
cpyN3ToCV2,*,*,<,cpyN3ToCV2

cpyN3ToCV3,r,r,>51,setN3V3
cpyN3ToCV3,*,*,<,cpyN3ToCV3

cpyN3ToCV4,r,r,>51,setN3V4
cpyN3ToCV4,*,*,<,cpyN3ToCV4

cpyN3ToCV5,r,r,>51,setN3V5
cpyN3ToCV5,*,*,<,cpyN3ToCV5

cpyN3ToCV6,r,r,>51,setN3V6
cpyN3ToCV6,*,*,<,cpyN3ToCV6

cpyN3ToCV7,r,r,>51,setN3V7
cpyN3ToCV7,*,*,<,cpyN3ToCV7

cpyN3ToCV8,r,r,>51,setN3V8
cpyN3ToCV8,*,*,<,cpyN3ToCV8

cpyN3ToCV9,r,r,>51,setN3V9
cpyN3ToCV9,*,*,<,cpyN3ToCV9

cpyN3ToCVA,r,r,>51,setN3VA
cpyN3ToCVA,*,*,<,cpyN3ToCVA

cpyN3ToCVB,r,r,>51,setN3VB
cpyN3ToCVB,*,*,<,cpyN3ToCVB

cpyN3ToCVC,r,r,>51,setN3VC
cpyN3ToCVC,*,*,<,cpyN3ToCVC

cpyN3ToCVD,r,r,>51,setN3VD
cpyN3ToCVD,*,*,<,cpyN3ToCVD

cpyN3ToCVE,r,r,>51,setN3VE
cpyN3ToCVE,*,*,<,cpyN3ToCVE

cpyN3ToCVF,r,r,>51,setN3VF
cpyN3ToCVF,*,*,<,cpyN3ToCVF

//-
cpyN3ToD,0,0,<87,cpyN3ToDV0
cpyN3ToD,_,0,<87,cpyN3ToDV0
cpyN3ToD,1,0,<87,cpyN3ToDV1
cpyN3ToD,2,0,<87,cpyN3ToDV2
cpyN3ToD,3,0,<87,cpyN3ToDV3
cpyN3ToD,4,0,<87,cpyN3ToDV4
cpyN3ToD,5,0,<87,cpyN3ToDV5
cpyN3ToD,6,0,<87,cpyN3ToDV6
cpyN3ToD,7,0,<87,cpyN3ToDV7
cpyN3ToD,8,0,<87,cpyN3ToDV8
cpyN3ToD,9,0,<87,cpyN3ToDV9
cpyN3ToD,A,0,<87,cpyN3ToDVA
cpyN3ToD,B,0,<87,cpyN3ToDVB
cpyN3ToD,C,0,<87,cpyN3ToDVC
cpyN3ToD,D,0,<87,cpyN3ToDVD
cpyN3ToD,E,0,<87,cpyN3ToDVE
cpyN3ToD,F,0,<87,cpyN3ToDVF

cpyN3ToDV0,r,r,>55,setN3V0
cpyN3ToDV0,*,*,<,cpyN3ToDV0

cpyN3ToDV1,r,r,>55,setN3V1
cpyN3ToDV1,*,*,<,cpyN3ToDV1

cpyN3ToDV2,r,r,>55,setN3V2
cpyN3ToDV2,*,*,<,cpyN3ToDV2

cpyN3ToDV3,r,r,>55,setN3V3
cpyN3ToDV3,*,*,<,cpyN3ToDV3

cpyN3ToDV4,r,r,>55,setN3V4
cpyN3ToDV4,*,*,<,cpyN3ToDV4

cpyN3ToDV5,r,r,>55,setN3V5
cpyN3ToDV5,*,*,<,cpyN3ToDV5

cpyN3ToDV6,r,r,>55,setN3V6
cpyN3ToDV6,*,*,<,cpyN3ToDV6

cpyN3ToDV7,r,r,>55,setN3V7
cpyN3ToDV7,*,*,<,cpyN3ToDV7

cpyN3ToDV8,r,r,>55,setN3V8
cpyN3ToDV8,*,*,<,cpyN3ToDV8

cpyN3ToDV9,r,r,>55,setN3V9
cpyN3ToDV9,*,*,<,cpyN3ToDV9

cpyN3ToDVA,r,r,>55,setN3VA
cpyN3ToDVA,*,*,<,cpyN3ToDVA

cpyN3ToDVB,r,r,>55,setN3VB
cpyN3ToDVB,*,*,<,cpyN3ToDVB

cpyN3ToDVC,r,r,>55,setN3VC
cpyN3ToDVC,*,*,<,cpyN3ToDVC

cpyN3ToDVD,r,r,>55,setN3VD
cpyN3ToDVD,*,*,<,cpyN3ToDVD

cpyN3ToDVE,r,r,>55,setN3VE
cpyN3ToDVE,*,*,<,cpyN3ToDVE

cpyN3ToDVF,r,r,>55,setN3VF
cpyN3ToDVF,*,*,<,cpyN3ToDVF

//-
cpyN3ToE,0,0,<87,cpyN3ToEV0
cpyN3ToE,_,0,<87,cpyN3ToEV0
cpyN3ToE,1,0,<87,cpyN3ToEV1
cpyN3ToE,2,0,<87,cpyN3ToEV2
cpyN3ToE,3,0,<87,cpyN3ToEV3
cpyN3ToE,4,0,<87,cpyN3ToEV4
cpyN3ToE,5,0,<87,cpyN3ToEV5
cpyN3ToE,6,0,<87,cpyN3ToEV6
cpyN3ToE,7,0,<87,cpyN3ToEV7
cpyN3ToE,8,0,<87,cpyN3ToEV8
cpyN3ToE,9,0,<87,cpyN3ToEV9
cpyN3ToE,A,0,<87,cpyN3ToEVA
cpyN3ToE,B,0,<87,cpyN3ToEVB
cpyN3ToE,C,0,<87,cpyN3ToEVC
cpyN3ToE,D,0,<87,cpyN3ToEVD
cpyN3ToE,E,0,<87,cpyN3ToEVE
cpyN3ToE,F,0,<87,cpyN3ToEVF

cpyN3ToEV0,r,r,>59,setN3V0
cpyN3ToEV0,*,*,<,cpyN3ToEV0

cpyN3ToEV1,r,r,>59,setN3V1
cpyN3ToEV1,*,*,<,cpyN3ToEV1

cpyN3ToEV2,r,r,>59,setN3V2
cpyN3ToEV2,*,*,<,cpyN3ToEV2

cpyN3ToEV3,r,r,>59,setN3V3
cpyN3ToEV3,*,*,<,cpyN3ToEV3

cpyN3ToEV4,r,r,>59,setN3V4
cpyN3ToEV4,*,*,<,cpyN3ToEV4

cpyN3ToEV5,r,r,>59,setN3V5
cpyN3ToEV5,*,*,<,cpyN3ToEV5

cpyN3ToEV6,r,r,>59,setN3V6
cpyN3ToEV6,*,*,<,cpyN3ToEV6

cpyN3ToEV7,r,r,>59,setN3V7
cpyN3ToEV7,*,*,<,cpyN3ToEV7

cpyN3ToEV8,r,r,>59,setN3V8
cpyN3ToEV8,*,*,<,cpyN3ToEV8

cpyN3ToEV9,r,r,>59,setN3V9
cpyN3ToEV9,*,*,<,cpyN3ToEV9

cpyN3ToEVA,r,r,>59,setN3VA
cpyN3ToEVA,*,*,<,cpyN3ToEVA

cpyN3ToEVB,r,r,>59,setN3VB
cpyN3ToEVB,*,*,<,cpyN3ToEVB

cpyN3ToEVC,r,r,>59,setN3VC
cpyN3ToEVC,*,*,<,cpyN3ToEVC

cpyN3ToEVD,r,r,>59,setN3VD
cpyN3ToEVD,*,*,<,cpyN3ToEVD

cpyN3ToEVE,r,r,>59,setN3VE
cpyN3ToEVE,*,*,<,cpyN3ToEVE

cpyN3ToEVF,r,r,>59,setN3VF
cpyN3ToEVF,*,*,<,cpyN3ToEVF

//-
cpyN3ToF,0,0,<87,cpyN3ToFV0
cpyN3ToF,_,0,<87,cpyN3ToFV0
cpyN3ToF,1,0,<87,cpyN3ToFV1
cpyN3ToF,2,0,<87,cpyN3ToFV2
cpyN3ToF,3,0,<87,cpyN3ToFV3
cpyN3ToF,4,0,<87,cpyN3ToFV4
cpyN3ToF,5,0,<87,cpyN3ToFV5
cpyN3ToF,6,0,<87,cpyN3ToFV6
cpyN3ToF,7,0,<87,cpyN3ToFV7
cpyN3ToF,8,0,<87,cpyN3ToFV8
cpyN3ToF,9,0,<87,cpyN3ToFV9
cpyN3ToF,A,0,<87,cpyN3ToFVA
cpyN3ToF,B,0,<87,cpyN3ToFVB
cpyN3ToF,C,0,<87,cpyN3ToFVC
cpyN3ToF,D,0,<87,cpyN3ToFVD
cpyN3ToF,E,0,<87,cpyN3ToFVE
cpyN3ToF,F,0,<87,cpyN3ToFVF

cpyN3ToFV0,r,r,>63,setN3V0
cpyN3ToFV0,*,*,<,cpyN3ToFV0

cpyN3ToFV1,r,r,>63,setN3V1
cpyN3ToFV1,*,*,<,cpyN3ToFV1

cpyN3ToFV2,r,r,>63,setN3V2
cpyN3ToFV2,*,*,<,cpyN3ToFV2

cpyN3ToFV3,r,r,>63,setN3V3
cpyN3ToFV3,*,*,<,cpyN3ToFV3

cpyN3ToFV4,r,r,>63,setN3V4
cpyN3ToFV4,*,*,<,cpyN3ToFV4

cpyN3ToFV5,r,r,>63,setN3V5
cpyN3ToFV5,*,*,<,cpyN3ToFV5

cpyN3ToFV6,r,r,>63,setN3V6
cpyN3ToFV6,*,*,<,cpyN3ToFV6

cpyN3ToFV7,r,r,>63,setN3V7
cpyN3ToFV7,*,*,<,cpyN3ToFV7

cpyN3ToFV8,r,r,>63,setN3V8
cpyN3ToFV8,*,*,<,cpyN3ToFV8

cpyN3ToFV9,r,r,>63,setN3V9
cpyN3ToFV9,*,*,<,cpyN3ToFV9

cpyN3ToFVA,r,r,>63,setN3VA
cpyN3ToFVA,*,*,<,cpyN3ToFVA

cpyN3ToFVB,r,r,>63,setN3VB
cpyN3ToFVB,*,*,<,cpyN3ToFVB

cpyN3ToFVC,r,r,>63,setN3VC
cpyN3ToFVC,*,*,<,cpyN3ToFVC

cpyN3ToFVD,r,r,>63,setN3VD
cpyN3ToFVD,*,*,<,cpyN3ToFVD

cpyN3ToFVE,r,r,>63,setN3VE
cpyN3ToFVE,*,*,<,cpyN3ToFVE

cpyN3ToFVF,r,r,>63,setN3VF
cpyN3ToFVF,*,*,<,cpyN3ToFVF
//..

cpyN4,1,0,<,remv1
cpyN4,2,0,<,remv2
cpyN4,3,0,<,remv3
cpyN4,4,0,<,remv4
cpyN4,5,0,<,remv5
cpyN4,6,0,<,remv6
cpyN4,7,0,<,remv7
cpyN4,8,0,<,remv8
cpyN4,9,0,<,remv9
cpyN4,A,0,<,remvA
cpyN4,B,0,<,remvB
cpyN4,C,0,<,remvC
cpyN4,D,0,<,remvD
cpyN4,E,0,<,remvE
cpyN4,F,0,<,remvF

remv1,v,0,<,cpyN4To1
remv2,v,0,<,cpyN4To2
remv3,v,0,<,cpyN4To3
remv4,v,0,<,cpyN4To4
remv5,v,0,<,cpyN4To5
remv6,v,0,<,cpyN4To6
remv7,v,0,<,cpyN4To7
remv8,v,0,<,cpyN4To8
remv9,v,0,<,cpyN4To9
remvA,v,0,<,cpyN4ToA
remvB,v,0,<,cpyN4ToB
remvC,v,0,<,cpyN4ToC
remvD,v,0,<,cpyN4ToD
remvE,v,0,<,cpyN4ToE
remvF,v,0,<,cpyN4ToF
//..--..

//...
cpyN4To1,0,0,<88,cpyN4To1V0
cpyN4To1,_,0,<88,cpyN4To1V0
cpyN4To1,1,0,<88,cpyN4To1V1
cpyN4To1,2,0,<88,cpyN4To1V2
cpyN4To1,3,0,<88,cpyN4To1V3
cpyN4To1,4,0,<88,cpyN4To1V4
cpyN4To1,5,0,<88,cpyN4To1V5
cpyN4To1,6,0,<88,cpyN4To1V6
cpyN4To1,7,0,<88,cpyN4To1V7
cpyN4To1,8,0,<88,cpyN4To1V8
cpyN4To1,9,0,<88,cpyN4To1V9
cpyN4To1,A,0,<88,cpyN4To1VA
cpyN4To1,B,0,<88,cpyN4To1VB
cpyN4To1,C,0,<88,cpyN4To1VC
cpyN4To1,D,0,<88,cpyN4To1VD
cpyN4To1,E,0,<88,cpyN4To1VE
cpyN4To1,F,0,<88,cpyN4To1VF

cpyN4To1V0,r,r,>8,setN4V0
cpyN4To1V0,*,*,<,cpyN4To1V0
setN4V0,*,0,>,end

cpyN4To1V1,r,r,>8,setN4V1
cpyN4To1V1,*,*,<,cpyN4To1V1
setN4V1,*,1,>,end

cpyN4To1V2,r,r,>8,setN4V2
cpyN4To1V2,*,*,<,cpyN4To1V2
setN4V2,*,2,>,end

cpyN4To1V3,r,r,>8,setN4V3
cpyN4To1V3,*,*,<,cpyN4To1V3
setN4V3,*,3,>,end

cpyN4To1V4,r,r,>8,setN4V4
cpyN4To1V4,*,*,<,cpyN4To1V4
setN4V4,*,4,>,end

cpyN4To1V5,r,r,>8,setN4V5
cpyN4To1V5,*,*,<,cpyN4To1V5
setN4V5,*,5,>,end

cpyN4To1V6,r,r,>8,setN4V6
cpyN4To1V6,*,*,<,cpyN4To1V6
setN4V6,*,6,>,end

cpyN4To1V7,r,r,>8,setN4V7
cpyN4To1V7,*,*,<,cpyN4To1V7
setN4V7,*,7,>,end

cpyN4To1V8,r,r,>8,setN4V8
cpyN4To1V8,*,*,<,cpyN4To1V8
setN4V8,*,8,>,end

cpyN4To1V9,r,r,>8,setN4V9
cpyN4To1V9,*,*,<,cpyN4To1V9
setN4V9,*,9,>,end

cpyN4To1VA,r,r,>8,setN4VA
cpyN4To1VA,*,*,<,cpyN4To1VA
setN4VA,*,A,>,end

cpyN4To1VB,r,r,>8,setN4VB
cpyN4To1VB,*,*,<,cpyN4To1VB
setN4VB,*,B,>,end

cpyN4To1VC,r,r,>8,setN4VC
cpyN4To1VC,*,*,<,cpyN4To1VC
setN4VC,*,C,>,end

cpyN4To1VD,r,r,>8,setN4VD
cpyN4To1VD,*,*,<,cpyN4To1VD
setN4VD,*,D,>,end

cpyN4To1VE,r,r,>8,setN4VE
cpyN4To1VE,*,*,<,cpyN4To1VE
setN4VE,*,E,>,end

cpyN4To1VF,r,r,>8,setN4VF
cpyN4To1VF,*,*,<,cpyN4To1VF
setN4VF,*,F,>,end

//-
cpyN4To2,0,0,<88,cpyN4To2V0
cpyN4To2,_,0,<88,cpyN4To2V0
cpyN4To2,1,0,<88,cpyN4To2V1
cpyN4To2,2,0,<88,cpyN4To2V2
cpyN4To2,3,0,<88,cpyN4To2V3
cpyN4To2,4,0,<88,cpyN4To2V4
cpyN4To2,5,0,<88,cpyN4To2V5
cpyN4To2,6,0,<88,cpyN4To2V6
cpyN4To2,7,0,<88,cpyN4To2V7
cpyN4To2,8,0,<88,cpyN4To2V8
cpyN4To2,9,0,<88,cpyN4To2V9
cpyN4To2,A,0,<88,cpyN4To2VA
cpyN4To2,B,0,<88,cpyN4To2VB
cpyN4To2,C,0,<88,cpyN4To2VC
cpyN4To2,D,0,<88,cpyN4To2VD
cpyN4To2,E,0,<88,cpyN4To2VE
cpyN4To2,F,0,<88,cpyN4To2VF

cpyN4To2V0,r,r,>12,setN4V0
cpyN4To2V0,*,*,<,cpyN4To2V0

cpyN4To2V1,r,r,>12,setN4V1
cpyN4To2V1,*,*,<,cpyN4To2V1

cpyN4To2V2,r,r,>12,setN4V2
cpyN4To2V2,*,*,<,cpyN4To2V2

cpyN4To2V3,r,r,>12,setN4V3
cpyN4To2V3,*,*,<,cpyN4To2V3

cpyN4To2V4,r,r,>12,setN4V4
cpyN4To2V4,*,*,<,cpyN4To2V4

cpyN4To2V5,r,r,>12,setN4V5
cpyN4To2V5,*,*,<,cpyN4To2V5

cpyN4To2V6,r,r,>12,setN4V6
cpyN4To2V6,*,*,<,cpyN4To2V6

cpyN4To2V7,r,r,>12,setN4V7
cpyN4To2V7,*,*,<,cpyN4To2V7

cpyN4To2V8,r,r,>12,setN4V8
cpyN4To2V8,*,*,<,cpyN4To2V8

cpyN4To2V9,r,r,>12,setN4V9
cpyN4To2V9,*,*,<,cpyN4To2V9

cpyN4To2VA,r,r,>12,setN4VA
cpyN4To2VA,*,*,<,cpyN4To2VA

cpyN4To2VB,r,r,>12,setN4VB
cpyN4To2VB,*,*,<,cpyN4To2VB

cpyN4To2VC,r,r,>12,setN4VC
cpyN4To2VC,*,*,<,cpyN4To2VC

cpyN4To2VD,r,r,>12,setN4VD
cpyN4To2VD,*,*,<,cpyN4To2VD

cpyN4To2VE,r,r,>12,setN4VE
cpyN4To2VE,*,*,<,cpyN4To2VE

cpyN4To2VF,r,r,>12,setN4VF
cpyN4To2VF,*,*,<,cpyN4To2VF

//-
cpyN4To3,0,0,<88,cpyN4To3V0
cpyN4To3,_,0,<88,cpyN4To3V0
cpyN4To3,1,0,<88,cpyN4To3V1
cpyN4To3,2,0,<88,cpyN4To3V2
cpyN4To3,3,0,<88,cpyN4To3V3
cpyN4To3,4,0,<88,cpyN4To3V4
cpyN4To3,5,0,<88,cpyN4To3V5
cpyN4To3,6,0,<88,cpyN4To3V6
cpyN4To3,7,0,<88,cpyN4To3V7
cpyN4To3,8,0,<88,cpyN4To3V8
cpyN4To3,9,0,<88,cpyN4To3V9
cpyN4To3,A,0,<88,cpyN4To3VA
cpyN4To3,B,0,<88,cpyN4To3VB
cpyN4To3,C,0,<88,cpyN4To3VC
cpyN4To3,D,0,<88,cpyN4To3VD
cpyN4To3,E,0,<88,cpyN4To3VE
cpyN4To3,F,0,<88,cpyN4To3VF

cpyN4To3V0,r,r,>16,setN4V0
cpyN4To3V0,*,*,<,cpyN4To3V0

cpyN4To3V1,r,r,>16,setN4V1
cpyN4To3V1,*,*,<,cpyN4To3V1

cpyN4To3V2,r,r,>16,setN4V2
cpyN4To3V2,*,*,<,cpyN4To3V2

cpyN4To3V3,r,r,>16,setN4V3
cpyN4To3V3,*,*,<,cpyN4To3V3

cpyN4To3V4,r,r,>16,setN4V4
cpyN4To3V4,*,*,<,cpyN4To3V4

cpyN4To3V5,r,r,>16,setN4V5
cpyN4To3V5,*,*,<,cpyN4To3V5

cpyN4To3V6,r,r,>16,setN4V6
cpyN4To3V6,*,*,<,cpyN4To3V6

cpyN4To3V7,r,r,>16,setN4V7
cpyN4To3V7,*,*,<,cpyN4To3V7

cpyN4To3V8,r,r,>16,setN4V8
cpyN4To3V8,*,*,<,cpyN4To3V8

cpyN4To3V9,r,r,>16,setN4V9
cpyN4To3V9,*,*,<,cpyN4To3V9

cpyN4To3VA,r,r,>16,setN4VA
cpyN4To3VA,*,*,<,cpyN4To3VA

cpyN4To3VB,r,r,>16,setN4VB
cpyN4To3VB,*,*,<,cpyN4To3VB

cpyN4To3VC,r,r,>16,setN4VC
cpyN4To3VC,*,*,<,cpyN4To3VC

cpyN4To3VD,r,r,>16,setN4VD
cpyN4To3VD,*,*,<,cpyN4To3VD

cpyN4To3VE,r,r,>16,setN4VE
cpyN4To3VE,*,*,<,cpyN4To3VE

cpyN4To3VF,r,r,>16,setN4VF
cpyN4To3VF,*,*,<,cpyN4To3VF

//-
cpyN4To4,0,0,<88,cpyN4To4V0
cpyN4To4,_,0,<88,cpyN4To4V0
cpyN4To4,1,0,<88,cpyN4To4V1
cpyN4To4,2,0,<88,cpyN4To4V2
cpyN4To4,3,0,<88,cpyN4To4V3
cpyN4To4,4,0,<88,cpyN4To4V4
cpyN4To4,5,0,<88,cpyN4To4V5
cpyN4To4,6,0,<88,cpyN4To4V6
cpyN4To4,7,0,<88,cpyN4To4V7
cpyN4To4,8,0,<88,cpyN4To4V8
cpyN4To4,9,0,<88,cpyN4To4V9
cpyN4To4,A,0,<88,cpyN4To4VA
cpyN4To4,B,0,<88,cpyN4To4VB
cpyN4To4,C,0,<88,cpyN4To4VC
cpyN4To4,D,0,<88,cpyN4To4VD
cpyN4To4,E,0,<88,cpyN4To4VE
cpyN4To4,F,0,<88,cpyN4To4VF

cpyN4To4V0,r,r,>20,setN4V0
cpyN4To4V0,*,*,<,cpyN4To4V0

cpyN4To4V1,r,r,>20,setN4V1
cpyN4To4V1,*,*,<,cpyN4To4V1

cpyN4To4V2,r,r,>20,setN4V2
cpyN4To4V2,*,*,<,cpyN4To4V2

cpyN4To4V3,r,r,>20,setN4V3
cpyN4To4V3,*,*,<,cpyN4To4V3

cpyN4To4V4,r,r,>20,setN4V4
cpyN4To4V4,*,*,<,cpyN4To4V4

cpyN4To4V5,r,r,>20,setN4V5
cpyN4To4V5,*,*,<,cpyN4To4V5

cpyN4To4V6,r,r,>20,setN4V6
cpyN4To4V6,*,*,<,cpyN4To4V6

cpyN4To4V7,r,r,>20,setN4V7
cpyN4To4V7,*,*,<,cpyN4To4V7

cpyN4To4V8,r,r,>20,setN4V8
cpyN4To4V8,*,*,<,cpyN4To4V8

cpyN4To4V9,r,r,>20,setN4V9
cpyN4To4V9,*,*,<,cpyN4To4V9

cpyN4To4VA,r,r,>20,setN4VA
cpyN4To4VA,*,*,<,cpyN4To4VA

cpyN4To4VB,r,r,>20,setN4VB
cpyN4To4VB,*,*,<,cpyN4To4VB

cpyN4To4VC,r,r,>20,setN4VC
cpyN4To4VC,*,*,<,cpyN4To4VC

cpyN4To4VD,r,r,>20,setN4VD
cpyN4To4VD,*,*,<,cpyN4To4VD

cpyN4To4VE,r,r,>20,setN4VE
cpyN4To4VE,*,*,<,cpyN4To4VE

cpyN4To4VF,r,r,>20,setN4VF
cpyN4To4VF,*,*,<,cpyN4To4VF

//-
cpyN4To5,0,0,<88,cpyN4To5V0
cpyN4To5,_,0,<88,cpyN4To5V0
cpyN4To5,1,0,<88,cpyN4To5V1
cpyN4To5,2,0,<88,cpyN4To5V2
cpyN4To5,3,0,<88,cpyN4To5V3
cpyN4To5,4,0,<88,cpyN4To5V4
cpyN4To5,5,0,<88,cpyN4To5V5
cpyN4To5,6,0,<88,cpyN4To5V6
cpyN4To5,7,0,<88,cpyN4To5V7
cpyN4To5,8,0,<88,cpyN4To5V8
cpyN4To5,9,0,<88,cpyN4To5V9
cpyN4To5,A,0,<88,cpyN4To5VA
cpyN4To5,B,0,<88,cpyN4To5VB
cpyN4To5,C,0,<88,cpyN4To5VC
cpyN4To5,D,0,<88,cpyN4To5VD
cpyN4To5,E,0,<88,cpyN4To5VE
cpyN4To5,F,0,<88,cpyN4To5VF

cpyN4To5V0,r,r,>24,setN4V0
cpyN4To5V0,*,*,<,cpyN4To5V0

cpyN4To5V1,r,r,>24,setN4V1
cpyN4To5V1,*,*,<,cpyN4To5V1

cpyN4To5V2,r,r,>24,setN4V2
cpyN4To5V2,*,*,<,cpyN4To5V2

cpyN4To5V3,r,r,>24,setN4V3
cpyN4To5V3,*,*,<,cpyN4To5V3

cpyN4To5V4,r,r,>24,setN4V4
cpyN4To5V4,*,*,<,cpyN4To5V4

cpyN4To5V5,r,r,>24,setN4V5
cpyN4To5V5,*,*,<,cpyN4To5V5

cpyN4To5V6,r,r,>24,setN4V6
cpyN4To5V6,*,*,<,cpyN4To5V6

cpyN4To5V7,r,r,>24,setN4V7
cpyN4To5V7,*,*,<,cpyN4To5V7

cpyN4To5V8,r,r,>24,setN4V8
cpyN4To5V8,*,*,<,cpyN4To5V8

cpyN4To5V9,r,r,>24,setN4V9
cpyN4To5V9,*,*,<,cpyN4To5V9

cpyN4To5VA,r,r,>24,setN4VA
cpyN4To5VA,*,*,<,cpyN4To5VA

cpyN4To5VB,r,r,>24,setN4VB
cpyN4To5VB,*,*,<,cpyN4To5VB

cpyN4To5VC,r,r,>24,setN4VC
cpyN4To5VC,*,*,<,cpyN4To5VC

cpyN4To5VD,r,r,>24,setN4VD
cpyN4To5VD,*,*,<,cpyN4To5VD

cpyN4To5VE,r,r,>24,setN4VE
cpyN4To5VE,*,*,<,cpyN4To5VE

cpyN4To5VF,r,r,>24,setN4VF
cpyN4To5VF,*,*,<,cpyN4To5VF

//-
cpyN4To6,0,0,<88,cpyN4To6V0
cpyN4To6,_,0,<88,cpyN4To6V0
cpyN4To6,1,0,<88,cpyN4To6V1
cpyN4To6,2,0,<88,cpyN4To6V2
cpyN4To6,3,0,<88,cpyN4To6V3
cpyN4To6,4,0,<88,cpyN4To6V4
cpyN4To6,5,0,<88,cpyN4To6V5
cpyN4To6,6,0,<88,cpyN4To6V6
cpyN4To6,7,0,<88,cpyN4To6V7
cpyN4To6,8,0,<88,cpyN4To6V8
cpyN4To6,9,0,<88,cpyN4To6V9
cpyN4To6,A,0,<88,cpyN4To6VA
cpyN4To6,B,0,<88,cpyN4To6VB
cpyN4To6,C,0,<88,cpyN4To6VC
cpyN4To6,D,0,<88,cpyN4To6VD
cpyN4To6,E,0,<88,cpyN4To6VE
cpyN4To6,F,0,<88,cpyN4To6VF

cpyN4To6V0,r,r,>28,setN4V0
cpyN4To6V0,*,*,<,cpyN4To6V0

cpyN4To6V1,r,r,>28,setN4V1
cpyN4To6V1,*,*,<,cpyN4To6V1

cpyN4To6V2,r,r,>28,setN4V2
cpyN4To6V2,*,*,<,cpyN4To6V2

cpyN4To6V3,r,r,>28,setN4V3
cpyN4To6V3,*,*,<,cpyN4To6V3

cpyN4To6V4,r,r,>28,setN4V4
cpyN4To6V4,*,*,<,cpyN4To6V4

cpyN4To6V5,r,r,>28,setN4V5
cpyN4To6V5,*,*,<,cpyN4To6V5

cpyN4To6V6,r,r,>28,setN4V6
cpyN4To6V6,*,*,<,cpyN4To6V6

cpyN4To6V7,r,r,>28,setN4V7
cpyN4To6V7,*,*,<,cpyN4To6V7

cpyN4To6V8,r,r,>28,setN4V8
cpyN4To6V8,*,*,<,cpyN4To6V8

cpyN4To6V9,r,r,>28,setN4V9
cpyN4To6V9,*,*,<,cpyN4To6V9

cpyN4To6VA,r,r,>28,setN4VA
cpyN4To6VA,*,*,<,cpyN4To6VA

cpyN4To6VB,r,r,>28,setN4VB
cpyN4To6VB,*,*,<,cpyN4To6VB

cpyN4To6VC,r,r,>28,setN4VC
cpyN4To6VC,*,*,<,cpyN4To6VC

cpyN4To6VD,r,r,>28,setN4VD
cpyN4To6VD,*,*,<,cpyN4To6VD

cpyN4To6VE,r,r,>28,setN4VE
cpyN4To6VE,*,*,<,cpyN4To6VE

cpyN4To6VF,r,r,>28,setN4VF
cpyN4To6VF,*,*,<,cpyN4To6VF

//-
cpyN4To7,0,0,<88,cpyN4To7V0
cpyN4To7,_,0,<88,cpyN4To7V0
cpyN4To7,1,0,<88,cpyN4To7V1
cpyN4To7,2,0,<88,cpyN4To7V2
cpyN4To7,3,0,<88,cpyN4To7V3
cpyN4To7,4,0,<88,cpyN4To7V4
cpyN4To7,5,0,<88,cpyN4To7V5
cpyN4To7,6,0,<88,cpyN4To7V6
cpyN4To7,7,0,<88,cpyN4To7V7
cpyN4To7,8,0,<88,cpyN4To7V8
cpyN4To7,9,0,<88,cpyN4To7V9
cpyN4To7,A,0,<88,cpyN4To7VA
cpyN4To7,B,0,<88,cpyN4To7VB
cpyN4To7,C,0,<88,cpyN4To7VC
cpyN4To7,D,0,<88,cpyN4To7VD
cpyN4To7,E,0,<88,cpyN4To7VE
cpyN4To7,F,0,<88,cpyN4To7VF

cpyN4To7V0,r,r,>32,setN4V0
cpyN4To7V0,*,*,<,cpyN4To7V0

cpyN4To7V1,r,r,>32,setN4V1
cpyN4To7V1,*,*,<,cpyN4To7V1

cpyN4To7V2,r,r,>32,setN4V2
cpyN4To7V2,*,*,<,cpyN4To7V2

cpyN4To7V3,r,r,>32,setN4V3
cpyN4To7V3,*,*,<,cpyN4To7V3

cpyN4To7V4,r,r,>32,setN4V4
cpyN4To7V4,*,*,<,cpyN4To7V4

cpyN4To7V5,r,r,>32,setN4V5
cpyN4To7V5,*,*,<,cpyN4To7V5

cpyN4To7V6,r,r,>32,setN4V6
cpyN4To7V6,*,*,<,cpyN4To7V6

cpyN4To7V7,r,r,>32,setN4V7
cpyN4To7V7,*,*,<,cpyN4To7V7

cpyN4To7V8,r,r,>32,setN4V8
cpyN4To7V8,*,*,<,cpyN4To7V8

cpyN4To7V9,r,r,>32,setN4V9
cpyN4To7V9,*,*,<,cpyN4To7V9

cpyN4To7VA,r,r,>32,setN4VA
cpyN4To7VA,*,*,<,cpyN4To7VA

cpyN4To7VB,r,r,>32,setN4VB
cpyN4To7VB,*,*,<,cpyN4To7VB

cpyN4To7VC,r,r,>32,setN4VC
cpyN4To7VC,*,*,<,cpyN4To7VC

cpyN4To7VD,r,r,>32,setN4VD
cpyN4To7VD,*,*,<,cpyN4To7VD

cpyN4To7VE,r,r,>32,setN4VE
cpyN4To7VE,*,*,<,cpyN4To7VE

cpyN4To7VF,r,r,>32,setN4VF
cpyN4To7VF,*,*,<,cpyN4To7VF

//-
cpyN4To8,0,0,<88,cpyN4To8V0
cpyN4To8,_,0,<88,cpyN4To8V0
cpyN4To8,1,0,<88,cpyN4To8V1
cpyN4To8,2,0,<88,cpyN4To8V2
cpyN4To8,3,0,<88,cpyN4To8V3
cpyN4To8,4,0,<88,cpyN4To8V4
cpyN4To8,5,0,<88,cpyN4To8V5
cpyN4To8,6,0,<88,cpyN4To8V6
cpyN4To8,7,0,<88,cpyN4To8V7
cpyN4To8,8,0,<88,cpyN4To8V8
cpyN4To8,9,0,<88,cpyN4To8V9
cpyN4To8,A,0,<88,cpyN4To8VA
cpyN4To8,B,0,<88,cpyN4To8VB
cpyN4To8,C,0,<88,cpyN4To8VC
cpyN4To8,D,0,<88,cpyN4To8VD
cpyN4To8,E,0,<88,cpyN4To8VE
cpyN4To8,F,0,<88,cpyN4To8VF

cpyN4To8V0,r,r,>36,setN4V0
cpyN4To8V0,*,*,<,cpyN4To8V0

cpyN4To8V1,r,r,>36,setN4V1
cpyN4To8V1,*,*,<,cpyN4To8V1

cpyN4To8V2,r,r,>36,setN4V2
cpyN4To8V2,*,*,<,cpyN4To8V2

cpyN4To8V3,r,r,>36,setN4V3
cpyN4To8V3,*,*,<,cpyN4To8V3

cpyN4To8V4,r,r,>36,setN4V4
cpyN4To8V4,*,*,<,cpyN4To8V4

cpyN4To8V5,r,r,>36,setN4V5
cpyN4To8V5,*,*,<,cpyN4To8V5

cpyN4To8V6,r,r,>36,setN4V6
cpyN4To8V6,*,*,<,cpyN4To8V6

cpyN4To8V7,r,r,>36,setN4V7
cpyN4To8V7,*,*,<,cpyN4To8V7

cpyN4To8V8,r,r,>36,setN4V8
cpyN4To8V8,*,*,<,cpyN4To8V8

cpyN4To8V9,r,r,>36,setN4V9
cpyN4To8V9,*,*,<,cpyN4To8V9

cpyN4To8VA,r,r,>36,setN4VA
cpyN4To8VA,*,*,<,cpyN4To8VA

cpyN4To8VB,r,r,>36,setN4VB
cpyN4To8VB,*,*,<,cpyN4To8VB

cpyN4To8VC,r,r,>36,setN4VC
cpyN4To8VC,*,*,<,cpyN4To8VC

cpyN4To8VD,r,r,>36,setN4VD
cpyN4To8VD,*,*,<,cpyN4To8VD

cpyN4To8VE,r,r,>36,setN4VE
cpyN4To8VE,*,*,<,cpyN4To8VE

cpyN4To8VF,r,r,>36,setN4VF
cpyN4To8VF,*,*,<,cpyN4To8VF

//-
cpyN4To9,0,0,<88,cpyN4To9V0
cpyN4To9,_,0,<88,cpyN4To9V0
cpyN4To9,1,0,<88,cpyN4To9V1
cpyN4To9,2,0,<88,cpyN4To9V2
cpyN4To9,3,0,<88,cpyN4To9V3
cpyN4To9,4,0,<88,cpyN4To9V4
cpyN4To9,5,0,<88,cpyN4To9V5
cpyN4To9,6,0,<88,cpyN4To9V6
cpyN4To9,7,0,<88,cpyN4To9V7
cpyN4To9,8,0,<88,cpyN4To9V8
cpyN4To9,9,0,<88,cpyN4To9V9
cpyN4To9,A,0,<88,cpyN4To9VA
cpyN4To9,B,0,<88,cpyN4To9VB
cpyN4To9,C,0,<88,cpyN4To9VC
cpyN4To9,D,0,<88,cpyN4To9VD
cpyN4To9,E,0,<88,cpyN4To9VE
cpyN4To9,F,0,<88,cpyN4To9VF

cpyN4To9V0,r,r,>40,setN4V0
cpyN4To9V0,*,*,<,cpyN4To9V0

cpyN4To9V1,r,r,>40,setN4V1
cpyN4To9V1,*,*,<,cpyN4To9V1

cpyN4To9V2,r,r,>40,setN4V2
cpyN4To9V2,*,*,<,cpyN4To9V2

cpyN4To9V3,r,r,>40,setN4V3
cpyN4To9V3,*,*,<,cpyN4To9V3

cpyN4To9V4,r,r,>40,setN4V4
cpyN4To9V4,*,*,<,cpyN4To9V4

cpyN4To9V5,r,r,>40,setN4V5
cpyN4To9V5,*,*,<,cpyN4To9V5

cpyN4To9V6,r,r,>40,setN4V6
cpyN4To9V6,*,*,<,cpyN4To9V6

cpyN4To9V7,r,r,>40,setN4V7
cpyN4To9V7,*,*,<,cpyN4To9V7

cpyN4To9V8,r,r,>40,setN4V8
cpyN4To9V8,*,*,<,cpyN4To9V8

cpyN4To9V9,r,r,>40,setN4V9
cpyN4To9V9,*,*,<,cpyN4To9V9

cpyN4To9VA,r,r,>40,setN4VA
cpyN4To9VA,*,*,<,cpyN4To9VA

cpyN4To9VB,r,r,>40,setN4VB
cpyN4To9VB,*,*,<,cpyN4To9VB

cpyN4To9VC,r,r,>40,setN4VC
cpyN4To9VC,*,*,<,cpyN4To9VC

cpyN4To9VD,r,r,>40,setN4VD
cpyN4To9VD,*,*,<,cpyN4To9VD

cpyN4To9VE,r,r,>40,setN4VE
cpyN4To9VE,*,*,<,cpyN4To9VE

cpyN4To9VF,r,r,>40,setN4VF
cpyN4To9VF,*,*,<,cpyN4To9VF

//-
cpyN4ToA,0,0,<88,cpyN4ToAV0
cpyN4ToA,_,0,<88,cpyN4ToAV0
cpyN4ToA,1,0,<88,cpyN4ToAV1
cpyN4ToA,2,0,<88,cpyN4ToAV2
cpyN4ToA,3,0,<88,cpyN4ToAV3
cpyN4ToA,4,0,<88,cpyN4ToAV4
cpyN4ToA,5,0,<88,cpyN4ToAV5
cpyN4ToA,6,0,<88,cpyN4ToAV6
cpyN4ToA,7,0,<88,cpyN4ToAV7
cpyN4ToA,8,0,<88,cpyN4ToAV8
cpyN4ToA,9,0,<88,cpyN4ToAV9
cpyN4ToA,A,0,<88,cpyN4ToAVA
cpyN4ToA,B,0,<88,cpyN4ToAVB
cpyN4ToA,C,0,<88,cpyN4ToAVC
cpyN4ToA,D,0,<88,cpyN4ToAVD
cpyN4ToA,E,0,<88,cpyN4ToAVE
cpyN4ToA,F,0,<88,cpyN4ToAVF

cpyN4ToAV0,r,r,>44,setN4V0
cpyN4ToAV0,*,*,<,cpyN4ToAV0

cpyN4ToAV1,r,r,>44,setN4V1
cpyN4ToAV1,*,*,<,cpyN4ToAV1

cpyN4ToAV2,r,r,>44,setN4V2
cpyN4ToAV2,*,*,<,cpyN4ToAV2

cpyN4ToAV3,r,r,>44,setN4V3
cpyN4ToAV3,*,*,<,cpyN4ToAV3

cpyN4ToAV4,r,r,>44,setN4V4
cpyN4ToAV4,*,*,<,cpyN4ToAV4

cpyN4ToAV5,r,r,>44,setN4V5
cpyN4ToAV5,*,*,<,cpyN4ToAV5

cpyN4ToAV6,r,r,>44,setN4V6
cpyN4ToAV6,*,*,<,cpyN4ToAV6

cpyN4ToAV7,r,r,>44,setN4V7
cpyN4ToAV7,*,*,<,cpyN4ToAV7

cpyN4ToAV8,r,r,>44,setN4V8
cpyN4ToAV8,*,*,<,cpyN4ToAV8

cpyN4ToAV9,r,r,>44,setN4V9
cpyN4ToAV9,*,*,<,cpyN4ToAV9

cpyN4ToAVA,r,r,>44,setN4VA
cpyN4ToAVA,*,*,<,cpyN4ToAVA

cpyN4ToAVB,r,r,>44,setN4VB
cpyN4ToAVB,*,*,<,cpyN4ToAVB

cpyN4ToAVC,r,r,>44,setN4VC
cpyN4ToAVC,*,*,<,cpyN4ToAVC

cpyN4ToAVD,r,r,>44,setN4VD
cpyN4ToAVD,*,*,<,cpyN4ToAVD

cpyN4ToAVE,r,r,>44,setN4VE
cpyN4ToAVE,*,*,<,cpyN4ToAVE

cpyN4ToAVF,r,r,>44,setN4VF
cpyN4ToAVF,*,*,<,cpyN4ToAVF

//-
cpyN4ToB,0,0,<88,cpyN4ToBV0
cpyN4ToB,_,0,<88,cpyN4ToBV0
cpyN4ToB,1,0,<88,cpyN4ToBV1
cpyN4ToB,2,0,<88,cpyN4ToBV2
cpyN4ToB,3,0,<88,cpyN4ToBV3
cpyN4ToB,4,0,<88,cpyN4ToBV4
cpyN4ToB,5,0,<88,cpyN4ToBV5
cpyN4ToB,6,0,<88,cpyN4ToBV6
cpyN4ToB,7,0,<88,cpyN4ToBV7
cpyN4ToB,8,0,<88,cpyN4ToBV8
cpyN4ToB,9,0,<88,cpyN4ToBV9
cpyN4ToB,A,0,<88,cpyN4ToBVA
cpyN4ToB,B,0,<88,cpyN4ToBVB
cpyN4ToB,C,0,<88,cpyN4ToBVC
cpyN4ToB,D,0,<88,cpyN4ToBVD
cpyN4ToB,E,0,<88,cpyN4ToBVE
cpyN4ToB,F,0,<88,cpyN4ToBVF

cpyN4ToBV0,r,r,>48,setN4V0
cpyN4ToBV0,*,*,<,cpyN4ToBV0

cpyN4ToBV1,r,r,>48,setN4V1
cpyN4ToBV1,*,*,<,cpyN4ToBV1

cpyN4ToBV2,r,r,>48,setN4V2
cpyN4ToBV2,*,*,<,cpyN4ToBV2

cpyN4ToBV3,r,r,>48,setN4V3
cpyN4ToBV3,*,*,<,cpyN4ToBV3

cpyN4ToBV4,r,r,>48,setN4V4
cpyN4ToBV4,*,*,<,cpyN4ToBV4

cpyN4ToBV5,r,r,>48,setN4V5
cpyN4ToBV5,*,*,<,cpyN4ToBV5

cpyN4ToBV6,r,r,>48,setN4V6
cpyN4ToBV6,*,*,<,cpyN4ToBV6

cpyN4ToBV7,r,r,>48,setN4V7
cpyN4ToBV7,*,*,<,cpyN4ToBV7

cpyN4ToBV8,r,r,>48,setN4V8
cpyN4ToBV8,*,*,<,cpyN4ToBV8

cpyN4ToBV9,r,r,>48,setN4V9
cpyN4ToBV9,*,*,<,cpyN4ToBV9

cpyN4ToBVA,r,r,>48,setN4VA
cpyN4ToBVA,*,*,<,cpyN4ToBVA

cpyN4ToBVB,r,r,>48,setN4VB
cpyN4ToBVB,*,*,<,cpyN4ToBVB

cpyN4ToBVC,r,r,>48,setN4VC
cpyN4ToBVC,*,*,<,cpyN4ToBVC

cpyN4ToBVD,r,r,>48,setN4VD
cpyN4ToBVD,*,*,<,cpyN4ToBVD

cpyN4ToBVE,r,r,>48,setN4VE
cpyN4ToBVE,*,*,<,cpyN4ToBVE

cpyN4ToBVF,r,r,>48,setN4VF
cpyN4ToBVF,*,*,<,cpyN4ToBVF

//-
cpyN4ToC,0,0,<88,cpyN4ToCV0
cpyN4ToC,_,0,<88,cpyN4ToCV0
cpyN4ToC,1,0,<88,cpyN4ToCV1
cpyN4ToC,2,0,<88,cpyN4ToCV2
cpyN4ToC,3,0,<88,cpyN4ToCV3
cpyN4ToC,4,0,<88,cpyN4ToCV4
cpyN4ToC,5,0,<88,cpyN4ToCV5
cpyN4ToC,6,0,<88,cpyN4ToCV6
cpyN4ToC,7,0,<88,cpyN4ToCV7
cpyN4ToC,8,0,<88,cpyN4ToCV8
cpyN4ToC,9,0,<88,cpyN4ToCV9
cpyN4ToC,A,0,<88,cpyN4ToCVA
cpyN4ToC,B,0,<88,cpyN4ToCVB
cpyN4ToC,C,0,<88,cpyN4ToCVC
cpyN4ToC,D,0,<88,cpyN4ToCVD
cpyN4ToC,E,0,<88,cpyN4ToCVE
cpyN4ToC,F,0,<88,cpyN4ToCVF

cpyN4ToCV0,r,r,>52,setN4V0
cpyN4ToCV0,*,*,<,cpyN4ToCV0

cpyN4ToCV1,r,r,>52,setN4V1
cpyN4ToCV1,*,*,<,cpyN4ToCV1

cpyN4ToCV2,r,r,>52,setN4V2
cpyN4ToCV2,*,*,<,cpyN4ToCV2

cpyN4ToCV3,r,r,>52,setN4V3
cpyN4ToCV3,*,*,<,cpyN4ToCV3

cpyN4ToCV4,r,r,>52,setN4V4
cpyN4ToCV4,*,*,<,cpyN4ToCV4

cpyN4ToCV5,r,r,>52,setN4V5
cpyN4ToCV5,*,*,<,cpyN4ToCV5

cpyN4ToCV6,r,r,>52,setN4V6
cpyN4ToCV6,*,*,<,cpyN4ToCV6

cpyN4ToCV7,r,r,>52,setN4V7
cpyN4ToCV7,*,*,<,cpyN4ToCV7

cpyN4ToCV8,r,r,>52,setN4V8
cpyN4ToCV8,*,*,<,cpyN4ToCV8

cpyN4ToCV9,r,r,>52,setN4V9
cpyN4ToCV9,*,*,<,cpyN4ToCV9

cpyN4ToCVA,r,r,>52,setN4VA
cpyN4ToCVA,*,*,<,cpyN4ToCVA

cpyN4ToCVB,r,r,>52,setN4VB
cpyN4ToCVB,*,*,<,cpyN4ToCVB

cpyN4ToCVC,r,r,>52,setN4VC
cpyN4ToCVC,*,*,<,cpyN4ToCVC

cpyN4ToCVD,r,r,>52,setN4VD
cpyN4ToCVD,*,*,<,cpyN4ToCVD

cpyN4ToCVE,r,r,>52,setN4VE
cpyN4ToCVE,*,*,<,cpyN4ToCVE

cpyN4ToCVF,r,r,>52,setN4VF
cpyN4ToCVF,*,*,<,cpyN4ToCVF

//-
cpyN4ToD,0,0,<88,cpyN4ToDV0
cpyN4ToD,_,0,<88,cpyN4ToDV0
cpyN4ToD,1,0,<88,cpyN4ToDV1
cpyN4ToD,2,0,<88,cpyN4ToDV2
cpyN4ToD,3,0,<88,cpyN4ToDV3
cpyN4ToD,4,0,<88,cpyN4ToDV4
cpyN4ToD,5,0,<88,cpyN4ToDV5
cpyN4ToD,6,0,<88,cpyN4ToDV6
cpyN4ToD,7,0,<88,cpyN4ToDV7
cpyN4ToD,8,0,<88,cpyN4ToDV8
cpyN4ToD,9,0,<88,cpyN4ToDV9
cpyN4ToD,A,0,<88,cpyN4ToDVA
cpyN4ToD,B,0,<88,cpyN4ToDVB
cpyN4ToD,C,0,<88,cpyN4ToDVC
cpyN4ToD,D,0,<88,cpyN4ToDVD
cpyN4ToD,E,0,<88,cpyN4ToDVE
cpyN4ToD,F,0,<88,cpyN4ToDVF

cpyN4ToDV0,r,r,>56,setN4V0
cpyN4ToDV0,*,*,<,cpyN4ToDV0

cpyN4ToDV1,r,r,>56,setN4V1
cpyN4ToDV1,*,*,<,cpyN4ToDV1

cpyN4ToDV2,r,r,>56,setN4V2
cpyN4ToDV2,*,*,<,cpyN4ToDV2

cpyN4ToDV3,r,r,>56,setN4V3
cpyN4ToDV3,*,*,<,cpyN4ToDV3

cpyN4ToDV4,r,r,>56,setN4V4
cpyN4ToDV4,*,*,<,cpyN4ToDV4

cpyN4ToDV5,r,r,>56,setN4V5
cpyN4ToDV5,*,*,<,cpyN4ToDV5

cpyN4ToDV6,r,r,>56,setN4V6
cpyN4ToDV6,*,*,<,cpyN4ToDV6

cpyN4ToDV7,r,r,>56,setN4V7
cpyN4ToDV7,*,*,<,cpyN4ToDV7

cpyN4ToDV8,r,r,>56,setN4V8
cpyN4ToDV8,*,*,<,cpyN4ToDV8

cpyN4ToDV9,r,r,>56,setN4V9
cpyN4ToDV9,*,*,<,cpyN4ToDV9

cpyN4ToDVA,r,r,>56,setN4VA
cpyN4ToDVA,*,*,<,cpyN4ToDVA

cpyN4ToDVB,r,r,>56,setN4VB
cpyN4ToDVB,*,*,<,cpyN4ToDVB

cpyN4ToDVC,r,r,>56,setN4VC
cpyN4ToDVC,*,*,<,cpyN4ToDVC

cpyN4ToDVD,r,r,>56,setN4VD
cpyN4ToDVD,*,*,<,cpyN4ToDVD

cpyN4ToDVE,r,r,>56,setN4VE
cpyN4ToDVE,*,*,<,cpyN4ToDVE

cpyN4ToDVF,r,r,>56,setN4VF
cpyN4ToDVF,*,*,<,cpyN4ToDVF

//-
cpyN4ToE,0,0,<88,cpyN4ToEV0
cpyN4ToE,_,0,<88,cpyN4ToEV0
cpyN4ToE,1,0,<88,cpyN4ToEV1
cpyN4ToE,2,0,<88,cpyN4ToEV2
cpyN4ToE,3,0,<88,cpyN4ToEV3
cpyN4ToE,4,0,<88,cpyN4ToEV4
cpyN4ToE,5,0,<88,cpyN4ToEV5
cpyN4ToE,6,0,<88,cpyN4ToEV6
cpyN4ToE,7,0,<88,cpyN4ToEV7
cpyN4ToE,8,0,<88,cpyN4ToEV8
cpyN4ToE,9,0,<88,cpyN4ToEV9
cpyN4ToE,A,0,<88,cpyN4ToEVA
cpyN4ToE,B,0,<88,cpyN4ToEVB
cpyN4ToE,C,0,<88,cpyN4ToEVC
cpyN4ToE,D,0,<88,cpyN4ToEVD
cpyN4ToE,E,0,<88,cpyN4ToEVE
cpyN4ToE,F,0,<88,cpyN4ToEVF

cpyN4ToEV0,r,r,>60,setN4V0
cpyN4ToEV0,*,*,<,cpyN4ToEV0

cpyN4ToEV1,r,r,>60,setN4V1
cpyN4ToEV1,*,*,<,cpyN4ToEV1

cpyN4ToEV2,r,r,>60,setN4V2
cpyN4ToEV2,*,*,<,cpyN4ToEV2

cpyN4ToEV3,r,r,>60,setN4V3
cpyN4ToEV3,*,*,<,cpyN4ToEV3

cpyN4ToEV4,r,r,>60,setN4V4
cpyN4ToEV4,*,*,<,cpyN4ToEV4

cpyN4ToEV5,r,r,>60,setN4V5
cpyN4ToEV5,*,*,<,cpyN4ToEV5

cpyN4ToEV6,r,r,>60,setN4V6
cpyN4ToEV6,*,*,<,cpyN4ToEV6

cpyN4ToEV7,r,r,>60,setN4V7
cpyN4ToEV7,*,*,<,cpyN4ToEV7

cpyN4ToEV8,r,r,>60,setN4V8
cpyN4ToEV8,*,*,<,cpyN4ToEV8

cpyN4ToEV9,r,r,>60,setN4V9
cpyN4ToEV9,*,*,<,cpyN4ToEV9

cpyN4ToEVA,r,r,>60,setN4VA
cpyN4ToEVA,*,*,<,cpyN4ToEVA

cpyN4ToEVB,r,r,>60,setN4VB
cpyN4ToEVB,*,*,<,cpyN4ToEVB

cpyN4ToEVC,r,r,>60,setN4VC
cpyN4ToEVC,*,*,<,cpyN4ToEVC

cpyN4ToEVD,r,r,>60,setN4VD
cpyN4ToEVD,*,*,<,cpyN4ToEVD

cpyN4ToEVE,r,r,>60,setN4VE
cpyN4ToEVE,*,*,<,cpyN4ToEVE

cpyN4ToEVF,r,r,>60,setN4VF
cpyN4ToEVF,*,*,<,cpyN4ToEVF

//-
cpyN4ToF,0,0,<88,cpyN4ToFV0
cpyN4ToF,_,0,<88,cpyN4ToFV0
cpyN4ToF,1,0,<88,cpyN4ToFV1
cpyN4ToF,2,0,<88,cpyN4ToFV2
cpyN4ToF,3,0,<88,cpyN4ToFV3
cpyN4ToF,4,0,<88,cpyN4ToFV4
cpyN4ToF,5,0,<88,cpyN4ToFV5
cpyN4ToF,6,0,<88,cpyN4ToFV6
cpyN4ToF,7,0,<88,cpyN4ToFV7
cpyN4ToF,8,0,<88,cpyN4ToFV8
cpyN4ToF,9,0,<88,cpyN4ToFV9
cpyN4ToF,A,0,<88,cpyN4ToFVA
cpyN4ToF,B,0,<88,cpyN4ToFVB
cpyN4ToF,C,0,<88,cpyN4ToFVC
cpyN4ToF,D,0,<88,cpyN4ToFVD
cpyN4ToF,E,0,<88,cpyN4ToFVE
cpyN4ToF,F,0,<88,cpyN4ToFVF

cpyN4ToFV0,r,r,>64,setN4V0
cpyN4ToFV0,*,*,<,cpyN4ToFV0

cpyN4ToFV1,r,r,>64,setN4V1
cpyN4ToFV1,*,*,<,cpyN4ToFV1

cpyN4ToFV2,r,r,>64,setN4V2
cpyN4ToFV2,*,*,<,cpyN4ToFV2

cpyN4ToFV3,r,r,>64,setN4V3
cpyN4ToFV3,*,*,<,cpyN4ToFV3

cpyN4ToFV4,r,r,>64,setN4V4
cpyN4ToFV4,*,*,<,cpyN4ToFV4

cpyN4ToFV5,r,r,>64,setN4V5
cpyN4ToFV5,*,*,<,cpyN4ToFV5

cpyN4ToFV6,r,r,>64,setN4V6
cpyN4ToFV6,*,*,<,cpyN4ToFV6

cpyN4ToFV7,r,r,>64,setN4V7
cpyN4ToFV7,*,*,<,cpyN4ToFV7

cpyN4ToFV8,r,r,>64,setN4V8
cpyN4ToFV8,*,*,<,cpyN4ToFV8

cpyN4ToFV9,r,r,>64,setN4V9
cpyN4ToFV9,*,*,<,cpyN4ToFV9

cpyN4ToFVA,r,r,>64,setN4VA
cpyN4ToFVA,*,*,<,cpyN4ToFVA

cpyN4ToFVB,r,r,>64,setN4VB
cpyN4ToFVB,*,*,<,cpyN4ToFVB

cpyN4ToFVC,r,r,>64,setN4VC
cpyN4ToFVC,*,*,<,cpyN4ToFVC

cpyN4ToFVD,r,r,>64,setN4VD
cpyN4ToFVD,*,*,<,cpyN4ToFVD

cpyN4ToFVE,r,r,>64,setN4VE
cpyN4ToFVE,*,*,<,cpyN4ToFVE

cpyN4ToFVF,r,r,>64,setN4VF
cpyN4ToFVF,*,*,<,cpyN4ToFVF

//N4