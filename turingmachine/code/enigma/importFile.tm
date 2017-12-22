#include "goNextRotor.tm" AS goNextRotorA
#include "goNextRotor.tm" AS goNextRotorB
#include "goNextRotor.tm" AS goNextRotorC
#include "goNextRotor.tm" AS goNextRotorD
#include "goNextRotor.tm" AS goNextRotorE
#include "goNextRotor.tm" AS goNextRotorF
#include "goNextRotor.tm" AS goNextRotorG
#include "goNextRotor.tm" AS goNextRotorH
#include "goNextRotor.tm" AS goNextRotorI
#include "goNextRotor.tm" AS goNextRotorJ
#include "goNextRotor.tm" AS goNextRotorK
#include "goNextRotor.tm" AS goNextRotorL
#include "goNextRotor.tm" AS goNextRotorM
#include "goNextRotor.tm" AS goNextRotorN
#include "goNextRotor.tm" AS goNextRotorO
#include "goNextRotor.tm" AS goNextRotorP
#include "goNextRotor.tm" AS goNextRotorQ
#include "goNextRotor.tm" AS goNextRotorR
#include "goNextRotor.tm" AS goNextRotorS
#include "goNextRotor.tm" AS goNextRotorT
#include "goNextRotor.tm" AS goNextRotorU
#include "goNextRotor.tm" AS goNextRotorV
#include "goNextRotor.tm" AS goNextRotorW
#include "goNextRotor.tm" AS goNextRotorX
#include "goNextRotor.tm" AS goNextRotorY
#include "goNextRotor.tm" AS goNextRotorZ

#include "gofind.tm" AS goFindA(A)
#include "gofind.tm" AS goFindB(B)
#include "gofind.tm" AS goFindC(C)
#include "gofind.tm" AS goFindD(D)
#include "gofind.tm" AS goFindE(E)
#include "gofind.tm" AS goFindF(F)
#include "gofind.tm" AS goFindG(G)
#include "gofind.tm" AS goFindH(H)
#include "gofind.tm" AS goFindI(I)
#include "gofind.tm" AS goFindJ(J)
#include "gofind.tm" AS goFindK(K)
#include "gofind.tm" AS goFindL(L)
#include "gofind.tm" AS goFindM(M)
#include "gofind.tm" AS goFindN(N)
#include "gofind.tm" AS goFindO(O)
#include "gofind.tm" AS goFindP(P)
#include "gofind.tm" AS goFindQ(Q)
#include "gofind.tm" AS goFindR(R)
#include "gofind.tm" AS goFindS(S)
#include "gofind.tm" AS goFindT(T)
#include "gofind.tm" AS goFindU(U)
#include "gofind.tm" AS goFindV(V)
#include "gofind.tm" AS goFindW(W)
#include "gofind.tm" AS goFindX(X)
#include "gofind.tm" AS goFindY(Y)
#include "gofind.tm" AS goFindZ(Z)


name: importFile
init: begin
accept: finish

!goNextRotorA/goEncrypt,*,*,-,!forwardEncrypt/readFind
!goNextRotorB/goEncrypt,*,*,>,!goNextRotorA/goEncrypt
!goNextRotorC/goEncrypt,*,*,>,!goNextRotorB/goEncrypt
!goNextRotorD/goEncrypt,*,*,>,!goNextRotorC/goEncrypt
!goNextRotorE/goEncrypt,*,*,>,!goNextRotorD/goEncrypt
!goNextRotorF/goEncrypt,*,*,>,!goNextRotorE/goEncrypt
!goNextRotorG/goEncrypt,*,*,>,!goNextRotorF/goEncrypt
!goNextRotorH/goEncrypt,*,*,>,!goNextRotorG/goEncrypt
!goNextRotorI/goEncrypt,*,*,>,!goNextRotorH/goEncrypt
!goNextRotorJ/goEncrypt,*,*,>,!goNextRotorI/goEncrypt
!goNextRotorK/goEncrypt,*,*,>,!goNextRotorJ/goEncrypt
!goNextRotorL/goEncrypt,*,*,>,!goNextRotorK/goEncrypt
!goNextRotorM/goEncrypt,*,*,>,!goNextRotorL/goEncrypt
!goNextRotorN/goEncrypt,*,*,>,!goNextRotorM/goEncrypt
!goNextRotorO/goEncrypt,*,*,>,!goNextRotorN/goEncrypt
!goNextRotorP/goEncrypt,*,*,>,!goNextRotorO/goEncrypt
!goNextRotorQ/goEncrypt,*,*,>,!goNextRotorP/goEncrypt
!goNextRotorR/goEncrypt,*,*,>,!goNextRotorQ/goEncrypt
!goNextRotorS/goEncrypt,*,*,>,!goNextRotorR/goEncrypt
!goNextRotorT/goEncrypt,*,*,>,!goNextRotorS/goEncrypt
!goNextRotorU/goEncrypt,*,*,>,!goNextRotorT/goEncrypt
!goNextRotorV/goEncrypt,*,*,>,!goNextRotorU/goEncrypt
!goNextRotorW/goEncrypt,*,*,>,!goNextRotorV/goEncrypt
!goNextRotorX/goEncrypt,*,*,>,!goNextRotorW/goEncrypt
!goNextRotorY/goEncrypt,*,*,>,!goNextRotorX/goEncrypt
!goNextRotorZ/goEncrypt,*,*,>,!goNextRotorY/goEncrypt

