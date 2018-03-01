name: logics
init: run
accept: end

and,1,0,<,and
and,0,0,<17,set0
and,_,0,<17,set0
and,+,0,<17,end
set0,1,0,>16,and
set0,0,0,>16,and
set0,_,0,>16,and

xor,1,0,<17,tip
xor,0,0,<,xor
xor,_,0,<,xor
xor,+,0,<17,end
tip,1,0,>16,xor
tip,0,1,>16,xor
tip,_,1,>16,xor

//check first for 0
shiftleft,*,*,>,setvl
setvl,*,v,<,decl
decl,1,0,<,goshiftl
decl,0,1,<,decl
decl,_,1,<,decl
decl,+,0,>,clear

goshiftl,+,+,<,shl
goshiftl,*,*,<,goshiftl

clear,1,0,>,clear
clear,v,0,<34,end

shl,0,0,<,shl0
shl,_,0,<,shl0
shl,1,0,<,shl1
shl0,0,0,<,shl0
shl0,1,0,<,shl1
shl0,_,0,<,shl0
shl1,0,1,<,shl0
shl1,_,1,<,shl0
shl1,1,1,<,shl1
shl0,w,w,>,godecl
shl1,w,w,>,godecl
godecl,v,v,<,decl
godecl,*,*,>,godecl

//check first for 0
shiftright,*,*,>,setvr
setvr,*,v,<,decr
decr,1,0,<,goshiftr
decr,0,1,<,decr
decr,_,1,<,decr
decr,+,0,>,clear

goshiftr,w,w,>,shr
goshiftr,+,+,<17,goshiftr
goshiftr,*,*,<,goshiftr

shr,0,0,>,shr0
shr,_,0,>,shr0
shr,1,1,>,shr1
shr0,0,0,>,shr0
shr0,1,0,>,shr1
shr0,_,0,>,shr0
shr1,0,1,>,shr0
shr1,_,1,>,shr0
shr1,1,1,>,shr1
shr0,+,+,>,godecr
shr1,+,+,>,godecr
godecr,v,v,<,decr
godecr,*,*,>,godecr