#include "copyToCount.tm"
#include "storeInReg.tm"

name: interpret
init: run
accept: end

run,0,0,-,!halt
//0x01: add Rs+Rt into R[d]
run,1,1,>,!calculus/run
//0x02: sub Rs-Rt into R[d]
run,2,2,>,!calculus/run
//0x03: and Rs&Rt into R[d]
run,3,3,>,!calculus/run
//0x04: xor Rs x Rt into R[d]
run,4,4,>,!calculus/run
//0x05: shiftleft Rs << Rt into R[d]
run,5,5,>,!calculus/run
//0x06: shiftright Rs >> Rt into R[d]
run,6,6,>,!calculus/run
//0x07: load addr -> R[d]
run,7,7,>2,!loaddir/run
//8: M[addr] -> R[d]
//8 load : copy Memory[addr] to working space, then copy working space to register [d], then clear working space
run,8,8,>,!loadmem/run
//9 store: copy Rd to Memory [addr]
run,9,9,>,!store/run
//A: M[Rt] -> R[d]
//A load indirect : copy Memory[Rt] to working space, then copy working space to register [d], then clear working space
run,A,A,>,!loadindir/run
//B store indirect : copy Rd to Memory [Rt]
run,B,B,>,!storeindir/run
//C branch zero : if Rd is 0, copy addr to the counter
run,C,C,>,!branchzero/run
//D branch positive : if Rd > 0, copy addr to the counter
run,D,D,>,!branchpos/run
//E jump register : copy Rd to the counter
run,E,E,>,!jumpreg/run
//F jump and link : copy the counter to Register [d] and copy addr to the counter
run,F,F,>,!jumplink/run


!store/end,*,*,<,gorun2

!branchzero/end,*,*,-,!run
!branchpos/end,*,*,-,!run

!copyToCount/end,*,*,-,!run
//!jumpreg/end,*,*,-,!run
//!jumplink/end,*,*,-,!run
!storeInReg/end,*,*,<,gorun

//gorun: pointer is in register
gorun,r,r,<,!run
gorun,*,*,<,gorun
//gorun2: pointer is in memory
gorun2,r,r,<,!run
gorun2,m,m,>1028,gorun2
gorun2,*,*,>,gorun2