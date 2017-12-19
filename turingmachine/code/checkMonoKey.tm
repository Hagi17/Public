//check key for 26 characters and no double characters
//pointer to first place, before that there is a $

//no correction for double characters! (needs to implemented, quite complex)

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

checkDoubleA,A,_,>,error_invalidkey
checkDoubleA,a,_,>,error_invalidkey
checkDoubleA,_,_,<,doneA
checkDoubleA,*,*,>,checkDoubleA

checkForB,B,B,>,checkDoubleB
checkForB,b,B,>,checkDoubleB
checkForB,_,B,<,doneB
checkForB,*,*,>,checkForB

doneB,_,$,>,checkForC
doneB,$,$,>,checkForC
doneB,*,*,<,doneB

checkDoubleB,B,_,>,error_invalidkey
checkDoubleB,b,_,>,error_invalidkey
checkDoubleB,_,_,<,doneB
checkDoubleB,*,*,>,checkDoubleB

checkForC,C,C,>,checkDoubleC
checkForC,c,C,>,checkDoubleC
checkForC,_,C,<,doneC
checkForC,*,*,>,checkForC

doneC,_,$,>,checkForD
doneC,$,$,>,checkForD
doneC,*,*,<,doneC

checkDoubleC,C,_,>,error_invalidkey
checkDoubleC,c,_,>,error_invalidkey
checkDoubleC,_,_,<,doneC
checkDoubleC,*,*,>,checkDoubleC

checkForD,D,D,>,checkDoubleD
checkForD,d,D,>,checkDoubleD
checkForD,_,D,<,doneD
checkForD,*,*,>,checkForD

doneD,_,$,>,checkForE
doneD,$,$,>,checkForE
doneD,*,*,<,doneD

checkDoubleD,D,_,>,error_invalidkey
checkDoubleD,d,_,>,error_invalidkey
checkDoubleD,_,_,<,doneD
checkDoubleD,*,*,>,checkDoubleD

checkForE,E,E,>,checkDoubleE
checkForE,e,E,>,checkDoubleE
checkForE,_,E,<,doneE
checkForE,*,*,>,checkForE

doneE,_,$,>,checkForF
doneE,$,$,>,checkForF
doneE,*,*,<,doneE

checkDoubleE,E,_,>,error_invalidkey
checkDoubleE,e,_,>,error_invalidkey
checkDoubleE,_,_,<,doneE
checkDoubleE,*,*,>,checkDoubleE

checkForF,F,F,>,checkDoubleF
checkForF,f,F,>,checkDoubleF
checkForF,_,F,<,doneF
checkForF,*,*,>,checkForF

doneF,_,$,>,checkForG
doneF,$,$,>,checkForG
doneF,*,*,<,doneF

checkDoubleF,F,_,>,error_invalidkey
checkDoubleF,f,_,>,error_invalidkey
checkDoubleF,_,_,<,doneF
checkDoubleF,*,*,>,checkDoubleF

checkForG,G,G,>,checkDoubleG
checkForG,g,G,>,checkDoubleG
checkForG,_,G,<,doneG
checkForG,*,*,>,checkForG

doneG,_,$,>,checkForH
doneG,$,$,>,checkForH
doneG,*,*,<,doneG

checkDoubleG,G,_,>,error_invalidkey
checkDoubleG,g,_,>,error_invalidkey
checkDoubleG,_,_,<,doneG
checkDoubleG,*,*,>,checkDoubleG

checkForH,H,H,>,checkDoubleH
checkForH,h,H,>,checkDoubleH
checkForH,_,H,<,doneH
checkForH,*,*,>,checkForH

doneH,_,$,>,checkForI
doneH,$,$,>,checkForI
doneH,*,*,<,doneH

checkDoubleH,H,_,>,error_invalidkey
checkDoubleH,h,_,>,error_invalidkey
checkDoubleH,_,_,<,doneH
checkDoubleH,*,*,>,checkDoubleH

checkForI,I,I,>,checkDoubleI
checkForI,i,I,>,checkDoubleI
checkForI,_,I,<,doneI
checkForI,*,*,>,checkForI

doneI,_,$,>,checkForJ
doneI,$,$,>,checkForJ
doneI,*,*,<,doneI

checkDoubleI,I,_,>,error_invalidkey
checkDoubleI,i,_,>,error_invalidkey
checkDoubleI,_,_,<,doneI
checkDoubleI,*,*,>,checkDoubleI

