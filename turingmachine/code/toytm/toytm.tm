//16bit Toy Emulator
//Nibble-Based (tape-values: 0-9,A-F)
//m : Memory indicator
//s : Statusflag indicator (counter)
//r : Register indicator
//p : CPU (command Byte) indicator
//w : working space indicator
//x : Rd
//y : Rs
//z : Rt
//number of memory: LeftToRight
//m....  s..r....  p....x....y....z....w..  

#include "boot.tm"
#include "prefetch.tm"
#include "interpret.tm"

#include "calculus.tm"
//#include "add.tm"
//#include "sub.tm"
//#include "xor.tm"
//#include "and.tm"
//#include "shl.tm"
//#include "shr.tm"
#include "branchpos.tm"
#include "branchzero.tm"
#include "jumplink.tm"
#include "jumpreg.tm"
#include "loaddir.tm"
#include "loadindir.tm"
#include "store.tm"
#include "storeindir.tm"
#include "loadmem.tm"

#include "copycmd.tm" AS cpycmd0(_,4)
#include "copycmd.tm" AS cpycmd1(_,8)
#include "copycmd.tm" AS cpycmd2(_,12)
#include "copycmd.tm" AS cpycmd3(_,16)
#include "copycmd.tm" AS cpycmd4(_,20)
#include "copycmd.tm" AS cpycmd5(_,24)
#include "copycmd.tm" AS cpycmd6(_,28)
#include "copycmd.tm" AS cpycmd7(_,32)
#include "copycmd.tm" AS cpycmd8(_,36)
#include "copycmd.tm" AS cpycmd9(_,40)
#include "copycmd.tm" AS cpycmd10(_,44)
#include "copycmd.tm" AS cpycmd11(_,48)
#include "copycmd.tm" AS cpycmd12(_,52)
#include "copycmd.tm" AS cpycmd13(_,56)
#include "copycmd.tm" AS cpycmd14(_,60)
#include "copycmd.tm" AS cpycmd15(_,64)
#include "copycmd.tm" AS cpycmd16(_,68)
#include "copycmd.tm" AS cpycmd17(_,72)
#include "copycmd.tm" AS cpycmd18(_,76)
#include "copycmd.tm" AS cpycmd19(_,80)
#include "copycmd.tm" AS cpycmd20(_,84)
#include "copycmd.tm" AS cpycmd21(_,88)
#include "copycmd.tm" AS cpycmd22(_,92)
#include "copycmd.tm" AS cpycmd23(_,96)
#include "copycmd.tm" AS cpycmd24(_,100)
#include "copycmd.tm" AS cpycmd25(_,104)
#include "copycmd.tm" AS cpycmd26(_,108)
#include "copycmd.tm" AS cpycmd27(_,112)
#include "copycmd.tm" AS cpycmd28(_,116)
#include "copycmd.tm" AS cpycmd29(_,120)
#include "copycmd.tm" AS cpycmd30(_,124)
#include "copycmd.tm" AS cpycmd31(_,128)
#include "copycmd.tm" AS cpycmd32(_,132)
#include "copycmd.tm" AS cpycmd33(_,136)
#include "copycmd.tm" AS cpycmd34(_,140)
#include "copycmd.tm" AS cpycmd35(_,144)
#include "copycmd.tm" AS cpycmd36(_,148)
#include "copycmd.tm" AS cpycmd37(_,152)
#include "copycmd.tm" AS cpycmd38(_,156)
#include "copycmd.tm" AS cpycmd39(_,160)
#include "copycmd.tm" AS cpycmd40(_,164)
#include "copycmd.tm" AS cpycmd41(_,168)
#include "copycmd.tm" AS cpycmd42(_,172)
#include "copycmd.tm" AS cpycmd43(_,176)
#include "copycmd.tm" AS cpycmd44(_,180)
#include "copycmd.tm" AS cpycmd45(_,184)
#include "copycmd.tm" AS cpycmd46(_,188)
#include "copycmd.tm" AS cpycmd47(_,192)
#include "copycmd.tm" AS cpycmd48(_,196)
#include "copycmd.tm" AS cpycmd49(_,200)
#include "copycmd.tm" AS cpycmd50(_,204)
#include "copycmd.tm" AS cpycmd51(_,208)
#include "copycmd.tm" AS cpycmd52(_,212)
#include "copycmd.tm" AS cpycmd53(_,216)
#include "copycmd.tm" AS cpycmd54(_,220)
#include "copycmd.tm" AS cpycmd55(_,224)
#include "copycmd.tm" AS cpycmd56(_,228)
#include "copycmd.tm" AS cpycmd57(_,232)
#include "copycmd.tm" AS cpycmd58(_,236)
#include "copycmd.tm" AS cpycmd59(_,240)
#include "copycmd.tm" AS cpycmd60(_,244)
#include "copycmd.tm" AS cpycmd61(_,248)
#include "copycmd.tm" AS cpycmd62(_,252)
#include "copycmd.tm" AS cpycmd63(_,256)
#include "copycmd.tm" AS cpycmd64(_,260)
#include "copycmd.tm" AS cpycmd65(_,264)
#include "copycmd.tm" AS cpycmd66(_,268)
#include "copycmd.tm" AS cpycmd67(_,272)
#include "copycmd.tm" AS cpycmd68(_,276)
#include "copycmd.tm" AS cpycmd69(_,280)
#include "copycmd.tm" AS cpycmd70(_,284)
#include "copycmd.tm" AS cpycmd71(_,288)
#include "copycmd.tm" AS cpycmd72(_,292)
#include "copycmd.tm" AS cpycmd73(_,296)
#include "copycmd.tm" AS cpycmd74(_,300)
#include "copycmd.tm" AS cpycmd75(_,304)
#include "copycmd.tm" AS cpycmd76(_,308)
#include "copycmd.tm" AS cpycmd77(_,312)
#include "copycmd.tm" AS cpycmd78(_,316)
#include "copycmd.tm" AS cpycmd79(_,320)
#include "copycmd.tm" AS cpycmd80(_,324)
#include "copycmd.tm" AS cpycmd81(_,328)
#include "copycmd.tm" AS cpycmd82(_,332)
#include "copycmd.tm" AS cpycmd83(_,336)
#include "copycmd.tm" AS cpycmd84(_,340)
#include "copycmd.tm" AS cpycmd85(_,344)
#include "copycmd.tm" AS cpycmd86(_,348)
#include "copycmd.tm" AS cpycmd87(_,352)
#include "copycmd.tm" AS cpycmd88(_,356)
#include "copycmd.tm" AS cpycmd89(_,360)
#include "copycmd.tm" AS cpycmd90(_,364)
#include "copycmd.tm" AS cpycmd91(_,368)
#include "copycmd.tm" AS cpycmd92(_,372)
#include "copycmd.tm" AS cpycmd93(_,376)
#include "copycmd.tm" AS cpycmd94(_,380)
#include "copycmd.tm" AS cpycmd95(_,384)
#include "copycmd.tm" AS cpycmd96(_,388)
#include "copycmd.tm" AS cpycmd97(_,392)
#include "copycmd.tm" AS cpycmd98(_,396)
#include "copycmd.tm" AS cpycmd99(_,400)
#include "copycmd.tm" AS cpycmd100(_,404)
#include "copycmd.tm" AS cpycmd101(_,408)
#include "copycmd.tm" AS cpycmd102(_,412)
#include "copycmd.tm" AS cpycmd103(_,416)
#include "copycmd.tm" AS cpycmd104(_,420)
#include "copycmd.tm" AS cpycmd105(_,424)
#include "copycmd.tm" AS cpycmd106(_,428)
#include "copycmd.tm" AS cpycmd107(_,432)
#include "copycmd.tm" AS cpycmd108(_,436)
#include "copycmd.tm" AS cpycmd109(_,440)
#include "copycmd.tm" AS cpycmd110(_,444)
#include "copycmd.tm" AS cpycmd111(_,448)
#include "copycmd.tm" AS cpycmd112(_,452)
#include "copycmd.tm" AS cpycmd113(_,456)
#include "copycmd.tm" AS cpycmd114(_,460)
#include "copycmd.tm" AS cpycmd115(_,464)
#include "copycmd.tm" AS cpycmd116(_,468)
#include "copycmd.tm" AS cpycmd117(_,472)
#include "copycmd.tm" AS cpycmd118(_,476)
#include "copycmd.tm" AS cpycmd119(_,480)
#include "copycmd.tm" AS cpycmd120(_,484)
#include "copycmd.tm" AS cpycmd121(_,488)
#include "copycmd.tm" AS cpycmd122(_,492)
#include "copycmd.tm" AS cpycmd123(_,496)
#include "copycmd.tm" AS cpycmd124(_,500)
#include "copycmd.tm" AS cpycmd125(_,504)
#include "copycmd.tm" AS cpycmd126(_,508)
#include "copycmd.tm" AS cpycmd127(_,512)
#include "copycmd.tm" AS cpycmd128(_,516)
#include "copycmd.tm" AS cpycmd129(_,520)
#include "copycmd.tm" AS cpycmd130(_,524)
#include "copycmd.tm" AS cpycmd131(_,528)
#include "copycmd.tm" AS cpycmd132(_,532)
#include "copycmd.tm" AS cpycmd133(_,536)
#include "copycmd.tm" AS cpycmd134(_,540)
#include "copycmd.tm" AS cpycmd135(_,544)
#include "copycmd.tm" AS cpycmd136(_,548)
#include "copycmd.tm" AS cpycmd137(_,552)
#include "copycmd.tm" AS cpycmd138(_,556)
#include "copycmd.tm" AS cpycmd139(_,560)
#include "copycmd.tm" AS cpycmd140(_,564)
#include "copycmd.tm" AS cpycmd141(_,568)
#include "copycmd.tm" AS cpycmd142(_,572)
#include "copycmd.tm" AS cpycmd143(_,576)
#include "copycmd.tm" AS cpycmd144(_,580)
#include "copycmd.tm" AS cpycmd145(_,584)
#include "copycmd.tm" AS cpycmd146(_,588)
#include "copycmd.tm" AS cpycmd147(_,592)
#include "copycmd.tm" AS cpycmd148(_,596)
#include "copycmd.tm" AS cpycmd149(_,600)
#include "copycmd.tm" AS cpycmd150(_,604)
#include "copycmd.tm" AS cpycmd151(_,608)
#include "copycmd.tm" AS cpycmd152(_,612)
#include "copycmd.tm" AS cpycmd153(_,616)
#include "copycmd.tm" AS cpycmd154(_,620)
#include "copycmd.tm" AS cpycmd155(_,624)
#include "copycmd.tm" AS cpycmd156(_,628)
#include "copycmd.tm" AS cpycmd157(_,632)
#include "copycmd.tm" AS cpycmd158(_,636)
#include "copycmd.tm" AS cpycmd159(_,640)
#include "copycmd.tm" AS cpycmd160(_,644)
#include "copycmd.tm" AS cpycmd161(_,648)
#include "copycmd.tm" AS cpycmd162(_,652)
#include "copycmd.tm" AS cpycmd163(_,656)
#include "copycmd.tm" AS cpycmd164(_,660)
#include "copycmd.tm" AS cpycmd165(_,664)
#include "copycmd.tm" AS cpycmd166(_,668)
#include "copycmd.tm" AS cpycmd167(_,672)
#include "copycmd.tm" AS cpycmd168(_,676)
#include "copycmd.tm" AS cpycmd169(_,680)
#include "copycmd.tm" AS cpycmd170(_,684)
#include "copycmd.tm" AS cpycmd171(_,688)
#include "copycmd.tm" AS cpycmd172(_,692)
#include "copycmd.tm" AS cpycmd173(_,696)
#include "copycmd.tm" AS cpycmd174(_,700)
#include "copycmd.tm" AS cpycmd175(_,704)
#include "copycmd.tm" AS cpycmd176(_,708)
#include "copycmd.tm" AS cpycmd177(_,712)
#include "copycmd.tm" AS cpycmd178(_,716)
#include "copycmd.tm" AS cpycmd179(_,720)
#include "copycmd.tm" AS cpycmd180(_,724)
#include "copycmd.tm" AS cpycmd181(_,728)
#include "copycmd.tm" AS cpycmd182(_,732)
#include "copycmd.tm" AS cpycmd183(_,736)
#include "copycmd.tm" AS cpycmd184(_,740)
#include "copycmd.tm" AS cpycmd185(_,744)
#include "copycmd.tm" AS cpycmd186(_,748)
#include "copycmd.tm" AS cpycmd187(_,752)
#include "copycmd.tm" AS cpycmd188(_,756)
#include "copycmd.tm" AS cpycmd189(_,760)
#include "copycmd.tm" AS cpycmd190(_,764)
#include "copycmd.tm" AS cpycmd191(_,768)
#include "copycmd.tm" AS cpycmd192(_,772)
#include "copycmd.tm" AS cpycmd193(_,776)
#include "copycmd.tm" AS cpycmd194(_,780)
#include "copycmd.tm" AS cpycmd195(_,784)
#include "copycmd.tm" AS cpycmd196(_,788)
#include "copycmd.tm" AS cpycmd197(_,792)
#include "copycmd.tm" AS cpycmd198(_,796)
#include "copycmd.tm" AS cpycmd199(_,800)
#include "copycmd.tm" AS cpycmd200(_,804)
#include "copycmd.tm" AS cpycmd201(_,808)
#include "copycmd.tm" AS cpycmd202(_,812)
#include "copycmd.tm" AS cpycmd203(_,816)
#include "copycmd.tm" AS cpycmd204(_,820)
#include "copycmd.tm" AS cpycmd205(_,824)
#include "copycmd.tm" AS cpycmd206(_,828)
#include "copycmd.tm" AS cpycmd207(_,832)
#include "copycmd.tm" AS cpycmd208(_,836)
#include "copycmd.tm" AS cpycmd209(_,840)
#include "copycmd.tm" AS cpycmd210(_,844)
#include "copycmd.tm" AS cpycmd211(_,848)
#include "copycmd.tm" AS cpycmd212(_,852)
#include "copycmd.tm" AS cpycmd213(_,856)
#include "copycmd.tm" AS cpycmd214(_,860)
#include "copycmd.tm" AS cpycmd215(_,864)
#include "copycmd.tm" AS cpycmd216(_,868)
#include "copycmd.tm" AS cpycmd217(_,872)
#include "copycmd.tm" AS cpycmd218(_,876)
#include "copycmd.tm" AS cpycmd219(_,880)
#include "copycmd.tm" AS cpycmd220(_,884)
#include "copycmd.tm" AS cpycmd221(_,888)
#include "copycmd.tm" AS cpycmd222(_,892)
#include "copycmd.tm" AS cpycmd223(_,896)
#include "copycmd.tm" AS cpycmd224(_,900)
#include "copycmd.tm" AS cpycmd225(_,904)
#include "copycmd.tm" AS cpycmd226(_,908)
#include "copycmd.tm" AS cpycmd227(_,912)
#include "copycmd.tm" AS cpycmd228(_,916)
#include "copycmd.tm" AS cpycmd229(_,920)
#include "copycmd.tm" AS cpycmd230(_,924)
#include "copycmd.tm" AS cpycmd231(_,928)
#include "copycmd.tm" AS cpycmd232(_,932)
#include "copycmd.tm" AS cpycmd233(_,936)
#include "copycmd.tm" AS cpycmd234(_,940)
#include "copycmd.tm" AS cpycmd235(_,944)
#include "copycmd.tm" AS cpycmd236(_,948)
#include "copycmd.tm" AS cpycmd237(_,952)
#include "copycmd.tm" AS cpycmd238(_,956)
#include "copycmd.tm" AS cpycmd239(_,960)
#include "copycmd.tm" AS cpycmd240(_,964)
#include "copycmd.tm" AS cpycmd241(_,968)
#include "copycmd.tm" AS cpycmd242(_,972)
#include "copycmd.tm" AS cpycmd243(_,976)
#include "copycmd.tm" AS cpycmd244(_,980)
#include "copycmd.tm" AS cpycmd245(_,984)
#include "copycmd.tm" AS cpycmd246(_,988)
#include "copycmd.tm" AS cpycmd247(_,992)
#include "copycmd.tm" AS cpycmd248(_,996)
#include "copycmd.tm" AS cpycmd249(_,1000)
#include "copycmd.tm" AS cpycmd250(_,1004)
#include "copycmd.tm" AS cpycmd251(_,1008)
#include "copycmd.tm" AS cpycmd252(_,1012)
#include "copycmd.tm" AS cpycmd253(_,1016)
#include "copycmd.tm" AS cpycmd254(_,1020)
#include "copycmd.tm" AS cpycmd255(_,1024)

