//encrypt Letter

name: goNextRotor
init: go
accept: finish

go,$,$,>,double
double,*,*,-,goEncrypt
double,$,$,>,goEncrypt
go,%,%,>,goReverseEncrypt
go,*,*,>,go

goEncrypt,_,_,-,error
goEncrypt,$,$,-,error
goEncrypt,/,/,>,goEncrypt

//same for left
//fl: we got the double $$
fl,$,$,<,goset
fl,*,*,-,goEncryptl

gol,$,$,<,doublel
doublel,*,*,-,goEncryptl
doublel,$,$,<,goEncryptl
gol,%,%,<,goEncryptl
gol,*,*,<,gol

goset,*,*,<,goset

goEncryptl,_,_,-,error
goEncryptl,$,$,-,error
goEncryptl,/,/,<,goEncryptl
