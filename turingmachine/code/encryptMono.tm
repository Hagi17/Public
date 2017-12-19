//encrypt the plaintext using monoalphabetic encryption
//input: plaintext$key

name: encryptMono
init: begin
accept: finish

begin,_,&,>,readPlain
begin,*,*,<,begin

gofinish,_,_,<,checkif
gofinish,*,*,<,gofinish
checkif,_,_,>,backfinish
checkif,*,*,<,gofinish
backfinish,_,_,>,finish

readPlain,$,$,<,gofinish
readPlain,A,&,>,goToKeyA
readPlain,a,&,>,goToKeyA
readPlain,B,&,>,goToKeyB
readPlain,b,&,>,goToKeyB
readPlain,C,&,>,goToKeyC
readPlain,c,&,>,goToKeyC
readPlain,D,&,>,goToKeyD
readPlain,d,&,>,goToKeyD
readPlain,E,&,>,goToKeyE
readPlain,e,&,>,goToKeyE
readPlain,F,&,>,goToKeyF
readPlain,f,&,>,goToKeyF
readPlain,G,&,>,goToKeyG
readPlain,g,&,>,goToKeyG
readPlain,H,&,>,goToKeyH
readPlain,h,&,>,goToKeyH
readPlain,I,&,>,goToKeyI
readPlain,i,&,>,goToKeyI
readPlain,J,&,>,goToKeyJ
readPlain,j,&,>,goToKeyJ
readPlain,K,&,>,goToKeyK
readPlain,k,&,>,goToKeyK
readPlain,L,&,>,goToKeyL
readPlain,l,&,>,goToKeyL
readPlain,M,&,>,goToKeyM
readPlain,m,&,>,goToKeyM
readPlain,N,&,>,goToKeyN
readPlain,n,&,>,goToKeyN
readPlain,O,&,>,goToKeyO
readPlain,o,&,>,goToKeyO
readPlain,P,&,>,goToKeyP
readPlain,p,&,>,goToKeyP
readPlain,Q,&,>,goToKeyQ
readPlain,q,&,>,goToKeyQ
readPlain,R,&,>,goToKeyR
readPlain,r,&,>,goToKeyR
readPlain,S,&,>,goToKeyS
readPlain,s,&,>,goToKeyS
readPlain,T,&,>,goToKeyT
readPlain,t,&,>,goToKeyT
readPlain,U,&,>,goToKeyU
readPlain,u,&,>,goToKeyU
readPlain,V,&,>,goToKeyV
readPlain,v,&,>,goToKeyV
readPlain,W,&,>,goToKeyW
readPlain,w,&,>,goToKeyW
readPlain,X,&,>,goToKeyX
readPlain,x,&,>,goToKeyX
readPlain,Y,&,>,goToKeyY
readPlain,y,&,>,goToKeyY
readPlain,Z,&,>,goToKeyZ
readPlain,z,&,>,goToKeyZ

readPlain,&,&,>,readPlain
readPlain,_,&,<,setBlank
readPlain,.,&,<,setDot
readPlain,,,&,<,setKomma
readPlain,-,&,<,setMinus
readPlain,;,&,<,setSemicolon
readPlain,*,&,<,setBlank

setDot,&,.,>,readPlain
setKomma,&,,,>,readPlain
setMinus,&,-,>,readPlain
setSemicolon,&,;,>,readPlain
setBlank,&,_,>,readPlain

goToKeyA,$,$,>,getEncrypted
goToKeyA,*,*,>,goToKeyA
goToKeyB,$,$,>,goEncryptedB
goToKeyB,*,*,>,goToKeyB

