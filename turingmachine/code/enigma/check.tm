//check for correct rotors, all uppercases,...
//only uppercase checking currently....
//check if / is at front

name: check
init: go
accept: finish

go,icA,A,>,go
go,icB,B,>,go
go,icC,C,>,go
go,icD,D,>,go
go,icE,E,>,go
go,icF,F,>,go
go,icG,G,>,go
go,icH,H,>,go
go,icI,I,>,go
go,icJ,J,>,go
go,icK,K,>,go
go,icL,L,>,go
go,icM,M,>,go
go,icN,N,>,go
go,icO,O,>,go
go,icP,P,>,go
go,icQ,Q,>,go
go,icR,R,>,go
go,icS,S,>,go
go,icT,T,>,go
go,icU,U,>,go
go,icV,V,>,go
go,icW,W,>,go
go,icX,X,>,go
go,icY,Y,>,go
go,icZ,Z,>,go

go,$,$,<,gofinish

gofinish,_,_,<,checkif
gofinish,*,*,<,gofinish
checkif,_,_,<,checkif2
checkif,*,*,<,gofinish
checkif2,_,_,>,done
checkif2,*,*,<,gofinish
done,_,_,>,done
done,*,*,-,finish