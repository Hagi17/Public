name: prepare
init: begin
accept: finish

begin,_,_,>,checkif
begin,*,*,>,begin

checkif,_,_,<,good
checkif,*,*,>,begin

good,_,c,<,startprepare

startprepare,_,_,>,prep
startprepare,#,#,>,prep
startperpare,$,$,>,prep
startprepare,*,*,<,startprepare

prep,0,z,>,setZero
prep,1,o,>,setZero
prep,c,c,>,addZero
prep,*,*,>,prep

setZero,c,c,>,backZero
setZero,*,*,>,setZero

backZero,_,0,<,startprepare
backZero,*,*,>,backZero

addZero,_,0,<,parseback
addZero,*,*,>,addZero

parseback,o,1,<,parseback
parseback,z,0,<,parseback
parseback,c,_,<,parseback
parseback,_,_,>,finish
parseback,*,*,<,parseback