goToKeyC,*,*,>,goToKeyC
goToKeyD,*,*,>,goToKeyD
goToKeyE,*,*,>,goToKeyE
goToKeyF,*,*,>,goToKeyF
goToKeyG,*,*,>,goToKeyG
goToKeyH,*,*,>,goToKeyH
goToKeyI,*,*,>,goToKeyI
goToKeyJ,*,*,>,goToKeyJ
goToKeyK,*,*,>,goToKeyK
goToKeyL,*,*,>,goToKeyL
goToKeyM,*,*,>,goToKeyM
goToKeyN,*,*,>,goToKeyN
goToKeyO,*,*,>,goToKeyO
goToKeyP,*,*,>,goToKeyP
goToKeyQ,*,*,>,goToKeyQ
goToKeyR,*,*,>,goToKeyR
goToKeyS,*,*,>,goToKeyS
goToKeyT,*,*,>,goToKeyT
goToKeyU,*,*,>,goToKeyU
goToKeyV,*,*,>,goToKeyV
goToKeyW,*,*,>,goToKeyW
goToKeyX,*,*,>,goToKeyX
goToKeyY,*,*,>,goToKeyY
goToKeyZ,*,*,>,goToKeyZ
goToKeyC,$,$,>,goEncryptedC
goToKeyD,$,$,>,goEncryptedD
goToKeyE,$,$,>,goEncryptedE
goToKeyF,$,$,>,goEncryptedF
goToKeyG,$,$,>,goEncryptedG
goToKeyH,$,$,>,goEncryptedH
goToKeyI,$,$,>,goEncryptedI
goToKeyJ,$,$,>,goEncryptedJ
goToKeyK,$,$,>,goEncryptedK
goToKeyL,$,$,>,goEncryptedL
goToKeyM,$,$,>,goEncryptedM
goToKeyN,$,$,>,goEncryptedN
goToKeyO,$,$,>,goEncryptedO
goToKeyP,$,$,>,goEncryptedP
goToKeyQ,$,$,>,goEncryptedQ
goToKeyR,$,$,>,goEncryptedR
goToKeyS,$,$,>,goEncryptedS
goToKeyT,$,$,>,goEncryptedT
goToKeyU,$,$,>,goEncryptedU
goToKeyV,$,$,>,goEncryptedV
goToKeyW,$,$,>,goEncryptedW
goToKeyX,$,$,>,goEncryptedX
goToKeyY,$,$,>,goEncryptedY
goToKeyZ,$,$,>,goEncryptedZ

goEncryptedB,*,*,>,getEncrypted
goEncryptedC,*,*,>,goEncryptedB
goEncryptedD,*,*,>,goEncryptedC
goEncryptedE,*,*,>,goEncryptedD
goEncryptedF,*,*,>,goEncryptedE
goEncryptedG,*,*,>,goEncryptedF
goEncryptedH,*,*,>,goEncryptedG
goEncryptedI,*,*,>,goEncryptedH
goEncryptedJ,*,*,>,goEncryptedI
goEncryptedK,*,*,>,goEncryptedJ
goEncryptedL,*,*,>,goEncryptedK
goEncryptedM,*,*,>,goEncryptedL
goEncryptedN,*,*,>,goEncryptedM
goEncryptedO,*,*,>,goEncryptedN
goEncryptedP,*,*,>,goEncryptedO
goEncryptedQ,*,*,>,goEncryptedP
goEncryptedR,*,*,>,goEncryptedQ
goEncryptedS,*,*,>,goEncryptedR
goEncryptedT,*,*,>,goEncryptedS
goEncryptedU,*,*,>,goEncryptedT
goEncryptedV,*,*,>,goEncryptedU
goEncryptedW,*,*,>,goEncryptedV
goEncryptedX,*,*,>,goEncryptedW
goEncryptedY,*,*,>,goEncryptedX
goEncryptedZ,*,*,>,goEncryptedY

getEncrypted,A,A,<,gosetCharA
getEncrypted,B,B,<,gosetCharB
getEncrypted,C,C,<,gosetCharC
getEncrypted,D,D,<,gosetCharD
getEncrypted,E,E,<,gosetCharE
getEncrypted,F,F,<,gosetCharF
getEncrypted,G,G,<,gosetCharG
getEncrypted,H,H,<,gosetCharH
getEncrypted,I,I,<,gosetCharI
getEncrypted,J,J,<,gosetCharJ
getEncrypted,K,K,<,gosetCharK
getEncrypted,L,L,<,gosetCharL
getEncrypted,M,M,<,gosetCharM
getEncrypted,N,N,<,gosetCharN
getEncrypted,O,O,<,gosetCharO
getEncrypted,P,P,<,gosetCharP
getEncrypted,Q,Q,<,gosetCharQ
getEncrypted,R,R,<,gosetCharR
getEncrypted,S,S,<,gosetCharS
getEncrypted,T,T,<,gosetCharT
getEncrypted,U,U,<,gosetCharU
getEncrypted,V,V,<,gosetCharV
getEncrypted,W,W,<,gosetCharW
getEncrypted,X,X,<,gosetCharX
getEncrypted,Y,Y,<,gosetCharY
getEncrypted,Z,Z,<,gosetCharZ

gosetCharA,&,&,<,setCharA
gosetCharA,*,*,<,gosetCharA
setCharA,&,A,>,readPlain
setCharA,*,*,<,gosetCharA