#include INTERNAL

name: toymain
init: boot/load
accept: halt

boot/finish,*,*,-,run
run,0,1,<,cpy0
cpy0,0,0,<,cpycmd0/run
cpy0,1,1,<,cpycmd16/run
cpy0,2,2,<,cpycmd32/run
cpy0,3,3,<,cpycmd48/run
cpy0,4,4,<,cpycmd64/run
cpy0,5,5,<,cpycmd80/run
cpy0,6,6,<,cpycmd96/run
cpy0,7,7,<,cpycmd112/run
cpy0,8,8,<,cpycmd128/run
cpy0,9,9,<,cpycmd144/run
cpy0,A,A,<,cpycmd160/run
cpy0,B,B,<,cpycmd176/run
cpy0,C,C,<,cpycmd192/run
cpy0,D,D,<,cpycmd208/run
cpy0,E,E,<,cpycmd224/run
cpy0,F,F,<,cpycmd240/run

run,1,2,<,cpy1
cpy1,0,0,<,cpycmd1/run
cpy1,1,1,<,cpycmd17/run
cpy1,2,2,<,cpycmd33/run
cpy1,3,3,<,cpycmd49/run
cpy1,4,4,<,cpycmd65/run
cpy1,5,5,<,cpycmd81/run
cpy1,6,6,<,cpycmd97/run
cpy1,7,7,<,cpycmd113/run
cpy1,8,8,<,cpycmd129/run
cpy1,9,9,<,cpycmd145/run
cpy1,A,A,<,cpycmd161/run
cpy1,B,B,<,cpycmd177/run
cpy1,C,C,<,cpycmd193/run
cpy1,D,D,<,cpycmd209/run
cpy1,E,E,<,cpycmd225/run
cpy1,F,F,<,cpycmd241/run

