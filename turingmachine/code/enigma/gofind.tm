name: gofind
init: gor
accept: found

gor,?,?,>,findr
gor,*,*,>,gor

findr,%tmpl%,%tmpl%,-,!forwardEncrypt/count
findr,*,*,>,findr

gol,?,?,<,findl
gol,*,*,<,gol

findl,%tmpl%,%tmpl%,-,!backwardEncrypt/count
findl,*,*,<,findl