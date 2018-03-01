//check the input tape and prepare it for work
//Nibble-Based (tape-values: 0-9,A-F)
//m : Memory indicator
//s : Statusflag indicator (counter)
//r : Register indicator
//p : CPU (command Byte) indicator
//w : working space indicator
//x : Rd
//y : Rs
//z : Rt
//m....  s..r....  p....x....y....z....w..  
//m | memory (256x 2Byte = 4Nibble) | s | cmdcounter (1Byte) | r |
//register (16x 2Byte) | p (cpu ind.) | cpu (2 Byte) | x |
//registerd (2Byt) | y | register s (2Byte) | z | register t (2Byte) | w | working space

name: boot
init: load
accept: finish

load,m,m,>1025,statusflag
load,_,m,>1025,statusflag
load,*,*,<,load

statusflag,*,s,<,prepmem

prepmem,_,0,<,prepmem
prepmem,s,0,<,prepmem
prepmem,m,m,>1026,prepcnt
prepmem,a,A,<,prepmem
prepmem,b,B,<,prepmem
prepmem,c,C,<,prepmem
prepmem,d,D,<,prepmem
prepmem,e,E,<,prepmem
prepmem,f,F,<,prepmem
prepmem,*,*,<,prepmem

prepcnt,r,1,>,prepcnt1
prepcnt,_,1,>,prepcnt1
prepcnt,*,*,>,prepcnt1

prepcnt1,r,0,>,prepcnt2
prepcnt1,_,0,>,prepcnt2
prepcnt1,*,*,>,prepcnt2

prepcnt2,*,r,>,prepreg
//16x 2 Byte = 64 Nibble
prepreg,*,0,>,prepreg1
prepreg1,*,0,>,prepreg2
prepreg2,*,0,>,prepreg3
prepreg3,*,0,>,prepreg4
prepreg4,*,0,>,prepreg5
prepreg5,*,0,>,prepreg6
prepreg6,*,0,>,prepreg7
prepreg7,*,0,>,prepreg8
prepreg8,*,0,>,prepreg9
prepreg9,*,0,>,prepreg10
prepreg10,*,0,>,prepreg11
prepreg11,*,0,>,prepreg12
prepreg12,*,0,>,prepreg13
prepreg13,*,0,>,prepreg14
prepreg14,*,0,>,prepreg15
prepreg15,*,0,>,prepreg16
prepreg16,*,0,>,prepreg17
prepreg17,*,0,>,prepreg18
prepreg18,*,0,>,prepreg19
prepreg19,*,0,>,prepreg20
prepreg20,*,0,>,prepreg21
prepreg21,*,0,>,prepreg22
prepreg22,*,0,>,prepreg23
prepreg23,*,0,>,prepreg24
prepreg24,*,0,>,prepreg25
prepreg25,*,0,>,prepreg26
prepreg26,*,0,>,prepreg27
prepreg27,*,0,>,prepreg28
prepreg28,*,0,>,prepreg29
prepreg29,*,0,>,prepreg30
prepreg30,*,0,>,prepreg31
prepreg31,*,0,>,prepreg32
prepreg32,*,0,>,prepreg33
prepreg33,*,0,>,prepreg34
prepreg34,*,0,>,prepreg35
prepreg35,*,0,>,prepreg36
prepreg36,*,0,>,prepreg37
prepreg37,*,0,>,prepreg38
prepreg38,*,0,>,prepreg39
prepreg39,*,0,>,prepreg40
prepreg40,*,0,>,prepreg41
prepreg41,*,0,>,prepreg42
prepreg42,*,0,>,prepreg43
prepreg43,*,0,>,prepreg44
prepreg44,*,0,>,prepreg45
prepreg45,*,0,>,prepreg46
prepreg46,*,0,>,prepreg47
prepreg47,*,0,>,prepreg48
prepreg48,*,0,>,prepreg49
prepreg49,*,0,>,prepreg50
prepreg50,*,0,>,prepreg51
prepreg51,*,0,>,prepreg52
prepreg52,*,0,>,prepreg53
prepreg53,*,0,>,prepreg54
prepreg54,*,0,>,prepreg55
prepreg55,*,0,>,prepreg56
prepreg56,*,0,>,prepreg57
prepreg57,*,0,>,prepreg58
prepreg58,*,0,>,prepreg59
prepreg59,*,0,>,prepreg60
prepreg60,*,0,>,prepreg61
prepreg61,*,0,>,prepreg62
prepreg62,*,0,>,prepreg63
prepreg63,*,0,>,prepreg64
prepreg64,*,p,>,prepcpu
//2 Byte Command = 4 Nibble
prepcpu,*,0,>,prepcpu1
prepcpu1,*,0,>,prepcpu2
prepcpu2,*,0,>,prepcpu3
prepcpu3,*,0,>,prepcpu4
prepcpu4,*,x,>,prepregd
//2 Byte Reg. D = 4 Nibble
prepregd,*,0,>,prepregd1
prepregd1,*,0,>,prepregd2
prepregd2,*,0,>,prepregd3
prepregd3,*,0,>,prepregd4
prepregd4,*,y,>,prepregs
//2 Byte Reg. S = 4 Nibble
prepregs,*,0,>,prepregs1
prepregs1,*,0,>,prepregs2
prepregs2,*,0,>,prepregs3
prepregs3,*,0,>,prepregs4
prepregs4,*,z,>,prepregt
//2 Byte Reg. T = 4 Nibble
prepregt,*,0,>,prepregt1
prepregt1,*,0,>,prepregt2
prepregt2,*,0,>,prepregt3
prepregt3,*,0,>,prepregt4
prepregt4,*,w,<88,gotocnt
//set pointer on the counter
gotocnt,s,s,>2,finish
gotocnt,*,*,<,gotocnt

//gotocnt,s,s,>,onestep
//onestep,*,*,>,finish
