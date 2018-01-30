//input: a#b or a_b (a,b binary)
//output: 1 if b > a
//       -1 if a > b
//        0 if a = b

name: compare
init: goright1
accept: bgreater,agreater,equal

goright1,1,1,>,goright1

goright1,0,0,>,goright1

goright1,#,#,>,goright2

goright1,_,#,>,checkif

checkif,_,_,<,undo

checkif,1,1,>,goright2

checkif,0,0,>,goright2

undo,#,_,<,goright2

goright2,1,1,>,goright2

goright2,0,0,>,goright2

goright2,_,_,<,work

work,1,_,<,goleft1

work,0,_,<,goleft0

work,#,#,<,goallleft

goleft1,1,1,<,goleft1

goleft1,0,0,<,goleft1

goleft1,#,#,<,sub
goleft1,_,#,<,sub

sub,z,z,<,sub

sub,o,o,<,sub

sub,1,z,>,goright3

sub,0,o,<,sub2

sub,_,1,>,clear

sub2,1,0,>,goright3

sub2,0,1,<,sub2

sub2,_,1,>,clear

goright3,1,1,>,goright3

goright3,0,0,>,goright3

goright3,z,z,>,goright3

goright3,o,o,>,goright3

goright3,#,#,>,goright2

goleft0,1,1,<,goleft0

goleft0,0,0,<,goleft0

goleft0,#,#,<,change
goleft0,_,#,<,change

change,z,z,<,change

change,o,o,<,change

change,1,o,>,goright3

change,0,z,>,goright3

change,_,_,>,check

clear,1,_,>,clear

clear,0,_,>,clear

clear,z,_,>,clear

clear,o,_,>,clear

clear,#,_,>,clear

clear,_,_,<,showresult

goallleft,1,1,<,goallleft

goallleft,0,0,<,goallleft

goallleft,z,z,<,goallleft

goallleft,o,o,<,goallleft

goallleft,_,_,>,check

check,1,1,<,setfalse

check,o,1,<,setfalse

setfalse,_,-,>,setfalse

setfalse,1,1,>,clear

check,0,_,>,check

check,z,_,>,check

check,_,0,>,clear

//prüfen ob noch Reste von b vorhanden sind. (a = 0)

check,#,_,>,check2

check2,_,0,>,clear

check2,0,_,>,check2

check2,1,1,>,clear

showresult,_,_,<,showresult

showresult,0,0,-,equal

showresult,1,1,<,checkminus

checkminus,-,-,-,agreater

checkminus,_,_,>,bgreater
