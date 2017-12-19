//check key for 26 characters and no double characters
//pointer to first place, before that there is a $

//no correction for double characters! (needs to implemented, quite complex)

#include "lshiftAZ.tm" AS lshA
#include "lshiftAZ.tm" AS lshB
#include "lshiftAZ.tm" AS lshC
#include "lshiftAZ.tm" AS lshD
#include "lshiftAZ.tm" AS lshE
#include "lshiftAZ.tm" AS lshF
#include "lshiftAZ.tm" AS lshG
#include "lshiftAZ.tm" AS lshH
#include "lshiftAZ.tm" AS lshI
#include "lshiftAZ.tm" AS lshJ
#include "lshiftAZ.tm" AS lshK
#include "lshiftAZ.tm" AS lshL
#include "lshiftAZ.tm" AS lshM
#include "lshiftAZ.tm" AS lshN
#include "lshiftAZ.tm" AS lshO
#include "lshiftAZ.tm" AS lshP
#include "lshiftAZ.tm" AS lshQ
#include "lshiftAZ.tm" AS lshR
#include "lshiftAZ.tm" AS lshS
#include "lshiftAZ.tm" AS lshT
#include "lshiftAZ.tm" AS lshU
#include "lshiftAZ.tm" AS lshV
#include "lshiftAZ.tm" AS lshW
#include "lshiftAZ.tm" AS lshX
#include "lshiftAZ.tm" AS lshY
#include "lshiftAZ.tm" AS lshZ


name: checkMonoKey
init: begin
accept: finish

begin,A,A,>,checkDoubleA
begin,a,A,>,checkDoubleA
begin,_,A,<,doneA
begin,*,*,>,begin

doneA,_,$,>,checkForB
doneA,$,$,>,checkForB
doneA,*,*,<,doneA

checkDoubleA,A,_,>,lshA/begin
checkDoubleA,a,_,>,lshA/begin
checkDoubleA,_,_,<,doneA
checkDoubleA,*,*,>,checkDoubleA

lshA/finish,*,*,<,recheckA
recheckA,$,$,>,begin
recheckA,*,*,<,recheckA

checkForB,B,B,>,checkDoubleB
checkForB,b,B,>,checkDoubleB
checkForB,_,B,<,doneB
checkForB,*,*,>,checkForB

doneB,_,$,>,checkForC
doneB,$,$,>,checkForC
doneB,*,*,<,doneB

checkDoubleB,B,_,>,lshB/begin
checkDoubleB,b,_,>,lshB/begin
checkDoubleB,_,_,<,doneB
checkDoubleB,*,*,>,checkDoubleB

lshB/finish,*,*,<,recheckB
recheckB,$,$,>,checkForB
recheckB,*,*,<,recheckB

checkForC,C,C,>,checkDoubleC
checkForC,c,C,>,checkDoubleC
checkForC,_,C,<,doneC
checkForC,*,*,>,checkForC

doneC,_,$,>,checkForD
doneC,$,$,>,checkForD
doneC,*,*,<,doneC

checkDoubleC,C,_,>,lshC/begin
checkDoubleC,c,_,>,lshC/begin
checkDoubleC,_,_,<,doneC
checkDoubleC,*,*,>,checkDoubleC

lshC/finish,*,*,<,recheckC
recheckC,$,$,>,checkForC
recheckC,*,*,<,recheckC

checkForD,D,D,>,checkDoubleD
checkForD,d,D,>,checkDoubleD
checkForD,_,D,<,doneD
checkForD,*,*,>,checkForD

doneD,_,$,>,checkForE
doneD,$,$,>,checkForE
doneD,*,*,<,doneD

checkDoubleD,D,_,>,lshD/begin
checkDoubleD,d,_,>,lshD/begin
checkDoubleD,_,_,<,doneD
checkDoubleD,*,*,>,checkDoubleD

lshD/finish,*,*,<,recheckD
recheckD,$,$,>,checkForD
recheckD,*,*,<,recheckD

checkForE,E,E,>,checkDoubleE
checkForE,e,E,>,checkDoubleE
checkForE,_,E,<,doneE
checkForE,*,*,>,checkForE

doneE,_,$,>,checkForF
doneE,$,$,>,checkForF
doneE,*,*,<,doneE

checkDoubleE,E,_,>,lshE/begin
checkDoubleE,e,_,>,lshE/begin
checkDoubleE,_,_,<,doneE
checkDoubleE,*,*,>,checkDoubleE

