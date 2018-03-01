#include "preparecalc.tm"
#include "convback.tm"
#include "math.tm"
#include "logics.tm"

name: calculus
init: run
accept: end

run,*,*,-,preparecalc/run
preparecalc/end,*,*,<,goswitch

goswitch,p,p,>,switch
goswitch,+,+,<17,goswitch
goswitch,w,w,<20,goswitch
goswitch,*,*,<,goswitch

switch,1,1,>52,math/addition
switch,2,2,>52,math/subtraction
switch,3,3,>52,logics/and
switch,4,4,>52,logics/xor
switch,5,5,>52,logics/shiftleft
switch,6,6,>52,logics/shiftright

math/end,*,*,-,convback/run
logics/end,*,*,-,convback/run