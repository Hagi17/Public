//pointer: either on x or on w
//copies value in memory to working space
//pointer stays on most right nibble in working space
//when address is FF: use stdin

//memory address is encoded stored in %

name: copyMem
init: run
accept: fend

run,m,m,<3,next
run,w,w,<1113,run
run,x,x,<1098,run
run,p,p,<1093,run
run,s,s,<1025,run
run,*,*,<,run
//when >% is implemented
next,*,*,>%,cpythis

//setwork[Repetition][Value]
cpythis,0,0,<%,setwork10
cpythis,1,1,<%,setwork11
cpythis,2,2,<%,setwork12
cpythis,3,3,<%,setwork13
cpythis,4,4,<%,setwork14
cpythis,5,5,<%,setwork15
cpythis,6,6,<%,setwork16
cpythis,7,7,<%,setwork17
cpythis,8,8,<%,setwork18
cpythis,9,9,<%,setwork19
cpythis,A,A,<%,setwork1A
cpythis,B,B,<%,setwork1B
cpythis,C,C,<%,setwork1C
cpythis,D,D,<%,setwork1D
cpythis,E,E,<%,setwork1E
cpythis,F,F,<%,setwork1F

setwork10,w,w,>,write10
setwork10,m,m,>1113,setwork10
//check66
setwork10,*,*,>,setwork10
write10,*,0,<,run2

setwork11,w,w,>,write11
setwork11,*,*,>,setwork11
setwork11,m,m,>1113,setwork11
write11,*,1,<,run2

setwork12,w,w,>,write12
setwork12,*,*,>,setwork12
setwork12,m,m,>1113,setwork12
write12,*,2,<,run2

setwork13,w,w,>,write13
setwork13,*,*,>,setwork13
setwork13,m,m,>1113,setwork13
write13,*,3,<,run2

setwork14,w,w,>,write14
setwork14,*,*,>,setwork14
setwork14,m,m,>1113,setwork14
write14,*,4,<,run2

setwork15,w,w,>,write15
setwork15,*,*,>,setwork15
setwork15,m,m,>1113,setwork15
write15,*,5,<,run2

setwork16,w,w,>,write16
setwork16,*,*,>,setwork16
setwork16,m,m,>1113,setwork16
write16,*,6,<,run2

setwork17,w,w,>,write17
setwork17,*,*,>,setwork17
setwork17,m,m,>1113,setwork17
write17,*,7,<,run2

setwork18,w,w,>,write18
setwork18,*,*,>,setwork18
setwork18,m,m,>1113,setwork18
write18,*,8,<,run2

setwork19,w,w,>,write19
setwork19,*,*,>,setwork19
setwork19,m,m,>1113,setwork19
write19,*,9,<,run2

setwork1A,w,w,>,write1A
setwork1A,*,*,>,setwork1A
setwork1A,m,m,>1113,setwork1A
write1A,*,A,<,run2

setwork1B,w,w,>,write1B
setwork1B,*,*,>,setwork1B
setwork1B,m,m,>1113,setwork1B
write1B,*,B,<,run2

setwork1C,w,w,>,write1C
setwork1C,*,*,>,setwork1C
setwork1C,m,m,>1113,setwork1C
write1C,*,C,<,run2

setwork1D,w,w,>,write1D
setwork1D,*,*,>,setwork1D
setwork1D,m,m,>1113,setwork1D
write1D,*,D,<,run2

setwork1E,w,w,>,write1E
setwork1E,*,*,>,setwork1E
setwork1E,m,m,>1113,setwork1E
write1E,*,E,<,run2

setwork1F,w,w,>,write1F
setwork1F,*,*,>,setwork1F
setwork1F,m,m,>1113,setwork1F
write1F,*,F,<,run2

run2,m,m,<2,next2
run2,w,w,<1113,run2
run2,x,x,<1098,run2
run2,p,p,<66,run2
run2,s,s,<1025,run2
run2,*,*,<,run2

next2,*,*,>%,cpythis2

cpythis2,0,0,<%,setwork20
cpythis2,1,1,<%,setwork21
cpythis2,2,2,<%,setwork22
cpythis2,3,3,<%,setwork23
cpythis2,4,4,<%,setwork24
cpythis2,5,5,<%,setwork25
cpythis2,6,6,<%,setwork26
cpythis2,7,7,<%,setwork27
cpythis2,8,8,<%,setwork28
cpythis2,9,9,<%,setwork29
cpythis2,A,A,<%,setwork2A
cpythis2,B,B,<%,setwork2B
cpythis2,C,C,<%,setwork2C
cpythis2,D,D,<%,setwork2D
cpythis2,E,E,<%,setwork2E
cpythis2,F,F,<%,setwork2F