!goNextRotorA/goReverseEncrypt,*,*,-,!backwardEncrypt/begin
!goNextRotorB/goReverseEncrypt,*,*,>,!goNextRotorA/goReverseEncrypt
!goNextRotorC/goReverseEncrypt,*,*,>,!goNextRotorB/goReverseEncrypt
!goNextRotorD/goReverseEncrypt,*,*,>,!goNextRotorC/goReverseEncrypt
!goNextRotorE/goReverseEncrypt,*,*,>,!goNextRotorD/goReverseEncrypt
!goNextRotorF/goReverseEncrypt,*,*,>,!goNextRotorE/goReverseEncrypt
!goNextRotorG/goReverseEncrypt,*,*,>,!goNextRotorF/goReverseEncrypt
!goNextRotorH/goReverseEncrypt,*,*,>,!goNextRotorG/goReverseEncrypt
!goNextRotorI/goReverseEncrypt,*,*,>,!goNextRotorH/goReverseEncrypt
!goNextRotorJ/goReverseEncrypt,*,*,>,!goNextRotorI/goReverseEncrypt
!goNextRotorK/goReverseEncrypt,*,*,>,!goNextRotorJ/goReverseEncrypt
!goNextRotorL/goReverseEncrypt,*,*,>,!goNextRotorK/goReverseEncrypt
!goNextRotorM/goReverseEncrypt,*,*,>,!goNextRotorL/goReverseEncrypt
!goNextRotorN/goReverseEncrypt,*,*,>,!goNextRotorM/goReverseEncrypt
!goNextRotorO/goReverseEncrypt,*,*,>,!goNextRotorN/goReverseEncrypt
!goNextRotorP/goReverseEncrypt,*,*,>,!goNextRotorO/goReverseEncrypt
!goNextRotorQ/goReverseEncrypt,*,*,>,!goNextRotorP/goReverseEncrypt
!goNextRotorR/goReverseEncrypt,*,*,>,!goNextRotorQ/goReverseEncrypt
!goNextRotorS/goReverseEncrypt,*,*,>,!goNextRotorR/goReverseEncrypt
!goNextRotorT/goReverseEncrypt,*,*,>,!goNextRotorS/goReverseEncrypt
!goNextRotorU/goReverseEncrypt,*,*,>,!goNextRotorT/goReverseEncrypt
!goNextRotorV/goReverseEncrypt,*,*,>,!goNextRotorU/goReverseEncrypt
!goNextRotorW/goReverseEncrypt,*,*,>,!goNextRotorV/goReverseEncrypt
!goNextRotorX/goReverseEncrypt,*,*,>,!goNextRotorW/goReverseEncrypt
!goNextRotorY/goReverseEncrypt,*,*,>,!goNextRotorX/goReverseEncrypt
!goNextRotorZ/goReverseEncrypt,*,*,>,!goNextRotorY/goReverseEncrypt

