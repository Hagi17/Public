//encrypt or decrypt the message (monoalphabetic)
//input: plaintext$key for encryption
//       cipher&$key for decryption
//output: cipher&$key or plaintext$key

//errorstate: error_nokey
//            error_format

#include "checkMonoKey.tm"
#include "encryptMono.tm"
#include "decryptMono.tm"

name: cryptMono
init: begin
accept: finish

begin,$,$,>,checkMonoKey/begin
begin,_,_,>,checkif
begin,*,*,>,begin

checkif,_,_,<,ungo
checkif,*,*,>,begin
ungo,_,_,<,readBack

readBack,$,$,>,checkMonoKey/begin
readBack,_,_,>,error_nokey
readBack,*,*,<,readBack

checkMonoKey/finish,*,*,<,goOne
goOne,$,$,<,checkDirection
checkDirection,&,&,<,goStartD
checkDirection,*,*,<,goStartE

goStartE,_,_,>,encryptMono/begin
goStartE,*,*,<,goStartE
goStartD,_,_,>,decryptMono/begin
goStartD,*,*,<,goStartD

encryptMono/finish,*,*,-,finish
decryptMono/finish,*,*,-,finish
