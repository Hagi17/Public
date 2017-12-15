//baseadd
//b=a -> b=(a+b)

#include "rshift.tm"

name: baseadd
init: begin
accept: finish

begin,=,=,<,work
begin,_,=,<,work
begin,*,*,>,begin

work,o,o,<,work
work,z,z,<,work
work,1,o,>,gotores1
work,0,z,>,gotores2
work,*,*,>,parse

gotores1,=,=,>,goadd
gotores1,*,*,>,gotores1

goadd,1,1,>,goadd
goadd,0,0,>,goadd
goadd,*,*,<,add

add,=,&,>,rshift/begin
add,0,o,<,back
add,1,z,<,inc

inc,1,0,<,inc
inc,=,=,>,rshift/begin
inc,0,1,<,back

back,=,=,<,work
back,*,*,<,back

gotores2,=,=,>,gomask
gotores2,*,*,>,gotores2

gomask,1,1,>,gomask
gomask,0,0,>,gomask
gomask,*,*,<,mask

mask,0,z,<,back
mask,1,o,<,back
mask,=,%,>,rshift/begin

rshift/finish,*,z,<,test
test,=,=,>,set1
test,&,=,>,mask1
test,%,=,<,work

set1,z,1,<,back
mask1,z,o,<,back

parse,=,=,>,parse
parse,o,1,>,parse
parse,z,0,>,parse
parse,1,1,>,parse
parse,0,0,>,parse
parse,_,_,<,gotoequal

gotoequal,=,=,>,finish
gotoequal,*,*,<,gotoequal