gosetCharB,&,&,<,setCharB
gosetCharB,*,*,<,gosetCharB
setCharB,&,B,>,readPlain
setCharB,*,*,<,gosetCharB

gosetCharC,&,&,<,setCharC
gosetCharC,*,*,<,gosetCharC
setCharC,&,C,>,readPlain
setCharC,*,*,<,gosetCharC

gosetCharD,&,&,<,setCharD
gosetCharD,*,*,<,gosetCharD
setCharD,&,D,>,readPlain
setCharD,*,*,<,gosetCharD

gosetCharE,&,&,<,setCharE
gosetCharE,*,*,<,gosetCharE
setCharE,&,E,>,readPlain
setCharE,*,*,<,gosetCharE

gosetCharF,&,&,<,setCharF
gosetCharF,*,*,<,gosetCharF
setCharF,&,F,>,readPlain
setCharF,*,*,<,gosetCharF

gosetCharG,&,&,<,setCharG
gosetCharG,*,*,<,gosetCharG
setCharG,&,G,>,readPlain
setCharG,*,*,<,gosetCharG

gosetCharH,&,&,<,setCharH
gosetCharH,*,*,<,gosetCharH
setCharH,&,H,>,readPlain
setCharH,*,*,<,gosetCharH

gosetCharI,&,&,<,setCharI
gosetCharI,*,*,<,gosetCharI
setCharI,&,I,>,readPlain
setCharI,*,*,<,gosetCharI

gosetCharJ,&,&,<,setCharJ
gosetCharJ,*,*,<,gosetCharJ
setCharJ,&,J,>,readPlain
setCharJ,*,*,<,gosetCharJ

gosetCharK,&,&,<,setCharK
gosetCharK,*,*,<,gosetCharK
setCharK,&,K,>,readPlain
setCharK,*,*,<,gosetCharK

gosetCharL,&,&,<,setCharL
gosetCharL,*,*,<,gosetCharL
setCharL,&,L,>,readPlain
setCharL,*,*,<,gosetCharL

gosetCharM,&,&,<,setCharM
gosetCharM,*,*,<,gosetCharM
setCharM,&,M,>,readPlain
setCharM,*,*,<,gosetCharM

gosetCharN,&,&,<,setCharN
gosetCharN,*,*,<,gosetCharN
setCharN,&,N,>,readPlain
setCharN,*,*,<,gosetCharN

gosetCharO,&,&,<,setCharO
gosetCharO,*,*,<,gosetCharO
setCharO,&,O,>,readPlain
setCharO,*,*,<,gosetCharO

gosetCharP,&,&,<,setCharP
gosetCharP,*,*,<,gosetCharP
setCharP,&,P,>,readPlain
setCharP,*,*,<,gosetCharP

gosetCharQ,&,&,<,setCharQ
gosetCharQ,*,*,<,gosetCharQ
setCharQ,&,Q,>,readPlain

gosetCharR,&,&,<,setCharR
gosetCharR,*,*,<,gosetCharR
setCharR,&,R,>,readPlain
setCharR,*,*,<,gosetCharR

gosetCharS,&,&,<,setCharS
gosetCharS,*,*,<,gosetCharS
setCharS,&,S,>,readPlain
setCharS,*,*,<,gosetCharS

gosetCharT,&,&,<,setCharT
gosetCharT,*,*,<,gosetCharT
setCharT,&,T,>,readPlain
setCharT,*,*,<,gosetCharT

gosetCharU,&,&,<,setCharU
gosetCharU,*,*,<,gosetCharU
setCharU,&,U,>,readPlain
setCharU,*,*,<,gosetCharU

gosetCharV,&,&,<,setCharV
gosetCharV,*,*,<,gosetCharV
setCharV,&,V,>,readPlain
setCharV,*,*,<,gosetCharV

gosetCharW,&,&,<,setCharW
gosetCharW,*,*,<,gosetCharW
setCharW,&,W,>,readPlain
setCharW,*,*,<,gosetCharW

gosetCharX,&,&,<,setCharX
gosetCharX,*,*,<,gosetCharX
setCharX,&,X,>,readPlain
setCharX,*,*,<,gosetCharX

gosetCharY,&,&,<,setCharY
gosetCharY,*,*,<,gosetCharY
setCharY,&,Y,>,readPlain
setCharY,*,*,<,gosetCharY

gosetCharZ,&,&,<,setCharZ
gosetCharZ,*,*,<,gosetCharZ
setCharZ,&,Z,>,readPlain
setCharZ,*,*,<,gosetCharZ