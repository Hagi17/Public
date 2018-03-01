//pointer either on 'x' or on 'w'
//copies Rd content to the memory
//pointer stays on most right nibble
//when address is FF: put on stdout

//copy copyCmd include 255 times
name: storeInMem
init: run
accept: fend

run,w,w,<15,run
run,x,x,>,cpythis

//setmem[Repetition][Value]
cpythis,0,0,<1102,setmem10
cpythis,1,1,<1102,setmem11
cpythis,2,2,<1102,setmem12
cpythis,3,3,<1102,setmem13
cpythis,4,4,<1102,setmem14
cpythis,5,5,<1102,setmem15
cpythis,6,6,<1102,setmem16
cpythis,7,7,<1102,setmem17
cpythis,8,8,<1102,setmem18
cpythis,9,9,<1102,setmem19
cpythis,A,A,<1102,setmem1A
cpythis,B,B,<1102,setmem1B
cpythis,C,C,<1102,setmem1C
cpythis,D,D,<1102,setmem1D
cpythis,E,E,<1102,setmem1E
cpythis,F,F,<1102,setmem1F

setmem10,_,_,>%,write10
write10,*,0,<%,run2

setmem11,_,_,>%,write11
write11,*,1,<%,run2

setmem12,_,_,>%,write12
write12,*,2,<%,run2

setmem13,_,_,>%,write13
write13,*,3,<%,run2

setmem14,_,_,>%,write14
write14,*,4,<%,run2

setmem15,_,_,>%,write15
write15,*,5,<%,run2

setmem16,_,_,>%,write16
write16,*,6,<%,run2

setmem17,_,_,>%,write17
write17,*,7,<%,run2

setmem18,_,_,>%,write18
write18,*,8,<%,run2

setmem19,_,_,>%,write19
write19,*,9,<%,run2

setmem1A,_,_,>%,write1A
write1A,*,A,<%,run2

setmem1B,_,_,>%,write1B
write1B,*,B,<%,run2

setmem1C,_,_,>%,write1C
write1C,*,C,<%,run2

setmem1D,_,_,>%,write1D
write1D,*,D,<%,run2

setmem1E,_,_,>%,write1E
write1E,*,E,<%,run2

setmem1F,_,_,>%,write1F
write1F,*,F,<%,run2

run2,m,m,>1098,next2
run2,*,*,>,run2

next2,x,x,>2,cpythis2

cpythis2,0,0,<1102,setmem20
cpythis2,1,1,<1102,setmem21
cpythis2,2,2,<1102,setmem22
cpythis2,3,3,<1102,setmem23
cpythis2,4,4,<1102,setmem24
cpythis2,5,5,<1102,setmem25
cpythis2,6,6,<1102,setmem26
cpythis2,7,7,<1102,setmem27
cpythis2,8,8,<1102,setmem28
cpythis2,9,9,<1102,setmem29
cpythis2,A,A,<1102,setmem2A
cpythis2,B,B,<1102,setmem2B
cpythis2,C,C,<1102,setmem2C
cpythis2,D,D,<1102,setmem2D
cpythis2,E,E,<1102,setmem2E
cpythis2,F,F,<1102,setmem2F

setmem20,_,_,>%,write20
write20,*,0,<%,run3

setmem21,_,_,>%,write21
write21,*,1,<%,run3

setmem22,_,_,>%,write22
write22,*,2,<%,run3

setmem23,_,_,>%,write23
write23,*,3,<%,run3

setmem24,_,_,>%,write24
write24,*,4,<%,run3

setmem25,_,_,>%,write25
write25,*,5,<%,run3

setmem26,_,_,>%,write26
write26,*,6,<%,run3

setmem27,_,_,>%,write27
write27,*,7,<%,run3

setmem28,_,_,>%,write28
write28,*,8,<%,run3

setmem29,_,_,>%,write29
write29,*,9,<%,run3

setmem2A,_,_,>%,write2A
write2A,*,A,<%,run3

setmem2B,_,_,>%,write2B
write2B,*,B,<%,run3

setmem2C,_,_,>%,write2C
write2C,*,C,<%,run3

setmem2D,_,_,>%,write2D
write2D,*,D,<%,run3

setmem2E,_,_,>%,write2E
write2E,*,E,<%,run3

setmem2F,_,_,>%,write2F
write2F,*,F,<%,run3

run3,m,m,>1098,next3
run3,*,*,>,run3

next3,x,x,>3,cpythis3

