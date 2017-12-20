//goes right to %tmpl%, stops also when encountering a double _
//example for using template
//usage: #include "rgoto.tm" AS goX(X)

name: rgoto
init: go
accept: stop

go,%tmpl%,%tmpl%,-,stop
go,_,_,>,checkif
go,*,*,>,go
checkif,_,_,<,oneBack
checkif,*,*,-,go
oneBack,_,_,<,stop