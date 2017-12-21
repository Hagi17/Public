//check key for 26 characters and no double characters
//pointer to first place, before that there is a $

//example for %tmpl% usage

#include "checkFor.tm" AS checkA(A)
#include "checkFor.tm" AS checkB(B)
#include "checkFor.tm" AS checkC(C)
#include "checkFor.tm" AS checkD(D)
#include "checkFor.tm" AS checkE(E)
#include "checkFor.tm" AS checkF(F)
#include "checkFor.tm" AS checkG(G)
#include "checkFor.tm" AS checkH(H)
#include "checkFor.tm" AS checkI(I)
#include "checkFor.tm" AS checkJ(J)
#include "checkFor.tm" AS checkK(K)
#include "checkFor.tm" AS checkL(L)
#include "checkFor.tm" AS checkM(M)
#include "checkFor.tm" AS checkN(N)
#include "checkFor.tm" AS checkO(O)
#include "checkFor.tm" AS checkP(P)
#include "checkFor.tm" AS checkQ(Q)
#include "checkFor.tm" AS checkR(R)
#include "checkFor.tm" AS checkS(S)
#include "checkFor.tm" AS checkT(T)
#include "checkFor.tm" AS checkU(U)
#include "checkFor.tm" AS checkV(V)
#include "checkFor.tm" AS checkW(W)
#include "checkFor.tm" AS checkX(X)
#include "checkFor.tm" AS checkY(Y)
#include "checkFor.tm" AS checkZ(Z)

name: checkMonoKey
init: begin
accept: finish

begin,*,*,-,checkA/check
checkA/finish,*,*,-,checkB/check
checkB/finish,*,*,-,checkC/check
checkC/finish,*,*,-,checkD/check
checkD/finish,*,*,-,checkE/check
checkE/finish,*,*,-,checkF/check
checkF/finish,*,*,-,checkG/check
checkG/finish,*,*,-,checkH/check
checkH/finish,*,*,-,checkI/check
checkI/finish,*,*,-,checkJ/check
checkJ/finish,*,*,-,checkK/check
checkK/finish,*,*,-,checkL/check
checkL/finish,*,*,-,checkM/check
checkM/finish,*,*,-,checkN/check
checkN/finish,*,*,-,checkO/check
checkO/finish,*,*,-,checkP/check
checkP/finish,*,*,-,checkQ/check
checkQ/finish,*,*,-,checkR/check
checkR/finish,*,*,-,checkS/check
checkS/finish,*,*,-,checkT/check
checkT/finish,*,*,-,checkU/check
checkU/finish,*,*,-,checkV/check
checkV/finish,*,*,-,checkW/check
checkW/finish,*,*,-,checkX/check
checkX/finish,*,*,-,checkY/check
checkY/finish,*,*,-,checkZ/check
checkZ/finish,*,*,-,finish