lshE/finish,*,*,<,recheckE
recheckE,$,$,>,checkForE
recheckE,*,*,<,recheckE

checkForF,F,F,>,checkDoubleF
checkForF,f,F,>,checkDoubleF
checkForF,_,F,<,doneF
checkForF,*,*,>,checkForF

doneF,_,$,>,checkForG
doneF,$,$,>,checkForG
doneF,*,*,<,doneF

checkDoubleF,F,_,>,lshF/begin
checkDoubleF,f,_,>,lshF/begin
checkDoubleF,_,_,<,doneF
checkDoubleF,*,*,>,checkDoubleF

lshF/finish,*,*,<,recheckF
recheckF,$,$,>,checkForF
recheckF,*,*,<,recheckF

checkForG,G,G,>,checkDoubleG
checkForG,g,G,>,checkDoubleG
checkForG,_,G,<,doneG
checkForG,*,*,>,checkForG

doneG,_,$,>,checkForH
doneG,$,$,>,checkForH
doneG,*,*,<,doneG

checkDoubleG,G,_,>,lshG/begin
checkDoubleG,g,_,>,lshG/begin
checkDoubleG,_,_,<,doneG
checkDoubleG,*,*,>,checkDoubleG

lshG/finish,*,*,<,recheckG
recheckG,$,$,>,checkForG
recheckG,*,*,<,recheckG

checkForH,H,H,>,checkDoubleH
checkForH,h,H,>,checkDoubleH
checkForH,_,H,<,doneH
checkForH,*,*,>,checkForH

doneH,_,$,>,checkForI
doneH,$,$,>,checkForI
doneH,*,*,<,doneH

checkDoubleH,H,_,>,lshH/begin
checkDoubleH,h,_,>,lshH/begin
checkDoubleH,_,_,<,doneH
checkDoubleH,*,*,>,checkDoubleH

lshH/finish,*,*,<,recheckH
recheckH,$,$,>,checkForH
recheckH,*,*,<,recheckH

checkForI,I,I,>,checkDoubleI
checkForI,i,I,>,checkDoubleI
checkForI,_,I,<,doneI
checkForI,*,*,>,checkForI

doneI,_,$,>,checkForJ
doneI,$,$,>,checkForJ
doneI,*,*,<,doneI

checkDoubleI,I,_,>,lshI/begin
checkDoubleI,i,_,>,lshI/begin
checkDoubleI,_,_,<,doneI
checkDoubleI,*,*,>,checkDoubleI

lshI/finish,*,*,<,recheckI
recheckI,$,$,>,checkForI
recheckI,*,*,<,recheckI

checkForJ,J,J,>,checkDoubleJ
checkForJ,j,J,>,checkDoubleJ
checkForJ,_,J,<,doneJ
checkForJ,*,*,>,checkForJ

doneJ,_,$,>,checkForK
doneJ,$,$,>,checkForK
doneJ,*,*,<,doneJ

checkDoubleJ,J,_,>,lshJ/begin
checkDoubleJ,j,_,>,lshJ/begin
checkDoubleJ,_,_,<,doneJ
checkDoubleJ,*,*,>,checkDoubleJ

lshJ/finish,*,*,<,recheckJ
recheckJ,$,$,>,checkForJ
recheckJ,*,*,<,recheckJ

checkForK,K,K,>,checkDoubleK
checkForK,k,K,>,checkDoubleK
checkForK,_,K,<,doneK
checkForK,*,*,>,checkForK

doneK,_,$,>,checkForL
doneK,$,$,>,checkForL
doneK,*,*,<,doneK

checkDoubleK,K,_,>,lshK/begin
checkDoubleK,k,_,>,lshK/begin
checkDoubleK,_,_,<,doneK
checkDoubleK,*,*,>,checkDoubleK

lshK/finish,*,*,<,recheckK
recheckK,$,$,>,checkForK
recheckK,*,*,<,recheckK

checkForL,L,L,>,checkDoubleL
checkForL,l,L,>,checkDoubleL
checkForL,_,L,<,doneL
checkForL,*,*,>,checkForL

doneL,_,$,>,checkForM
doneL,$,$,>,checkForM
doneL,*,*,<,doneL

checkDoubleL,L,_,>,lshL/begin
checkDoubleL,l,_,>,lshL/begin
checkDoubleL,_,_,<,doneL
checkDoubleL,*,*,>,checkDoubleL