run,2,3,<,cpy2
cpy2,0,0,<,cpycmd2/run
cpy2,1,1,<,cpycmd18/run
cpy2,2,2,<,cpycmd34/run
cpy2,3,3,<,cpycmd50/run
cpy2,4,4,<,cpycmd66/run
cpy2,5,5,<,cpycmd82/run
cpy2,6,6,<,cpycmd98/run
cpy2,7,7,<,cpycmd114/run
cpy2,8,8,<,cpycmd130/run
cpy2,9,9,<,cpycmd146/run
cpy2,A,A,<,cpycmd162/run
cpy2,B,B,<,cpycmd178/run
cpy2,C,C,<,cpycmd194/run
cpy2,D,D,<,cpycmd210/run
cpy2,E,E,<,cpycmd226/run
cpy2,F,F,<,cpycmd242/run

run,3,4,<,cpy3
cpy3,0,0,<,cpycmd3/run
cpy3,1,1,<,cpycmd19/run
cpy3,2,2,<,cpycmd35/run
cpy3,3,3,<,cpycmd51/run
cpy3,4,4,<,cpycmd67/run
cpy3,5,5,<,cpycmd83/run
cpy3,6,6,<,cpycmd99/run
cpy3,7,7,<,cpycmd115/run
cpy3,8,8,<,cpycmd131/run
cpy3,9,9,<,cpycmd147/run
cpy3,A,A,<,cpycmd163/run
cpy3,B,B,<,cpycmd179/run
cpy3,C,C,<,cpycmd195/run
cpy3,D,D,<,cpycmd211/run
cpy3,E,E,<,cpycmd227/run
cpy3,F,F,<,cpycmd243/run