checkForJ,J,J,>,checkDoubleJ
checkForJ,j,J,>,checkDoubleJ
checkForJ,_,J,<,doneJ
checkForJ,*,*,>,checkForJ

doneJ,_,$,>,checkForK
doneJ,$,$,>,checkForK
doneJ,*,*,<,doneJ

checkDoubleJ,J,_,>,error_invalidkey
checkDoubleJ,j,_,>,error_invalidkey
checkDoubleJ,_,_,<,doneJ
checkDoubleJ,*,*,>,checkDoubleJ

checkForK,K,K,>,checkDoubleK
checkForK,k,K,>,checkDoubleK
checkForK,_,K,<,doneK
checkForK,*,*,>,checkForK

doneK,_,$,>,checkForL
doneK,$,$,>,checkForL
doneK,*,*,<,doneK

checkDoubleK,K,_,>,error_invalidkey
checkDoubleK,k,_,>,error_invalidkey
checkDoubleK,_,_,<,doneK
checkDoubleK,*,*,>,checkDoubleK

checkForL,L,L,>,checkDoubleL
checkForL,l,L,>,checkDoubleL
checkForL,_,L,<,doneL
checkForL,*,*,>,checkForL

doneL,_,$,>,checkForM
doneL,$,$,>,checkForM
doneL,*,*,<,doneL

checkDoubleL,L,_,>,error_invalidkey
checkDoubleL,l,_,>,error_invalidkey
checkDoubleL,_,_,<,doneL
checkDoubleL,*,*,>,checkDoubleL

checkForM,M,M,>,checkDoubleM
checkForM,m,M,>,checkDoubleM
checkForM,_,M,<,doneM
checkForM,*,*,>,checkForM

doneM,_,$,>,checkForN
doneM,$,$,>,checkForN
doneM,*,*,<,doneM

checkDoubleM,M,_,>,error_invalidkey
checkDoubleM,m,_,>,error_invalidkey
checkDoubleM,_,_,<,doneM
checkDoubleM,*,*,>,checkDoubleM

checkForN,N,N,>,checkDoubleN
checkForN,n,N,>,checkDoubleN
checkForN,_,N,<,doneN
checkForN,*,*,>,checkForN

doneN,_,$,>,checkForO
doneN,$,$,>,checkForO
doneN,*,*,<,doneN

checkDoubleN,N,_,>,error_invalidkey
checkDoubleN,n,_,>,error_invalidkey
checkDoubleN,_,_,<,doneN
checkDoubleN,*,*,>,checkDoubleN

checkForO,O,O,>,checkDoubleO
checkForO,o,O,>,checkDoubleO
checkForO,_,O,<,doneO
checkForO,*,*,>,checkForO

doneO,_,$,>,checkForP
doneO,$,$,>,checkForP
doneO,*,*,<,doneO

checkDoubleO,O,_,>,error_invalidkey
checkDoubleO,o,_,>,error_invalidkey
checkDoubleO,_,_,<,doneO
checkDoubleO,*,*,>,checkDoubleO

checkForP,P,P,>,checkDoubleP
checkForP,p,P,>,checkDoubleP
checkForP,_,P,<,doneP
checkForP,*,*,>,checkForP

doneP,_,$,>,checkForQ
doneP,$,$,>,checkForQ
doneP,*,*,<,doneP

checkDoubleP,P,_,>,error_invalidkey
checkDoubleP,p,_,>,error_invalidkey
checkDoubleP,_,_,<,doneP
checkDoubleP,*,*,>,checkDoubleP

checkForQ,Q,Q,>,checkDoubleQ
checkForQ,q,Q,>,checkDoubleQ
checkForQ,_,Q,<,doneQ
checkForQ,*,*,>,checkForQ

doneQ,_,$,>,checkForR
doneQ,$,$,>,checkForR
doneQ,*,*,<,doneQ

checkDoubleQ,Q,_,>,error_invalidkey
checkDoubleQ,q,_,>,error_invalidkey
checkDoubleQ,_,_,<,doneQ
checkDoubleQ,*,*,>,checkDoubleQ

checkForR,R,R,>,checkDoubleR
checkForR,r,R,>,checkDoubleR
checkForR,_,R,<,doneR
checkForR,*,*,>,checkForR