setwork20,w,w,>2,write20
setwork20,m,m,>1113,setwork20
setwork20,*,*,>,setwork20
write20,*,0,<,run3

setwork21,w,w,>2,write21
setwork21,m,m,>1113,setwork21
setwork21,*,*,>,setwork21
write21,*,1,<,run3

setwork22,w,w,>2,write22
setwork22,m,m,>1113,setwork22
setwork22,*,*,>,setwork22
write22,*,2,<,run3

setwork23,w,w,>2,write23
setwork23,m,m,>1113,setwork23
setwork23,*,*,>,setwork23
write23,*,3,<,run3

setwork24,w,w,>2,write24
setwork24,m,m,>1113,setwork24
setwork24,*,*,>,setwork24
write24,*,4,<,run3

setwork25,w,w,>2,write25
setwork25,m,m,>1113,setwork25
setwork25,*,*,>,setwork25
write25,*,5,<,run3

setwork26,w,w,>2,write26
setwork26,m,m,>1113,setwork26
setwork26,*,*,>,setwork26
write26,*,6,<,run3

setwork27,w,w,>2,write27
setwork27,m,m,>1113,setwork27
setwork27,*,*,>,setwork27
write27,*,7,<,run3

setwork28,w,w,>2,write28
setwork28,m,m,>1113,setwork28
setwork28,*,*,>,setwork28
write28,*,8,<,run3

setwork29,w,w,>2,write29
setwork29,m,m,>1113,setwork29
setwork29,*,*,>,setwork29
write29,*,9,<,run3

setwork2A,w,w,>2,write2A
setwork2A,m,m,>1113,setwork2A
setwork2A,*,*,>,setwork2A
write2A,*,A,<,run3

setwork2B,w,w,>2,write2B
setwork2B,m,m,>1113,setwork2B
setwork2B,*,*,>,setwork2B
write2B,*,B,<,run3

setwork2C,w,w,>2,write2C
setwork2C,m,m,>1113,setwork2C
setwork2C,*,*,>,setwork2C
write2C,*,C,<,run3

setwork2D,w,w,>2,write2D
setwork2D,m,m,>1113,setwork2D
setwork2D,*,*,>,setwork2D
write2D,*,D,<,run3

setwork2E,w,w,>2,write2E
setwork2E,m,m,>1113,setwork2E
setwork2E,*,*,>,setwork2E
write2E,*,E,<,run3

setwork2F,w,w,>2,write2F
setwork2F,m,m,>1113,setwork2F
setwork2F,*,*,>,setwork2F
write2F,*,F,<,run3

run3,m,m,<,next3
run3,w,w,<1113,run3
run3,x,x,<1098,run3
run3,p,p,<66,run3
run3,s,s,<1025,run3
run3,*,*,<,run3

next3,*,*,>%,cpythis3

cpythis3,0,0,<%,setwork30
cpythis3,1,1,<%,setwork31
cpythis3,2,2,<%,setwork32
cpythis3,3,3,<%,setwork33
cpythis3,4,4,<%,setwork34
cpythis3,5,5,<%,setwork35
cpythis3,6,6,<%,setwork36
cpythis3,7,7,<%,setwork37
cpythis3,8,8,<%,setwork38
cpythis3,9,9,<%,setwork39
cpythis3,A,A,<%,setwork3A
cpythis3,B,B,<%,setwork3B
cpythis3,C,C,<%,setwork3C
cpythis3,D,D,<%,setwork3D
cpythis3,E,E,<%,setwork3E
cpythis3,F,F,<%,setwork3F

setwork30,w,w,>3,write30
setwork30,m,m,>1113,setwork30
setwork30,*,*,>,setwork30
write30,*,0,<,run4

setwork31,w,w,>3,write31
setwork31,m,m,>1113,setwork31
setwork31,*,*,>,setwork31
write31,*,1,<,run4

setwork32,w,w,>3,write32
setwork32,m,m,>1113,setwork32
setwork32,*,*,>,setwork32
write32,*,2,<,run4

setwork33,w,w,>3,write33
setwork33,m,m,>1113,setwork33
setwork33,*,*,>,setwork33
write33,*,3,<,run4

setwork34,w,w,>3,write34
setwork34,m,m,>1113,setwork34
setwork34,*,*,>,setwork34
write34,*,4,<,run4

setwork35,w,w,>3,write35
setwork35,m,m,>1113,setwork35
setwork35,*,*,>,setwork35
write35,*,5,<,run4

setwork36,w,w,>3,write36
setwork36,m,m,>1113,setwork36
setwork36,*,*,>,setwork36
write36,*,6,<,run4

setwork37,w,w,>3,write37
setwork37,m,m,>1113,setwork37
setwork37,*,*,>,setwork37
write37,*,7,<,run4

setwork38,w,w,>3,write38
setwork38,m,m,>1113,setwork38
setwork38,*,*,>,setwork38
write38,*,8,<,run4

