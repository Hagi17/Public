//check for single occurence of %tmpl%, remove all others and shift left
//goes back to left end (or $)

//example for %tmpl% and ic usage

#include "lshiftAZ.tm" AS lsh

name: checkFor
init: check
accept: finish

check,_,%tmpl%,<,done
check,ic%tmpl%,%tmpl%,>,checkDouble
check,*,*,>,check

done,$,$,>,finish
done,_,$,>,finish
done,*,*,<,done

checkDouble,ic%tmpl%,_,>,lsh/begin
checkDouble,_,_,<,done
checkDouble,*,*,>,checkDouble

lsh/finish,*,*,<,recheck
recheck,$,$,>,check
recheck,_,$,>,check
recheck,*,*,<,recheck