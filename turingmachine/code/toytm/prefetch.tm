//pointer is on 'd' part of command

#include "fetchReg.tm" AS fetchRegD(x)
#include "fetchReg.tm" AS fetchRegS(y)
#include "fetchReg.tm" AS fetchRegT(z)

name: prefetch
init: run
accept: end

run,*,*,<,check
check,0,0,-,!interpret/run
check,7,7,-,!interpret/run
check,8,8,-,!interpret/run
check,F,F,-,!interpret/run
check,*,*,>,fetchRegD/run

//after fetchReg pointer stands on copied value
fetchRegD/end,*,*,<,gos

gos,x,x,<2,fetchRegS/run 
gos,*,*,<,gos

fetchRegS/end,*,*,<,got
got,x,x,<,fetchRegT/run
got,*,*,<,got

fetchRegT/end,*,*,<,gocmd
gocmd,p,p,>,!interpret/run
gocmd,*,*,<,gocmd
