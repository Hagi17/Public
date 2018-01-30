//
// ------- States -----------|
// begin - go to the right   |
// add - add 1               |
// goleft - go to the left   |
// finish - done             |
//---------------------------|
// input: a  (binary)

name: Increment
init: begin
accept: finish

begin,0,0,>,begin

begin,1,1,>,begin

begin,_,_,<,add

add,1,0,<,add

add,0,1,<,goleft

add,_,1,<,goleft

goleft,1,1,<,goleft

goleft,0,0,<,goleft

goleft,_,_,>,finish
