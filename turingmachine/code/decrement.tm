//
// ------- States -----------|
// begin - go to the right   
// sub - subtract 1          
// goleft - go to the left   
// clear - set to zero (we tried to subtract 1 from 0)   
// finish - done             
//---------------------------|
// input: a (binary)

name: Decrement
init: begin
accept: finish

begin,0,0,>,begin

begin,1,1,>,begin

begin,_,_,<,sub

sub,1,0,<,goleft

sub,0,1,<,sub

sub,_,_,>,clear

goleft,1,1,<,goleft

goleft,0,0,<,goleft

goleft,_,_,>,finish

clear,1,0,>,clear

clear,_,_,<,goleft
