name: copycmd
init: run
accept: end

run,m,m,<3,next
run,s,s,<1025,run
run,*,*,<,run
//when >% is implemented
next,*,*,>%,cpythis

//setcpu[Repetition][Value]
cpythis,0,0,<%,setcpu10
cpythis,1,1,<%,setcpu11
cpythis,2,2,<%,setcpu12
cpythis,3,3,<%,setcpu13
cpythis,4,4,<%,setcpu14
cpythis,5,5,<%,setcpu15
cpythis,6,6,<%,setcpu16
cpythis,7,7,<%,setcpu17
cpythis,8,8,<%,setcpu18
cpythis,9,9,<%,setcpu19
cpythis,A,A,<%,setcpu1A
cpythis,B,B,<%,setcpu1B
cpythis,C,C,<%,setcpu1C
cpythis,D,D,<%,setcpu1D
cpythis,E,E,<%,setcpu1E
cpythis,F,F,<%,setcpu1F

setcpu10,p,p,>,write10
setcpu10,m,m,>1091,setcpu10
//check66
setcpu10,*,*,>,setcpu10
write10,*,0,<,run2

setcpu11,p,p,>,write11
setcpu11,*,*,>,setcpu11
setcpu11,m,m,>1091,setcpu11
write11,*,1,<,run2

setcpu12,p,p,>,write12
setcpu12,*,*,>,setcpu12
setcpu12,m,m,>1091,setcpu12
write12,*,2,<,run2

setcpu13,p,p,>,write13
setcpu13,*,*,>,setcpu13
setcpu13,m,m,>1091,setcpu13
write13,*,3,<,run2

setcpu14,p,p,>,write14
setcpu14,*,*,>,setcpu14
setcpu14,m,m,>1091,setcpu14
write14,*,4,<,run2

setcpu15,p,p,>,write15
setcpu15,*,*,>,setcpu15
setcpu15,m,m,>1091,setcpu15
write15,*,5,<,run2

setcpu16,p,p,>,write16
setcpu16,*,*,>,setcpu16
setcpu16,m,m,>1091,setcpu16
write16,*,6,<,run2

setcpu17,p,p,>,write17
setcpu17,*,*,>,setcpu17
setcpu17,m,m,>1091,setcpu17
write17,*,7,<,run2

setcpu18,p,p,>,write18
setcpu18,*,*,>,setcpu18
setcpu18,m,m,>1091,setcpu18
write18,*,8,<,run2

setcpu19,p,p,>,write19
setcpu19,*,*,>,setcpu19
setcpu19,m,m,>1091,setcpu19
write19,*,9,<,run2

setcpu1A,p,p,>,write1A
setcpu1A,*,*,>,setcpu1A
setcpu1A,m,m,>1091,setcpu1A
write1A,*,A,<,run2

setcpu1B,p,p,>,write1B
setcpu1B,*,*,>,setcpu1B
setcpu1B,m,m,>1091,setcpu1B
write1B,*,B,<,run2

setcpu1C,p,p,>,write1C
setcpu1C,*,*,>,setcpu1C
setcpu1C,m,m,>1091,setcpu1C
write1C,*,C,<,run2

setcpu1D,p,p,>,write1D
setcpu1D,*,*,>,setcpu1D
setcpu1D,m,m,>1091,setcpu1D
write1D,*,D,<,run2

setcpu1E,p,p,>,write1E
setcpu1E,*,*,>,setcpu1E
setcpu1E,m,m,>1091,setcpu1E
write1E,*,E,<,run2

setcpu1F,p,p,>,write1F
setcpu1F,*,*,>,setcpu1F
setcpu1F,m,m,>1091,setcpu1F
write1F,*,F,<,run2

run2,m,m,<2,next2
run2,p,p,<66,run2
run2,s,s,<1025,run2
run2,*,*,<,run2

next2,*,*,>%,cpythis2
//next2,*,*,>%,cpy2this
//cpy2this,*,*,>,cpythis2

cpythis2,0,0,<%,setcpu20
cpythis2,1,1,<%,setcpu21
cpythis2,2,2,<%,setcpu22
cpythis2,3,3,<%,setcpu23
cpythis2,4,4,<%,setcpu24
cpythis2,5,5,<%,setcpu25
cpythis2,6,6,<%,setcpu26
cpythis2,7,7,<%,setcpu27
cpythis2,8,8,<%,setcpu28
cpythis2,9,9,<%,setcpu29
cpythis2,A,A,<%,setcpu2A
cpythis2,B,B,<%,setcpu2B
cpythis2,C,C,<%,setcpu2C
cpythis2,D,D,<%,setcpu2D
cpythis2,E,E,<%,setcpu2E
cpythis2,F,F,<%,setcpu2F

setcpu20,p,p,>2,write20
setcpu20,m,m,>1091,setcpu20
setcpu20,*,*,>,setcpu20
write20,*,0,<,run3

setcpu21,p,p,>2,write21
setcpu21,m,m,>1091,setcpu21
setcpu21,*,*,>,setcpu21
write21,*,1,<,run3

