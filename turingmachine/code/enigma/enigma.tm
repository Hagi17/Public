//Encrypt/Decrypt using the ENIGMA
//input: plain$$rotor1$rotor2$....%reverserotor
//in plain: only uppercase letters, but special characters are allowed (except $ and % and &, max. 2 _)
//
//Rotor-Anomaly: place / before the letter, if / is at front, place it at the end
//
//checked with Paper enigma

#include "rotateAll.tm"
#include "forwardEncrypt.tm"
#include "check.tm"
#include "toupper.tm"

name: enigma
init: startup
accept: finish

//startup: check rotors for 26+ letters, every letter only 1 time
//go back to very left (max. __)

startup,*,*,-,check/go

//no characters:
check/finish,$,$,-,finish
//rotate before encrypt (otherwise: nextstate: encrypt)
check/finish,*,*,-,rotateAll/begin

//encrypt each letter and turn the rotors afterwards (or before encrypting)?

forwardEncrypt/finish,*,*,>,checkend
checkend,$,$,<,toupper/go
checkend,*,*,-,rotateAll/begin
rotateAll/finish,*,*,-,goEncrypt

goEncrypt,a,a,>,encrypt
goEncrypt,b,b,>,encrypt
goEncrypt,c,c,>,encrypt
goEncrypt,d,d,>,encrypt
goEncrypt,e,e,>,encrypt
goEncrypt,f,f,>,encrypt
goEncrypt,g,g,>,encrypt
goEncrypt,h,h,>,encrypt
goEncrypt,i,i,>,encrypt
goEncrypt,j,j,>,encrypt
goEncrypt,k,k,>,encrypt
goEncrypt,l,l,>,encrypt
goEncrypt,m,m,>,encrypt
goEncrypt,n,n,>,encrypt
goEncrypt,o,o,>,encrypt
goEncrypt,p,p,>,encrypt
goEncrypt,q,q,>,encrypt
goEncrypt,r,r,>,encrypt
goEncrypt,s,s,>,encrypt
goEncrypt,t,t,>,encrypt
goEncrypt,u,u,>,encrypt
goEncrypt,v,v,>,encrypt
goEncrypt,w,w,>,encrypt
goEncrypt,x,x,>,encrypt
goEncrypt,y,y,>,encrypt
goEncrypt,z,z,>,encrypt

goEncrypt,*,*,<,goEncrypt
goEncrypt,_,_,<,check1
check1,_,_,<,check2
check1,*,*,<,goEncrypt
check2,_,_,>,bitback
check2,*,*,<,goEncrypt
bitback,_,_,>,bitback
bitback,*,*,-,encrypt

encrypt,$,$,<,toupper/go
encrypt,*,*,-,forwardEncrypt/begin

//check anomaly

toupper/finish,*,*,-,finish