!goNextRotorA/goEncryptl,*,*,<,!goNextRotorB/goEncryptl
!goNextRotorB/goEncryptl,*,*,<,!goNextRotorC/goEncryptl
!goNextRotorC/goEncryptl,*,*,<,!goNextRotorD/goEncryptl
!goNextRotorD/goEncryptl,*,*,<,!goNextRotorE/goEncryptl
!goNextRotorE/goEncryptl,*,*,<,!goNextRotorF/goEncryptl
!goNextRotorF/goEncryptl,*,*,<,!goNextRotorG/goEncryptl
!goNextRotorG/goEncryptl,*,*,<,!goNextRotorH/goEncryptl
!goNextRotorH/goEncryptl,*,*,<,!goNextRotorI/goEncryptl
!goNextRotorI/goEncryptl,*,*,<,!goNextRotorJ/goEncryptl
!goNextRotorJ/goEncryptl,*,*,<,!goNextRotorK/goEncryptl
!goNextRotorK/goEncryptl,*,*,<,!goNextRotorL/goEncryptl
!goNextRotorL/goEncryptl,*,*,<,!goNextRotorM/goEncryptl
!goNextRotorM/goEncryptl,*,*,<,!goNextRotorN/goEncryptl
!goNextRotorN/goEncryptl,*,*,<,!goNextRotorO/goEncryptl
!goNextRotorO/goEncryptl,*,*,<,!goNextRotorP/goEncryptl
!goNextRotorP/goEncryptl,*,*,<,!goNextRotorQ/goEncryptl
!goNextRotorQ/goEncryptl,*,*,<,!goNextRotorR/goEncryptl
!goNextRotorR/goEncryptl,*,*,<,!goNextRotorS/goEncryptl
!goNextRotorS/goEncryptl,*,*,<,!goNextRotorT/goEncryptl
!goNextRotorT/goEncryptl,*,*,<,!goNextRotorU/goEncryptl
!goNextRotorU/goEncryptl,*,*,<,!goNextRotorV/goEncryptl
!goNextRotorV/goEncryptl,*,*,<,!goNextRotorW/goEncryptl
!goNextRotorW/goEncryptl,*,*,<,!goNextRotorX/goEncryptl
!goNextRotorX/goEncryptl,*,*,<,!goNextRotorY/goEncryptl
!goNextRotorY/goEncryptl,*,*,<,!goNextRotorZ/goEncryptl
!goNextRotorZ/goEncryptl,*,*,-,!backwardEncrypt/readFind

!goNextRotorA/goset,&,a,-,!forwardEncrypt/finish
!goNextRotorB/goset,&,b,-,!forwardEncrypt/finish
!goNextRotorC/goset,&,c,-,!forwardEncrypt/finish
!goNextRotorD/goset,&,d,-,!forwardEncrypt/finish
!goNextRotorE/goset,&,e,-,!forwardEncrypt/finish
!goNextRotorF/goset,&,f,-,!forwardEncrypt/finish
!goNextRotorG/goset,&,g,-,!forwardEncrypt/finish
!goNextRotorH/goset,&,h,-,!forwardEncrypt/finish
!goNextRotorI/goset,&,i,-,!forwardEncrypt/finish
!goNextRotorJ/goset,&,j,-,!forwardEncrypt/finish
!goNextRotorK/goset,&,k,-,!forwardEncrypt/finish
!goNextRotorL/goset,&,l,-,!forwardEncrypt/finish
!goNextRotorM/goset,&,m,-,!forwardEncrypt/finish
!goNextRotorN/goset,&,n,-,!forwardEncrypt/finish
!goNextRotorO/goset,&,o,-,!forwardEncrypt/finish
!goNextRotorP/goset,&,p,-,!forwardEncrypt/finish
!goNextRotorQ/goset,&,q,-,!forwardEncrypt/finish
!goNextRotorR/goset,&,r,-,!forwardEncrypt/finish
!goNextRotorS/goset,&,s,-,!forwardEncrypt/finish
!goNextRotorT/goset,&,t,-,!forwardEncrypt/finish
!goNextRotorU/goset,&,u,-,!forwardEncrypt/finish
!goNextRotorV/goset,&,v,-,!forwardEncrypt/finish
!goNextRotorW/goset,&,w,-,!forwardEncrypt/finish
!goNextRotorX/goset,&,x,-,!forwardEncrypt/finish
!goNextRotorY/goset,&,y,-,!forwardEncrypt/finish
!goNextRotorZ/goset,&,z,-,!forwardEncrypt/finish
