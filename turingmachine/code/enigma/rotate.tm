//rotate "Walze" to the left
// a / indicates anomaly, so rotate it also

//start from the left, lshift everything then place the first one at the back (if / is front, lshift twice)

//$A-Z

#include "lshift.tm" AS shiftA(A)
#include "lshift.tm" AS shiftB(B)
#include "lshift.tm" AS shiftC(C)
#include "lshift.tm" AS shiftD(D)
#include "lshift.tm" AS shiftE(E)
#include "lshift.tm" AS shiftF(F)
#include "lshift.tm" AS shiftG(G)
#include "lshift.tm" AS shiftH(H)
#include "lshift.tm" AS shiftI(I)
#include "lshift.tm" AS shiftJ(J)
#include "lshift.tm" AS shiftK(K)
#include "lshift.tm" AS shiftL(L)
#include "lshift.tm" AS shiftM(M)
#include "lshift.tm" AS shiftN(N)
#include "lshift.tm" AS shiftO(O)
#include "lshift.tm" AS shiftP(P)
#include "lshift.tm" AS shiftQ(Q)
#include "lshift.tm" AS shiftR(R)
#include "lshift.tm" AS shiftS(S)
#include "lshift.tm" AS shiftT(T)
#include "lshift.tm" AS shiftU(U)
#include "lshift.tm" AS shiftV(V)
#include "lshift.tm" AS shiftW(W)
#include "lshift.tm" AS shiftX(X)
#include "lshift.tm" AS shiftY(Y)
#include "lshift.tm" AS shiftZ(Z)
#include "lshift.tm" AS shiftAnom(/)

#include "setLast.tm" AS setLastA(A)
#include "setLast.tm" AS setLastB(B)
#include "setLast.tm" AS setLastC(C)
#include "setLast.tm" AS setLastD(D)
#include "setLast.tm" AS setLastE(E)
#include "setLast.tm" AS setLastF(F)
#include "setLast.tm" AS setLastG(G)
#include "setLast.tm" AS setLastH(H)
#include "setLast.tm" AS setLastI(I)
#include "setLast.tm" AS setLastJ(J)
#include "setLast.tm" AS setLastK(K)
#include "setLast.tm" AS setLastL(L)
#include "setLast.tm" AS setLastM(M)
#include "setLast.tm" AS setLastN(N)
#include "setLast.tm" AS setLastO(O)
#include "setLast.tm" AS setLastP(P)
#include "setLast.tm" AS setLastQ(Q)
#include "setLast.tm" AS setLastR(R)
#include "setLast.tm" AS setLastS(S)
#include "setLast.tm" AS setLastT(T)
#include "setLast.tm" AS setLastU(U)
#include "setLast.tm" AS setLastV(V)
#include "setLast.tm" AS setLastW(W)
#include "setLast.tm" AS setLastX(X)
#include "setLast.tm" AS setLastY(Y)
#include "setLast.tm" AS setLastZ(Z)
#include "setLast.tm" AS setLastAnom(/)


name: rotate
init: begin
accept: finish

// go all way back to the next Block ($ or %)
begin,$,$,<,shiftA/first
begin,%,%,<,shiftA/first
begin,?,?,<,shiftA/first
begin,_,_,<,shiftA/first
begin,*,*,>,begin

// shift finished, setLast Character
shift/finish,*,*,-,setLastA/read

// last Character set, check if it was an /, then finished,
// else check if a / is at front, then we need to shift again
setLast/finish,/,/,-,finish
setLast/finish,*,*,<,checkAnom
checkAnom,$,$,>,check
checkAnom,*,*,<,checkAnom
check,/,/,>,begin
check,*,*,>,gofinish
gofinish,_,_,<,finish
gofinish,$,$,<,finish
gofinish,%,%,<,finish
gofinish,?,?,<,finish
gofinish,*,*,>,gofinish