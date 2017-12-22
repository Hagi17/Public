//rotate all Walzen (if needed)
//Head before first Walze, before & after
//V
//.$AZ$AZ$AZ%AZ

#include "rotate.tm"

name: rotateAll
init: begin
accept: finish

begin,$,$,>,double
double,*,*,>,rotate/begin
double,$,$,>,rotate/begin
begin,*,*,>,begin

//currently, if / is at the end of the Rotor, after we turned it, we turn the next one
rotate/finish,/,/,>,rotateNext
rotate/finish,*,*,>,check

check,$,$,<,gofinish
check,%,%,<,gofinish
check,_,_,<,gofinish
check,?,?,>,rotate/begin

rotateNext,$,$,>,rotate/begin
rotateNext,%,%,>,rotate/begin
rotateNext,?,?,>,rotate/begin
rotateNext,_,_,<,gofinish

gofinish,_,_,>,lstfinish
gofinish2,_,_,>,lstfinish
gofinish,$,?,<,gofinish2
gofinish2,$,$,<,gofinish
gofinish,*,*,<,gofinish
gofinish2,*,*,<,gofinish2
lstfinish,$,$,<,checkquest
checkquest,?,$,<,finish
checkquest,*,*,-,finish
lstfinish,*,*,>,lstfinish