run,4,5,<,cpy4
cpy4,0,0,<,cpycmd4/run
cpy4,1,1,<,cpycmd20/run
cpy4,2,2,<,cpycmd36/run
cpy4,3,3,<,cpycmd52/run
cpy4,4,4,<,cpycmd68/run
cpy4,5,5,<,cpycmd84/run
cpy4,6,6,<,cpycmd100/run
cpy4,7,7,<,cpycmd116/run
cpy4,8,8,<,cpycmd132/run
cpy4,9,9,<,cpycmd148/run
cpy4,A,A,<,cpycmd164/run
cpy4,B,B,<,cpycmd180/run
cpy4,C,C,<,cpycmd196/run
cpy4,D,D,<,cpycmd212/run
cpy4,E,E,<,cpycmd228/run
cpy4,F,F,<,cpycmd244/run

run,5,6,<,cpy5
cpy5,0,0,<,cpycmd5/run
cpy5,1,1,<,cpycmd21/run
cpy5,2,2,<,cpycmd37/run
cpy5,3,3,<,cpycmd53/run
cpy5,4,4,<,cpycmd69/run
cpy5,5,5,<,cpycmd85/run
cpy5,6,6,<,cpycmd101/run
cpy5,7,7,<,cpycmd117/run
cpy5,8,8,<,cpycmd133/run
cpy5,9,9,<,cpycmd149/run
cpy5,A,A,<,cpycmd165/run
cpy5,B,B,<,cpycmd181/run
cpy5,C,C,<,cpycmd197/run
cpy5,D,D,<,cpycmd213/run
cpy5,E,E,<,cpycmd229/run
cpy5,F,F,<,cpycmd245/run