lshL/finish,*,*,<,recheckL
recheckL,$,$,>,checkForL
recheckL,*,*,<,recheckL

checkForM,M,M,>,checkDoubleM
checkForM,m,M,>,checkDoubleM
checkForM,_,M,<,doneM
checkForM,*,*,>,checkForM

doneM,_,$,>,checkForN
doneM,$,$,>,checkForN
doneM,*,*,<,doneM

checkDoubleM,M,_,>,lshM/begin
checkDoubleM,m,_,>,lshM/begin
checkDoubleM,_,_,<,doneM
checkDoubleM,*,*,>,checkDoubleM

lshM/finish,*,*,<,recheckM
recheckM,$,$,>,checkForM
recheckM,*,*,<,recheckM

checkForN,N,N,>,checkDoubleN
checkForN,n,N,>,checkDoubleN
checkForN,_,N,<,doneN
checkForN,*,*,>,checkForN

doneN,_,$,>,checkForO
doneN,$,$,>,checkForO
doneN,*,*,<,doneN

checkDoubleN,N,_,>,lshN/begin
checkDoubleN,n,_,>,lshN/begin
checkDoubleN,_,_,<,doneN
checkDoubleN,*,*,>,checkDoubleN

lshN/finish,*,*,<,recheckN
recheckN,$,$,>,checkForN
recheckN,*,*,<,recheckN

checkForO,O,O,>,checkDoubleO
checkForO,o,O,>,checkDoubleO
checkForO,_,O,<,doneO
checkForO,*,*,>,checkForO

doneO,_,$,>,checkForP
doneO,$,$,>,checkForP
doneO,*,*,<,doneO

checkDoubleO,O,_,>,lshO/begin
checkDoubleO,o,_,>,lshO/begin
checkDoubleO,_,_,<,doneO
checkDoubleO,*,*,>,checkDoubleO

lshO/finish,*,*,<,recheckO
recheckO,$,$,>,checkForO
recheckO,*,*,<,recheckO

checkForP,P,P,>,checkDoubleP
checkForP,p,P,>,checkDoubleP
checkForP,_,P,<,doneP
checkForP,*,*,>,checkForP

doneP,_,$,>,checkForQ
doneP,$,$,>,checkForQ
doneP,*,*,<,doneP

checkDoubleP,P,_,>,lshP/begin
checkDoubleP,p,_,>,lshP/begin
checkDoubleP,_,_,<,doneP
checkDoubleP,*,*,>,checkDoubleP

lshP/finish,*,*,<,recheckP
recheckP,$,$,>,checkForP
recheckP,*,*,<,recheckP

checkForQ,Q,Q,>,checkDoubleQ
checkForQ,q,Q,>,checkDoubleQ
checkForQ,_,Q,<,doneQ
checkForQ,*,*,>,checkForQ

doneQ,_,$,>,checkForR
doneQ,$,$,>,checkForR
doneQ,*,*,<,doneQ

checkDoubleQ,Q,_,>,lshQ/begin
checkDoubleQ,q,_,>,lshQ/begin
checkDoubleQ,_,_,<,doneQ
checkDoubleQ,*,*,>,checkDoubleQ

lshQ/finish,*,*,<,recheckQ
recheckQ,$,$,>,checkForQ
recheckQ,*,*,<,recheckQ

checkForR,R,R,>,checkDoubleR
checkForR,r,R,>,checkDoubleR
checkForR,_,R,<,doneR
checkForR,*,*,>,checkForR

doneR,_,$,>,checkForS
doneR,$,$,>,checkForS
doneR,*,*,<,doneR

checkDoubleR,R,_,>,lshR/begin
checkDoubleR,r,_,>,lshR/begin
checkDoubleR,_,_,<,doneR
checkDoubleR,*,*,>,checkDoubleR
lshR/finish,*,*,<,recheckR
recheckR,$,$,>,checkForR
recheckR,*,*,<,recheckR

checkForS,S,S,>,checkDoubleS
checkForS,s,S,>,checkDoubleS
checkForS,_,S,<,doneS
checkForS,*,*,>,checkForS

doneS,_,$,>,checkForT
doneS,$,$,>,checkForT
doneS,*,*,<,doneS

checkDoubleS,S,_,>,lshS/begin
checkDoubleS,s,_,>,lshS/begin
checkDoubleS,_,_,<,doneS
checkDoubleS,*,*,>,checkDoubleS
lshS/finish,*,*,<,recheckS
recheckS,$,$,>,checkForS
recheckS,*,*,<,recheckS

