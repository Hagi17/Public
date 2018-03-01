//pointer is on most right bit of calculation
name: math
init: run
accept: end

addition,1,o,<17,add1
addition,0,o,<,addition
addition,_,o,<,addition
addition,+,+,>16,parse
add1,0,1,>,next
add1,1,0,<,inc
add1,_,1,>,next
next,o,o,<,addition
next,*,*,>,next
inc,0,1,>,next
inc,_,1,>,next
inc,1,0,<,inc
inc,w,w,>,next
parse,o,0,<,parse
parse,+,0,<,parse
parse,0,0,<,parse
parse,1,1,<,parse
parse,_,0,<,parse
parse,w,w,-,end

subtraction,1,o,<17,sub1
subtraction,0,o,<,subtraction
subtraction,_,o,<,subtraction
subtraction,+,+,>16,parse
sub1,0,1,<,dec
sub1,1,0,>,nexts
sub1,_,1,<,dec
nexts,o,o,<,subtraction
nexts,*,*,>,nexts
dec,0,1,<,dec
dec,_,1,<,dec
dec,1,0,>,nexts
dec,w,w,>,nexts