run,6,7,<,cpy6
cpy6,0,0,<,cpycmd6/run
cpy6,1,1,<,cpycmd22/run
cpy6,2,2,<,cpycmd38/run
cpy6,3,3,<,cpycmd54/run
cpy6,4,4,<,cpycmd70/run
cpy6,5,5,<,cpycmd86/run
cpy6,6,6,<,cpycmd102/run
cpy6,7,7,<,cpycmd118/run
cpy6,8,8,<,cpycmd134/run
cpy6,9,9,<,cpycmd150/run
cpy6,A,A,<,cpycmd166/run
cpy6,B,B,<,cpycmd182/run
cpy6,C,C,<,cpycmd198/run
cpy6,D,D,<,cpycmd214/run
cpy6,E,E,<,cpycmd230/run
cpy6,F,F,<,cpycmd246/run

run,7,8,<,cpy7
cpy7,0,0,<,cpycmd7/run
cpy7,1,1,<,cpycmd23/run
cpy7,2,2,<,cpycmd39/run
cpy7,3,3,<,cpycmd55/run
cpy7,4,4,<,cpycmd71/run
cpy7,5,5,<,cpycmd87/run
cpy7,6,6,<,cpycmd103/run
cpy7,7,7,<,cpycmd119/run
cpy7,8,8,<,cpycmd135/run
cpy7,9,9,<,cpycmd151/run
cpy7,A,A,<,cpycmd167/run
cpy7,B,B,<,cpycmd183/run
cpy7,C,C,<,cpycmd199/run
cpy7,D,D,<,cpycmd215/run
cpy7,E,E,<,cpycmd231/run
cpy7,F,F,<,cpycmd247/run