cpythis3,0,0,<1102,setmem30
cpythis3,1,1,<1102,setmem31
cpythis3,2,2,<1102,setmem32
cpythis3,3,3,<1102,setmem33
cpythis3,4,4,<1102,setmem34
cpythis3,5,5,<1102,setmem35
cpythis3,6,6,<1102,setmem36
cpythis3,7,7,<1102,setmem37
cpythis3,8,8,<1102,setmem38
cpythis3,9,9,<1102,setmem39
cpythis3,A,A,<1102,setmem3A
cpythis3,B,B,<1102,setmem3B
cpythis3,C,C,<1102,setmem3C
cpythis3,D,D,<1102,setmem3D
cpythis3,E,E,<1102,setmem3E
cpythis3,F,F,<1102,setmem3F

setmem30,_,_,>%,write30
write30,*,0,<%,run4

setmem31,_,_,>%,write31
write31,*,1,<%,run4

setmem32,_,_,>%,write32
write32,*,2,<%,run4

setmem33,_,_,>%,write33
write33,*,3,<%,run4

setmem34,_,_,>%,write34
write34,*,4,<%,run4

setmem35,_,_,>%,write35
write35,*,5,<%,run4

setmem36,_,_,>%,write36
write36,*,6,<%,run4

setmem37,_,_,>%,write37
write37,*,7,<%,run4

setmem38,_,_,>%,write38
write38,*,8,<%,run4

setmem39,_,_,>%,write39
write39,*,9,<%,run4

setmem3A,_,_,>%,write3A
write3A,*,A,<%,run4

setmem3B,_,_,>%,write3B
write3B,*,B,<%,run4

setmem3C,_,_,>%,write3C
write3C,*,C,<%,run4

setmem3D,_,_,>%,write3D
write3D,*,D,<%,run4

setmem3E,_,_,>%,write3E
write3E,*,E,<%,run4

setmem3F,_,_,>%,write3F
write3F,*,F,<%,run4

run4,m,m,>1098,next4
run4,*,*,>,run4

next4,x,x,>4,cpythis4

cpythis4,0,0,<1102,setmem40
cpythis4,1,1,<1102,setmem41
cpythis4,2,2,<1102,setmem42
cpythis4,3,3,<1102,setmem43
cpythis4,4,4,<1102,setmem44
cpythis4,5,5,<1102,setmem45
cpythis4,6,6,<1102,setmem46
cpythis4,7,7,<1102,setmem47
cpythis4,8,8,<1102,setmem48
cpythis4,9,9,<1102,setmem49
cpythis4,A,A,<1102,setmem4A
cpythis4,B,B,<1102,setmem4B
cpythis4,C,C,<1102,setmem4C
cpythis4,D,D,<1102,setmem4D
cpythis4,E,E,<1102,setmem4E
cpythis4,F,F,<1102,setmem4F

setmem40,_,_,>%,write40
setmem40,m,m,>%,write40
write40,*,0,<%,end

setmem41,_,_,>%,write41
setmem41,m,m,>%,write41
write41,*,1,<%,end

setmem42,_,_,>%,write42
setmem42,m,m,>%,write42
write42,*,2,<%,end

setmem43,_,_,>%,write43
setmem43,m,m,>%,write43
write43,*,3,<%,end

setmem44,_,_,>%,write44
setmem44,m,m,>%,write44
write44,*,4,<%,end

setmem45,_,_,>%,write45
setmem45,m,m,>%,write45
write45,*,5,<%,end

setmem46,_,_,>%,write46
setmem46,m,m,>%,write46
write46,*,6,<%,end

setmem47,_,_,>%,write47
setmem47,m,m,>%,write47
write47,*,7,<%,end

setmem48,_,_,>%,write48
setmem48,m,m,>%,write48
write48,*,8,<%,end

setmem49,_,_,>%,write49
setmem49,m,m,>%,write49
write49,*,9,<%,end

setmem4A,_,_,>%,write4A
setmem4A,m,m,>%,write4A
write4A,*,A,<%,end

setmem4B,_,_,>%,write4B
setmem4B,m,m,>%,write4B
write4B,*,B,<%,end

setmem4C,_,_,>%,write4C
setmem4C,m,m,>%,write4C
write4C,*,C,<%,end

setmem4D,_,_,>%,write4D
setmem4D,m,m,>%,write4D
write4D,*,D,<%,end

setmem4E,_,_,>%,write4E
setmem4E,m,m,>%,write4E
write4E,*,E,<%,end

setmem4F,_,_,>%,write4F
setmem4F,m,m,>%,write4F
write4F,*,F,<%,end


end,*,*,>,!store/end