setcpu22,p,p,>2,write22
setcpu22,m,m,>1091,setcpu22
setcpu22,*,*,>,setcpu22
write22,*,2,<,run3

setcpu23,p,p,>2,write23
setcpu23,m,m,>1091,setcpu23
setcpu23,*,*,>,setcpu23
write23,*,3,<,run3

setcpu24,p,p,>2,write24
setcpu24,m,m,>1091,setcpu24
setcpu24,*,*,>,setcpu24
write24,*,4,<,run3

setcpu25,p,p,>2,write25
setcpu25,m,m,>1091,setcpu25
setcpu25,*,*,>,setcpu25
write25,*,5,<,run3

setcpu26,p,p,>2,write26
setcpu26,m,m,>1091,setcpu26
setcpu26,*,*,>,setcpu26
write26,*,6,<,run3

setcpu27,p,p,>2,write27
setcpu27,m,m,>1091,setcpu27
setcpu27,*,*,>,setcpu27
write27,*,7,<,run3

setcpu28,p,p,>2,write28
setcpu28,m,m,>1091,setcpu28
setcpu28,*,*,>,setcpu28
write28,*,8,<,run3

setcpu29,p,p,>2,write29
setcpu29,m,m,>1091,setcpu29
setcpu29,*,*,>,setcpu29
write29,*,9,<,run3

setcpu2A,p,p,>2,write2A
setcpu2A,m,m,>1091,setcpu2A
setcpu2A,*,*,>,setcpu2A
write2A,*,A,<,run3

setcpu2B,p,p,>2,write2B
setcpu2B,m,m,>1091,setcpu2B
setcpu2B,*,*,>,setcpu2B
write2B,*,B,<,run3

setcpu2C,p,p,>2,write2C
setcpu2C,m,m,>1091,setcpu2C
setcpu2C,*,*,>,setcpu2C
write2C,*,C,<,run3

setcpu2D,p,p,>2,write2D
setcpu2D,m,m,>1091,setcpu2D
setcpu2D,*,*,>,setcpu2D
write2D,*,D,<,run3

setcpu2E,p,p,>2,write2E
setcpu2E,m,m,>1091,setcpu2E
setcpu2E,*,*,>,setcpu2E
write2E,*,E,<,run3

setcpu2F,p,p,>2,write2F
setcpu2F,m,m,>1091,setcpu2F
setcpu2F,*,*,>,setcpu2F
write2F,*,F,<,run3

run3,m,m,<,next3
run3,p,p,<66,run3
run3,s,s,<1025,run3
run3,*,*,<,run3

next3,*,*,>%,cpythis3
//next3,*,*,>%,cpy3this
//cpy3this,*,*,>2,cpythis3

cpythis3,0,0,<%,setcpu30
cpythis3,1,1,<%,setcpu31
cpythis3,2,2,<%,setcpu32
cpythis3,3,3,<%,setcpu33
cpythis3,4,4,<%,setcpu34
cpythis3,5,5,<%,setcpu35
cpythis3,6,6,<%,setcpu36
cpythis3,7,7,<%,setcpu37
cpythis3,8,8,<%,setcpu38
cpythis3,9,9,<%,setcpu39
cpythis3,A,A,<%,setcpu3A
cpythis3,B,B,<%,setcpu3B
cpythis3,C,C,<%,setcpu3C
cpythis3,D,D,<%,setcpu3D
cpythis3,E,E,<%,setcpu3E
cpythis3,F,F,<%,setcpu3F

setcpu30,p,p,>3,write30
setcpu30,m,m,>1091,setcpu30
setcpu30,*,*,>,setcpu30
write30,*,0,<,run4

setcpu31,p,p,>3,write31
setcpu31,m,m,>1091,setcpu31
setcpu31,*,*,>,setcpu31
write31,*,1,<,run4

setcpu32,p,p,>3,write32
setcpu32,m,m,>1091,setcpu32
setcpu32,*,*,>,setcpu32
write32,*,2,<,run4

setcpu33,p,p,>3,write33
setcpu33,m,m,>1091,setcpu33
setcpu33,*,*,>,setcpu33
write33,*,3,<,run4

setcpu34,p,p,>3,write34
setcpu34,m,m,>1091,setcpu34
setcpu34,*,*,>,setcpu34
write34,*,4,<,run4

setcpu35,p,p,>3,write35
setcpu35,m,m,>1091,setcpu35
setcpu35,*,*,>,setcpu35
write35,*,5,<,run4

setcpu36,p,p,>3,write36
setcpu36,m,m,>1091,setcpu36
setcpu36,*,*,>,setcpu36
write36,*,6,<,run4

setcpu37,p,p,>3,write37
setcpu37,m,m,>1091,setcpu37
setcpu37,*,*,>,setcpu37
write37,*,7,<,run4

setcpu38,p,p,>3,write38
setcpu38,m,m,>1091,setcpu38
setcpu38,*,*,>,setcpu38
write38,*,8,<,run4

setcpu39,p,p,>3,write39
setcpu39,m,m,>1091,setcpu39
setcpu39,*,*,>,setcpu39
write39,*,9,<,run4