run,8,9,<,cpy8
cpy8,0,0,<,cpycmd8/run
cpy8,1,1,<,cpycmd24/run
cpy8,2,2,<,cpycmd40/run
cpy8,3,3,<,cpycmd56/run
cpy8,4,4,<,cpycmd72/run
cpy8,5,5,<,cpycmd88/run
cpy8,6,6,<,cpycmd104/run
cpy8,7,7,<,cpycmd120/run
cpy8,8,8,<,cpycmd136/run
cpy8,9,9,<,cpycmd152/run
cpy8,A,A,<,cpycmd168/run
cpy8,B,B,<,cpycmd184/run
cpy8,C,C,<,cpycmd200/run
cpy8,D,D,<,cpycmd216/run
cpy8,E,E,<,cpycmd232/run
cpy8,F,F,<,cpycmd248/run

run,9,A,<,cpy9
cpy9,0,0,<,cpycmd9/run
cpy9,1,1,<,cpycmd25/run
cpy9,2,2,<,cpycmd41/run
cpy9,3,3,<,cpycmd57/run
cpy9,4,4,<,cpycmd73/run
cpy9,5,5,<,cpycmd89/run
cpy9,6,6,<,cpycmd105/run
cpy9,7,7,<,cpycmd121/run
cpy9,8,8,<,cpycmd137/run
cpy9,9,9,<,cpycmd153/run
cpy9,A,A,<,cpycmd169/run
cpy9,B,B,<,cpycmd185/run
cpy9,C,C,<,cpycmd201/run
cpy9,D,D,<,cpycmd217/run
cpy9,E,E,<,cpycmd233/run
cpy9,F,F,<,cpycmd249/run

run,A,B,<,cpy10
cpy10,0,0,<,cpycmd10/run
cpy10,1,1,<,cpycmd26/run
cpy10,2,2,<,cpycmd42/run
cpy10,3,3,<,cpycmd58/run
cpy10,4,4,<,cpycmd74/run
cpy10,5,5,<,cpycmd90/run
cpy10,6,6,<,cpycmd106/run
cpy10,7,7,<,cpycmd122/run
cpy10,8,8,<,cpycmd138/run
cpy10,9,9,<,cpycmd154/run
cpy10,A,A,<,cpycmd170/run
cpy10,B,B,<,cpycmd186/run
cpy10,C,C,<,cpycmd202/run
cpy10,D,D,<,cpycmd218/run
cpy10,E,E,<,cpycmd234/run
cpy10,F,F,<,cpycmd250/run

