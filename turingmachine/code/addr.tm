//add
//a+b or a_b or a+b= or a_b=
//also accepts a

#include "baseadd.tm"

name: AdditionR
init: begin
accept: finish

begin,_,_,>,checkif
begin,*,*,>,begin
begin,=,=,<,goleft

checkif,_,_,<,set=
checkif,=,=,-,error
checkif,*,*,>,begin

set=,_,=,<,goleft

goleft,_,_,<,goplus
goleft,+,+,<,gowork
goleft,*,*,<,goleft

goplus,_,0,>,setplus
goplus,*,*,>,setplus

setplus,_,+,<,gowork

gowork,+,+,<,gowork
gowork,0,0,<,gowork
gowork,1,1,<,gowork
gowork,_,_,>,work
gowork,o,o,>,work
gowork,z,z,>,work
gowork,=,=,<,gowork

work,1,o,>,goset1
work,0,z,>,goset0
work,+,+,<,parse

goset1,=,=,>,set1
goset1,*,*,>,goset1

set1,0,0,>,set1
set1,1,1,>,set1
set1,_,1,<,gowork

goset0,=,=,>,set0
goset0,*,*,>,goset0

set0,0,0,>,set0
set0,1,1,>,set0
set0,_,0,<,gowork

parse,o,1,<,parse
parse,z,0,<,parse
parse,_,_,>,baseadd/begin

baseadd/finish,*,*,-,finish