setcpu3A,p,p,>3,write3A
setcpu3A,m,m,>1091,setcpu3A
setcpu3A,*,*,>,setcpu3A
write3A,*,A,<,run4

setcpu3B,p,p,>3,write3B
setcpu3B,m,m,>1091,setcpu3B
setcpu3B,*,*,>,setcpu3B
write3B,*,B,<,run4

setcpu3C,p,p,>3,write3C
setcpu3C,m,m,>1091,setcpu3C
setcpu3C,*,*,>,setcpu3C
write3C,*,C,<,run4

setcpu3D,p,p,>3,write3D
setcpu3D,m,m,>1091,setcpu3D
setcpu3D,*,*,>,setcpu3D
write3D,*,D,<,run4

setcpu3E,p,p,>3,write3E
setcpu3E,m,m,>1091,setcpu3E
setcpu3E,*,*,>,setcpu3E
write3E,*,E,<,run4

setcpu3F,p,p,>3,write3F
setcpu3F,m,m,>1091,setcpu3F
setcpu3F,*,*,>,setcpu3F
write3F,*,F,<,run4

run4,m,m,-,next4
run4,p,p,<66,run4
run4,s,s,<1025,run4
run4,*,*,<,run4

next4,*,*,>%,cpythis4
//next4,*,*,>%,cpy4this
//cpy4this,*,*,>3,cpythis4

cpythis4,0,0,<%,setcpu40
cpythis4,1,1,<%,setcpu41
cpythis4,2,2,<%,setcpu42
cpythis4,3,3,<%,setcpu43
cpythis4,4,4,<%,setcpu44
cpythis4,5,5,<%,setcpu45
cpythis4,6,6,<%,setcpu46
cpythis4,7,7,<%,setcpu47
cpythis4,8,8,<%,setcpu48
cpythis4,9,9,<%,setcpu49
cpythis4,A,A,<%,setcpu4A
cpythis4,B,B,<%,setcpu4B
cpythis4,C,C,<%,setcpu4C
cpythis4,D,D,<%,setcpu4D
cpythis4,E,E,<%,setcpu4E
cpythis4,F,F,<%,setcpu4F

setcpu40,p,p,>4,write40
setcpu40,m,m,>1091,setcpu40
setcpu40,*,*,>,setcpu40
write40,*,0,<,gos

setcpu41,p,p,>4,write41
setcpu41,m,m,>1091,setcpu41
setcpu41,*,*,>,setcpu41
write41,*,1,<,gos

setcpu42,p,p,>4,write42
setcpu42,m,m,>1091,setcpu42
setcpu42,*,*,>,setcpu42
write42,*,2,<,gos

setcpu43,p,p,>4,write43
setcpu43,m,m,>1091,setcpu43
setcpu43,*,*,>,setcpu43
write43,*,3,<,gos

setcpu44,p,p,>4,write44
setcpu44,m,m,>1091,setcpu44
setcpu44,*,*,>,setcpu44
write44,*,4,<,gos

setcpu45,p,p,>4,write45
setcpu45,m,m,>1091,setcpu45
setcpu45,*,*,>,setcpu45
write45,*,5,<,gos

setcpu46,p,p,>4,write46
setcpu46,m,m,>1091,setcpu46
setcpu46,*,*,>,setcpu46
write46,*,6,<,gos

setcpu47,p,p,>4,write47
setcpu47,m,m,>1091,setcpu47
setcpu47,*,*,>,setcpu47
write47,*,7,<,gos

setcpu48,p,p,>4,write48
setcpu48,m,m,>1091,setcpu48
setcpu48,*,*,>,setcpu48
write48,*,8,<,gos

setcpu49,p,p,>4,write49
setcpu49,m,m,>1091,setcpu49
setcpu49,*,*,>,setcpu49
write49,*,9,<,gos

setcpu4A,p,p,>4,write4A
setcpu4A,m,m,>1091,setcpu4A
setcpu4A,*,*,>,setcpu4A
write4A,*,A,<,gos

setcpu4B,p,p,>4,write4B
setcpu4B,m,m,>1091,setcpu4B
setcpu4B,*,*,>,setcpu4B
write4B,*,B,<,gos

setcpu4C,p,p,>4,write4C
setcpu4C,m,m,>1091,setcpu4C
setcpu4C,*,*,>,setcpu4C
write4C,*,C,<,gos

setcpu4D,p,p,>4,write4D
setcpu4D,m,m,>1091,setcpu4D
setcpu4D,*,*,>,setcpu4D
write4D,*,D,<,gos

setcpu4E,p,p,>4,write4E
setcpu4E,m,m,>1091,setcpu4E
setcpu4E,*,*,>,setcpu4E
write4E,*,E,<,gos

setcpu4F,p,p,>4,write4F
setcpu4F,m,m,>1091,setcpu4F
setcpu4F,*,*,>,setcpu4F
write4F,*,F,<,gos
//set pointer to 'd' in the command and go prefetching
gos,*,*,<,!prefetch/run