doneR,_,$,>,checkForS
doneR,$,$,>,checkForS
doneR,*,*,<,doneR

checkDoubleR,R,_,>,error_invalidkey
checkDoubleR,r,_,>,error_invalidkey
checkDoubleR,_,_,<,doneR
checkDoubleR,*,*,>,checkDoubleR

checkForS,S,S,>,checkDoubleS
checkForS,s,S,>,checkDoubleS
checkForS,_,S,<,doneS
checkForS,*,*,>,checkForS

doneS,_,$,>,checkForT
doneS,$,$,>,checkForT
doneS,*,*,<,doneS

checkDoubleS,S,_,>,error_invalidkey
checkDoubleS,s,_,>,error_invalidkey
checkDoubleS,_,_,<,doneS
checkDoubleS,*,*,>,checkDoubleS

checkForT,T,T,>,checkDoubleT
checkForT,t,T,>,checkDoubleT
checkForT,_,T,<,doneT
checkForT,*,*,>,checkForT

doneT,_,$,>,checkForU
doneT,$,$,>,checkForU
doneT,*,*,<,doneT

checkDoubleT,T,_,>,error_invalidkey
checkDoubleT,t,_,>,error_invalidkey
checkDoubleT,_,_,<,doneT
checkDoubleT,*,*,>,checkDoubleT

checkForU,U,U,>,checkDoubleU
checkForU,u,U,>,checkDoubleU
checkForU,_,U,<,doneU
checkForU,*,*,>,checkForU

doneU,_,$,>,checkForV
doneU,$,$,>,checkForV
doneU,*,*,<,doneU

checkDoubleU,U,_,>,error_invalidkey
checkDoubleU,u,_,>,error_invalidkey
checkDoubleU,_,_,<,doneU
checkDoubleU,*,*,>,checkDoubleU

checkForV,V,V,>,checkDoubleV
checkForV,v,V,>,checkDoubleV
checkForV,_,V,<,doneV
checkForV,*,*,>,checkForV

doneV,_,$,>,checkForW
doneV,$,$,>,checkForW
doneV,*,*,<,doneV

checkDoubleV,V,_,>,error_invalidkey
checkDoubleV,v,_,>,error_invalidkey
checkDoubleV,_,_,<,doneV
checkDoubleV,*,*,>,checkDoubleV

checkForW,W,W,>,checkDoubleW
checkForW,w,W,>,checkDoubleW
checkForW,_,W,<,doneW
checkForW,*,*,>,checkForW

doneW,_,$,>,checkForX
doneW,$,$,>,checkForX
doneW,*,*,<,doneW

checkDoubleW,W,_,>,error_invalidkey
checkDoubleW,w,_,>,error_invalidkey
checkDoubleW,_,_,<,doneW
checkDoubleW,*,*,>,checkDoubleW

checkForX,X,X,>,checkDoubleX
checkForX,x,X,>,checkDoubleX
checkForX,_,X,<,doneX
checkForX,*,*,>,checkForX

doneX,_,$,>,checkForY
doneX,$,$,>,checkForY
doneX,*,*,<,doneX

checkDoubleX,X,_,>,error_invalidkey
checkDoubleX,x,_,>,error_invalidkey
checkDoubleX,_,_,<,doneX
checkDoubleX,*,*,>,checkDoubleX

checkForY,Y,Y,>,checkDoubleY
checkForY,y,Y,>,checkDoubleY
checkForY,_,Y,<,doneY
checkForY,*,*,>,checkForY

doneY,_,$,>,checkForZ
doneY,$,$,>,checkForZ
doneY,*,*,<,doneY

checkDoubleY,Y,_,>,error_invalidkey
checkDoubleY,y,_,>,error_invalidkey
checkDoubleY,_,_,<,doneY
checkDoubleY,*,*,>,checkDoubleY

checkForZ,Z,Z,>,checkDoubleZ
checkForZ,z,Z,>,checkDoubleZ
checkForZ,_,Z,<,doneZ
checkForZ,*,*,>,checkForZ

doneZ,_,$,>,finish
doneZ,$,$,>,finish
doneZ,*,*,<,doneZ

checkDoubleZ,Z,_,>,error_invalidkey
checkDoubleZ,z,_,>,error_invalidkey
checkDoubleZ,_,_,<,doneZ
checkDoubleZ,*,*,>,checkDoubleZ