setwork39,w,w,>3,write39
setwork39,m,m,>1113,setwork39
setwork39,*,*,>,setwork39
write39,*,9,<,run4

setwork3A,w,w,>3,write3A
setwork3A,m,m,>1113,setwork3A
setwork3A,*,*,>,setwork3A
write3A,*,A,<,run4

setwork3B,w,w,>3,write3B
setwork3B,m,m,>1113,setwork3B
setwork3B,*,*,>,setwork3B
write3B,*,B,<,run4

setwork3C,w,w,>3,write3C
setwork3C,m,m,>1113,setwork3C
setwork3C,*,*,>,setwork3C
write3C,*,C,<,run4

setwork3D,w,w,>3,write3D
setwork3D,m,m,>1113,setwork3D
setwork3D,*,*,>,setwork3D
write3D,*,D,<,run4

setwork3E,w,w,>3,write3E
setwork3E,m,m,>1113,setwork3E
setwork3E,*,*,>,setwork3E
write3E,*,E,<,run4

setwork3F,w,w,>3,write3F
setwork3F,m,m,>1113,setwork3F
setwork3F,*,*,>,setwork3F
write3F,*,F,<,run4

run4,m,m,-,next4
run4,w,w,<1113,run4
run4,x,x,<1098,run4
run4,p,p,<66,run4
run4,s,s,<1025,run4
run4,*,*,<,run4

next4,*,*,>%,cpythis4

cpythis4,0,0,<%,setwork40
cpythis4,1,1,<%,setwork41
cpythis4,2,2,<%,setwork42
cpythis4,3,3,<%,setwork43
cpythis4,4,4,<%,setwork44
cpythis4,5,5,<%,setwork45
cpythis4,6,6,<%,setwork46
cpythis4,7,7,<%,setwork47
cpythis4,8,8,<%,setwork48
cpythis4,9,9,<%,setwork49
cpythis4,A,A,<%,setwork4A
cpythis4,B,B,<%,setwork4B
cpythis4,C,C,<%,setwork4C
cpythis4,D,D,<%,setwork4D
cpythis4,E,E,<%,setwork4E
cpythis4,F,F,<%,setwork4F

setwork40,w,w,>4,write40
setwork40,m,m,>1113,setwork40
setwork40,*,*,>,setwork40
write40,*,0,<,end

setwork41,w,w,>4,write41
setwork41,m,m,>1113,setwork41
setwork41,*,*,>,setwork41
write41,*,1,<,end

setwork42,w,w,>4,write42
setwork42,m,m,>1113,setwork42
setwork42,*,*,>,setwork42
write42,*,2,<,end

setwork43,w,w,>4,write43
setwork43,m,m,>1113,setwork43
setwork43,*,*,>,setwork43
write43,*,3,<,end

setwork44,w,w,>4,write44
setwork44,m,m,>1113,setwork44
setwork44,*,*,>,setwork44
write44,*,4,<,end

setwork45,w,w,>4,write45
setwork45,m,m,>1113,setwork45
setwork45,*,*,>,setwork45
write45,*,5,<,end

setwork46,w,w,>4,write46
setwork46,m,m,>1113,setwork46
setwork46,*,*,>,setwork46
write46,*,6,<,end

setwork47,w,w,>4,write47
setwork47,m,m,>1113,setwork47
setwork47,*,*,>,setwork47
write47,*,7,<,end

setwork48,w,w,>4,write48
setwork48,m,m,>1113,setwork48
setwork48,*,*,>,setwork48
write48,*,8,<,end

setwork49,w,w,>4,write49
setwork49,m,m,>1113,setwork49
setwork49,*,*,>,setwork49
write49,*,9,<,end

setwork4A,w,w,>4,write4A
setwork4A,m,m,>1113,setwork4A
setwork4A,*,*,>,setwork4A
write4A,*,A,<,end

setwork4B,w,w,>4,write4B
setwork4B,m,m,>1113,setwork4B
setwork4B,*,*,>,setwork4B
write4B,*,B,<,end

setwork4C,w,w,>4,write4C
setwork4C,m,m,>1113,setwork4C
setwork4C,*,*,>,setwork4C
write4C,*,C,<,end

setwork4D,w,w,>4,write4D
setwork4D,m,m,>1113,setwork4D
setwork4D,*,*,>,setwork4D
write4D,*,D,<,end

setwork4E,w,w,>4,write4E
setwork4E,m,m,>1113,setwork4E
setwork4E,*,*,>,setwork4E
write4E,*,E,<,end

setwork4F,w,w,>4,write4F
setwork4F,m,m,>1113,setwork4F
setwork4F,*,*,>,setwork4F
write4F,*,F,<,end

end,*,*,-,!loadmem/copied
