#include INTERNAL

name: example
init: run
accept: finish

run,#,#,-,finish
run,i,i,>,internal/stdin,run
run,*,*,>,internal/stdout,run