run,B,C,<,cpy11
cpy11,0,0,<,cpycmd11/run
cpy11,1,1,<,cpycmd27/run
cpy11,2,2,<,cpycmd43/run
cpy11,3,3,<,cpycmd59/run
cpy11,4,4,<,cpycmd75/run
cpy11,5,5,<,cpycmd91/run
cpy11,6,6,<,cpycmd107/run
cpy11,7,7,<,cpycmd123/run
cpy11,8,8,<,cpycmd139/run
cpy11,9,9,<,cpycmd155/run
cpy11,A,A,<,cpycmd171/run
cpy11,B,B,<,cpycmd187/run
cpy11,C,C,<,cpycmd203/run
cpy11,D,D,<,cpycmd219/run
cpy11,E,E,<,cpycmd235/run
cpy11,F,F,<,cpycmd251/run

run,C,D,<,cpy12
cpy12,0,0,<,cpycmd12/run
cpy12,1,1,<,cpycmd28/run
cpy12,2,2,<,cpycmd44/run
cpy12,3,3,<,cpycmd60/run
cpy12,4,4,<,cpycmd76/run
cpy12,5,5,<,cpycmd92/run
cpy12,6,6,<,cpycmd108/run
cpy12,7,7,<,cpycmd124/run
cpy12,8,8,<,cpycmd140/run
cpy12,9,9,<,cpycmd156/run
cpy12,A,A,<,cpycmd172/run
cpy12,B,B,<,cpycmd188/run
cpy12,C,C,<,cpycmd204/run
cpy12,D,D,<,cpycmd220/run
cpy12,E,E,<,cpycmd236/run
cpy12,F,F,<,cpycmd252/run

run,D,E,<,cpy13
cpy13,0,0,<,cpycmd13/run
cpy13,1,1,<,cpycmd29/run
cpy13,2,2,<,cpycmd45/run
cpy13,3,3,<,cpycmd61/run
cpy13,4,4,<,cpycmd77/run
cpy13,5,5,<,cpycmd93/run
cpy13,6,6,<,cpycmd109/run
cpy13,7,7,<,cpycmd125/run
cpy13,8,8,<,cpycmd141/run
cpy13,9,9,<,cpycmd157/run
cpy13,A,A,<,cpycmd173/run
cpy13,B,B,<,cpycmd189/run
cpy13,C,C,<,cpycmd205/run
cpy13,D,D,<,cpycmd221/run
cpy13,E,E,<,cpycmd237/run
cpy13,F,F,<,cpycmd253/run

run,E,F,<,cpy14
cpy14,0,0,<,cpycmd14/run
cpy14,1,1,<,cpycmd30/run
cpy14,2,2,<,cpycmd46/run
cpy14,3,3,<,cpycmd62/run
cpy14,4,4,<,cpycmd78/run
cpy14,5,5,<,cpycmd94/run
cpy14,6,6,<,cpycmd110/run
cpy14,7,7,<,cpycmd126/run
cpy14,8,8,<,cpycmd142/run
cpy14,9,9,<,cpycmd158/run
cpy14,A,A,<,cpycmd174/run
cpy14,B,B,<,cpycmd190/run
cpy14,C,C,<,cpycmd206/run
cpy14,D,D,<,cpycmd222/run
cpy14,E,E,<,cpycmd238/run
cpy14,F,F,<,cpycmd254/run

run,F,0,<,cpy15
cpy15,0,1,<,cpycmd15/run
cpy15,1,2,<,cpycmd31/run
cpy15,2,3,<,cpycmd47/run
cpy15,3,4,<,cpycmd63/run
cpy15,4,5,<,cpycmd79/run
cpy15,5,6,<,cpycmd95/run
cpy15,6,7,<,cpycmd111/run
cpy15,7,8,<,cpycmd127/run
cpy15,8,9,<,cpycmd143/run
cpy15,9,A,<,cpycmd159/run
cpy15,A,B,<,cpycmd175/run
cpy15,B,C,<,cpycmd191/run
cpy15,C,D,<,cpycmd207/run
cpy15,D,E,<,cpycmd223/run
cpy15,E,F,<,cpycmd239/run
cpy15,F,0,<,cpycmd255/run
