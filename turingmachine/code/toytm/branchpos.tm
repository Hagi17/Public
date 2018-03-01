//pointer is in the end always on the counter
name: branchpos
init: run
accept: end

run,x,x,>,testsign
run,*,*,>,run

//if first bit is 1, number is negative
testsign,F,F,<,nojump
testsign,E,E,<,nojump
testsign,D,D,<,nojump
testsign,C,C,<,nojump
testsign,B,B,<,nojump
testsign,A,A,<,nojump
testsign,0,0,>,testzero
testzero,0,0,>,testzero
testzero,y,y,<,nojump
testzero,*,*,<,jump

testsign,*,*,<,jump

nojump,r,r,<,end
nojump,p,p,<64,nojump
nojump,*,*,<,nojump

jump,x,x,<2,!copyToCount/run
jump,*,*,<,jump