name: copybinary
init: begin
accept: finish

begin,_,_,>,checkend
begin,*,*,>,begin

checkend,_,c,<,startcopy
checkend,*,*,>,begin

startcopy,_,_,<,checkstart
startcopy,*,*,<,startcopy

checkstart,_,_,>,onestep
checkstart,*,*,<,startcopy

onestep,_,_,>,copy

copy,1,o,>,run1
copy,0,z,>,run0
copy,#,%,>,run#
copy,$,&,>,run$
copy,_,/,>,run_
copy,c,c,>,goright
copy,*,*,>,copy

goright,_,_,<,goleft
goright,*,*,>,goright

goleft,o,1,<,goleft
goleft,z,0,<,goleft
goleft,%,#,<,goleft
goleft,&,%,<,goleft
goleft,/,_,<,goleft
goleft,_,_,>,finish
goleft,c,_,<,goleft
goleft,*,*,<,goleft

run1,c,c,>,goend1
run1,*,*,>,run1
goend1,_,1,<,startcopy
goend1,*,*,>,goend1

run0,c,c,>,goend0
run0,*,*,>,run0
goend0,_,0,<,startcopy
goend0,*,*,>,goend0

run$,c,c,>,goend$
run$,*,*,>,run$
goend$,_,$,<,startcopy
goend$,*,*,>,goend$

run#,c,c,>,goend#
run#,*,*,>,run#
goend#,_,#,<,startcopy
goend#,*,*,>,goend#

run_,c,c,>,goend_
run_,*,*,>,run_
goend_,_,/,<,startcopy
goend_,*,*,>,goend_