//set the current char to the back, and set a $ instead at front
//stops at the character set

name: setLast
init: read
accept: setLast/finish

read,icA,$,>,!setLastA/go
read,icB,$,>,!setLastB/go
read,icC,$,>,!setLastC/go
read,icD,$,>,!setLastD/go
read,icE,$,>,!setLastE/go
read,icF,$,>,!setLastF/go
read,icG,$,>,!setLastG/go
read,icH,$,>,!setLastH/go
read,icI,$,>,!setLastI/go
read,icJ,$,>,!setLastJ/go
read,icK,$,>,!setLastK/go
read,icL,$,>,!setLastL/go
read,icM,$,>,!setLastM/go
read,icN,$,>,!setLastN/go
read,icO,$,>,!setLastO/go
read,icP,$,>,!setLastP/go
read,icQ,$,>,!setLastQ/go
read,icR,$,>,!setLastR/go
read,icS,$,>,!setLastS/go
read,icT,$,>,!setLastT/go
read,icU,$,>,!setLastU/go
read,icV,$,>,!setLastV/go
read,icW,$,>,!setLastW/go
read,icX,$,>,!setLastX/go
read,icY,$,>,!setLastY/go
read,icZ,$,>,!setLastZ/go
read,/,$,>,!setLastAnom/go

go,_,%tmpl%,-,!setLast/finish
go,*,*,>,go
go,$,$,-,error