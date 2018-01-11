//multiply
//a.b or a_b

#include "prepare.tm"
#include "baseadd.tm"

name: multiplyr
init: begin
accept: finish

begin,*,*,<,begin
begin,_,_,>,goright
begin,.,_,>,gorightend

goright,.,_,>,gorightend
goright,=,_,<,prepare/begin
goright,_,_,>,gorightend
goright,*,*,>,goright

gorightend,=,_,<,prepare/begin
gorightend,_,_,<,prepare/begin
gorightend,*,*,>,gorightend

prepare/finish,*,*,<,addPoint

addPoint,_,.,<,goleft
addequal,_,=,<,goleftx
addequal,*,*,>,addequal
goleftx,.,.,<,goleft
goleftx,*,*,<,goleftx

goleft,0,0,<,goleft
goleft,1,1,<,goleft
goleft,*,*,>,check

check,1,o,>,baseadd/begin
check,0,z,>,goaddZero
check,.,.,<,parse

baseadd/finish,*,*,-,addZero

goaddZero,_,=,>,addZero
goaddZero,=,=,>,addZero
goaddZero,*,*,>,goaddZero

addZero,_,0,<,goback
addZero,*,*,>,addZero

goback,.,.,<,goleft
goback,*,*,<,goback

parse,o,1,<,parse
parse,z,0,<,parse
parse,_,_,>,gores

gores,_,_,<,remZero
gores,*,*,>,gores

remZero,0,_,<,goresstart
goresstart,=,=,>,finish
goresstart,*,*,<,goresstart