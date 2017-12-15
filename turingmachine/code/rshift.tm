//rshift a
//shifts one place to the right
//supports: 1,0,o,z,_  (only single _)

name: rshift
init: begin
accept: finish

begin,_,/,>,checkif
begin,*,*,>,begin
begin,z,z,>,begin

checkif,_,_,<,oneleft
checkif,*,*,>,begin

oneleft,_,_,<,checkend
oneleft,/,_,<,checkend

checkend,_,_,>,finish
checkend,*,*,-,shiftbase

shiftbase,0,_,>,shift0
shiftbase,1,_,>,shift1
shiftbase,o,_,>,shifto
shiftbase,z,_,>,shiftz
shiftbase,/,_,>,shift/
shiftbase,*,*,>,finish

shift0,_,0,<,oneleft
shift1,_,1,<,oneleft
shifto,_,o,<,oneleft
shiftz,_,z,<,oneleft
shift/,_,_,<,oneleft