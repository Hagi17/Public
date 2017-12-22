//shift left a single char
//always ends at shift/finish

name: lshift
init: first
accept: shift/finish

first,icA,_,<,!shiftA/shift
first,icB,_,<,!shiftB/shift
first,icC,_,<,!shiftC/shift
first,icD,_,<,!shiftD/shift
first,icE,_,<,!shiftE/shift
first,icF,_,<,!shiftF/shift
first,icG,_,<,!shiftG/shift
first,icH,_,<,!shiftH/shift
first,icI,_,<,!shiftI/shift
first,icJ,_,<,!shiftJ/shift
first,icK,_,<,!shiftK/shift
first,icL,_,<,!shiftL/shift
first,icM,_,<,!shiftM/shift
first,icN,_,<,!shiftN/shift
first,icO,_,<,!shiftO/shift
first,icP,_,<,!shiftP/shift
first,icQ,_,<,!shiftQ/shift
first,icR,_,<,!shiftR/shift
first,icS,_,<,!shiftS/shift
first,icT,_,<,!shiftT/shift
first,icU,_,<,!shiftU/shift
first,icV,_,<,!shiftV/shift
first,icW,_,<,!shiftW/shift
first,icX,_,<,!shiftX/shift
first,icY,_,<,!shiftY/shift
first,icZ,_,<,!shiftZ/shift

first,/,_,<,!shiftAnom/shift
first,$,$,-,!shift/finish
first,?,?,-,!shift/finish


shift,icA,%tmpl%,<,!shiftA/shift
shift,icB,%tmpl%,<,!shiftB/shift
shift,icC,%tmpl%,<,!shiftC/shift
shift,icD,%tmpl%,<,!shiftD/shift
shift,icE,%tmpl%,<,!shiftE/shift
shift,icF,%tmpl%,<,!shiftF/shift
shift,icG,%tmpl%,<,!shiftG/shift
shift,icH,%tmpl%,<,!shiftH/shift
shift,icI,%tmpl%,<,!shiftI/shift
shift,icJ,%tmpl%,<,!shiftJ/shift
shift,icK,%tmpl%,<,!shiftK/shift
shift,icL,%tmpl%,<,!shiftL/shift
shift,icM,%tmpl%,<,!shiftM/shift
shift,icN,%tmpl%,<,!shiftN/shift
shift,icO,%tmpl%,<,!shiftO/shift
shift,icP,%tmpl%,<,!shiftP/shift
shift,icQ,%tmpl%,<,!shiftQ/shift
shift,icR,%tmpl%,<,!shiftR/shift
shift,icS,%tmpl%,<,!shiftS/shift
shift,icT,%tmpl%,<,!shiftT/shift
shift,icU,%tmpl%,<,!shiftU/shift
shift,icV,%tmpl%,<,!shiftV/shift
shift,icW,%tmpl%,<,!shiftW/shift
shift,icX,%tmpl%,<,!shiftX/shift
shift,icY,%tmpl%,<,!shiftY/shift
shift,icZ,%tmpl%,<,!shiftZ/shift

shift,/,%tmpl%,<,!shiftAnom/shift
shift,$,%tmpl%,-,!shift/finish
shift,?,%tmpl%,-,!shift/finish