checkForT,T,T,>,checkDoubleT
checkForT,t,T,>,checkDoubleT
checkForT,_,T,<,doneT
checkForT,*,*,>,checkForT

doneT,_,$,>,checkForU
doneT,$,$,>,checkForU
doneT,*,*,<,doneT

checkDoubleT,T,_,>,lshT/begin
checkDoubleT,t,_,>,lshT/begin
checkDoubleT,_,_,<,doneT
checkDoubleT,*,*,>,checkDoubleT

lshT/finish,*,*,<,recheckT
recheckT,$,$,>,checkForT
recheckT,*,*,<,recheckT

checkForU,U,U,>,checkDoubleU
checkForU,u,U,>,checkDoubleU
checkForU,_,U,<,doneU
checkForU,*,*,>,checkForU

doneU,_,$,>,checkForV
doneU,$,$,>,checkForV
doneU,*,*,<,doneU

checkDoubleU,U,_,>,lshU/begin
checkDoubleU,u,_,>,lshU/begin
checkDoubleU,_,_,<,doneU
checkDoubleU,*,*,>,checkDoubleU

lshU/finish,*,*,<,recheckU
recheckU,$,$,>,checkForU
recheckU,*,*,<,recheckU

checkForV,V,V,>,checkDoubleV
checkForV,v,V,>,checkDoubleV
checkForV,_,V,<,doneV
checkForV,*,*,>,checkForV

doneV,_,$,>,checkForW
doneV,$,$,>,checkForW
doneV,*,*,<,doneV

checkDoubleV,V,_,>,lshV/begin
checkDoubleV,v,_,>,lshV/begin
checkDoubleV,_,_,<,doneV
checkDoubleV,*,*,>,checkDoubleV

lshV/finish,*,*,<,recheckV
recheckV,$,$,>,checkForV
recheckV,*,*,<,recheckV

checkForW,W,W,>,checkDoubleW
checkForW,w,W,>,checkDoubleW
checkForW,_,W,<,doneW
checkForW,*,*,>,checkForW

doneW,_,$,>,checkForX
doneW,$,$,>,checkForX
doneW,*,*,<,doneW

checkDoubleW,W,_,>,lshW/begin
checkDoubleW,w,_,>,lshW/begin
checkDoubleW,_,_,<,doneW
checkDoubleW,*,*,>,checkDoubleW

lshW/finish,*,*,<,recheckW
recheckW,$,$,>,checkForW
recheckW,*,*,<,recheckW

checkForX,X,X,>,checkDoubleX
checkForX,x,X,>,checkDoubleX
checkForX,_,X,<,doneX
checkForX,*,*,>,checkForX

doneX,_,$,>,checkForY
doneX,$,$,>,checkForY
doneX,*,*,<,doneX

checkDoubleX,X,_,>,lshX/begin
checkDoubleX,x,_,>,lshX/begin
checkDoubleX,_,_,<,doneX
checkDoubleX,*,*,>,checkDoubleX

lshX/finish,*,*,<,recheckX
recheckX,$,$,>,checkForX
recheckX,*,*,<,recheckX

checkForY,Y,Y,>,checkDoubleY
checkForY,y,Y,>,checkDoubleY
checkForY,_,Y,<,doneY
checkForY,*,*,>,checkForY

doneY,_,$,>,checkForZ
doneY,$,$,>,checkForZ
doneY,*,*,<,doneY

checkDoubleY,Y,_,>,lshY/begin
checkDoubleY,y,_,>,lshY/begin
checkDoubleY,_,_,<,doneY
checkDoubleY,*,*,>,checkDoubleY

lshY/finish,*,*,<,recheckY
recheckY,$,$,>,checkForY
recheckY,*,*,<,recheckY

checkForZ,Z,Z,>,checkDoubleZ
checkForZ,z,Z,>,checkDoubleZ
checkForZ,_,Z,<,doneZ
checkForZ,*,*,>,checkForZ

doneZ,_,$,>,finish
doneZ,$,$,>,finish
doneZ,*,*,<,doneZ

checkDoubleZ,Z,_,>,lshZ/begin
checkDoubleZ,z,_,>,lshZ/begin
checkDoubleZ,_,_,<,doneZ
checkDoubleZ,*,*,>,checkDoubleZ

lshZ/finish,*,*,<,recheckZ
recheckZ,$,$,>,checkForZ
recheckZ,*,*,<,recheckZ