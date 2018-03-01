name: preparecalc
init: run
accept: end

//copy Rs to the working space (converted to binary)
//copy Rt to the working space (converted to binary)
//pointer stays at last bit

run,y,y,>,conv1
run,*,*,>,run
//assume working space is clean
conv1,0,0,>10,set10
conv1,1,1,>10,set11
conv1,2,2,>10,set12
conv1,3,3,>10,set13
conv1,4,4,>10,set14
conv1,5,5,>10,set15
conv1,6,6,>10,set16
conv1,7,7,>10,set17
conv1,8,8,>10,set18
conv1,9,9,>10,set19
conv1,A,A,>10,set1A
conv1,B,B,>10,set1B
conv1,C,C,>10,set1C
conv1,D,D,>10,set1D
conv1,E,E,>10,set1E
conv1,F,F,>10,set1F

set10,*,0,>,set10b
set10b,*,0,>,set10c
set10c,*,0,>,set10d
set10d,*,0,<,back2

set11,*,0,>,set11b
set11b,*,0,>,set11c
set11c,*,0,>,set11d
set11d,*,1,<,back2

set12,*,0,>,set12b
set12b,*,0,>,set12c
set12c,*,1,>,set12d
set12d,*,0,<,back2

set13,*,0,>,set13b
set13b,*,0,>,set13c
set13c,*,1,>,set13d
set13d,*,1,<,back2

set14,*,0,>,set14b
set14b,*,1,>,set14c
set14c,*,0,>,set14d
set14d,*,0,<,back2

set15,*,0,>,set15b
set15b,*,1,>,set15c
set15c,*,0,>,set15d
set15d,*,1,<,back2

set16,*,0,>,set16b
set16b,*,1,>,set16c
set16c,*,1,>,set16d
set16d,*,0,<,back2

set17,*,0,>,set17b
set17b,*,1,>,set17c
set17c,*,1,>,set17d
set17d,*,1,<,back2

set18,*,1,>,set18b
set18b,*,0,>,set18c
set18c,*,0,>,set18d
set18d,*,0,<,back2

set19,*,1,>,set19b
set19b,*,0,>,set19c
set19c,*,0,>,set19d
set19d,*,1,<,back2

set1A,*,1,>,set1Ab
set1Ab,*,0,>,set1Ac
set1Ac,*,1,>,set1Ad
set1Ad,*,0,<,back2

set12,*,0,>,set12b
set12b,*,0,>,set12c
set12c,*,1,>,set12d
set12d,*,0,<,back2

set1B,*,1,>,set1Bb
set1Bb,*,0,>,set1Bc
set1Bc,*,1,>,set1Bd
set1Bd,*,1,<,back2

set1C,*,1,>,set1Cb
set1Cb,*,1,>,set1Cc
set1Cc,*,0,>,set1Cd
set1Cd,*,0,<,back2

set1D,*,1,>,set1Db
set1Db,*,1,>,set1Dc
set1Dc,*,0,>,set1Dd
set1Dd,*,1,<,back2

set1E,*,1,>,set1Eb
set1Eb,*,1,>,set1Ec
set1Ec,*,1,>,set1Ed
set1Ed,*,0,<,back2

set1F,*,1,>,set1Fb
set1Fb,*,1,>,set1Fc
set1Fc,*,1,>,set1Fd
set1Fd,*,1,<,back2

back2,y,y,>2,conv2
back2,*,*,<,back2

//---convert nibble 2

conv2,0,0,>,conv3
conv2,1,1,>13,set21
conv2,2,2,>13,set22
conv2,3,3,>13,set23
conv2,4,4,>13,set24
conv2,5,5,>13,set25
conv2,6,6,>13,set26
conv2,7,7,>13,set27
conv2,8,8,>13,set28
conv2,9,9,>13,set29
conv2,A,A,>13,set2A
conv2,B,B,>13,set2B
conv2,C,C,>13,set2C
conv2,D,D,>13,set2D
conv2,E,E,>13,set2E
conv2,F,F,>13,set2F

set21,*,0,>,set21b
set21b,*,0,>,set21c
set21c,*,0,>,set21d
set21d,*,1,<,back3

set22,*,0,>,set22b
set22b,*,0,>,set22c
set22c,*,1,>,set22d
set22d,*,0,<,back3

set23,*,0,>,set23b
set23b,*,0,>,set23c
set23c,*,1,>,set23d
set23d,*,1,<,back3

set24,*,0,>,set24b
set24b,*,1,>,set24c
set24c,*,0,>,set24d
set24d,*,0,<,back3

set25,*,0,>,set25b
set25b,*,1,>,set25c
set25c,*,0,>,set25d
set25d,*,1,<,back3

set26,*,0,>,set26b
set26b,*,1,>,set26c
set26c,*,1,>,set26d
set26d,*,0,<,back3

set27,*,0,>,set27b
set27b,*,1,>,set27c
set27c,*,1,>,set27d
set27d,*,1,<,back3

set28,*,1,>,set28b
set28b,*,0,>,set28c
set28c,*,0,>,set28d
set28d,*,0,<,back3

set29,*,1,>,set29b
set29b,*,0,>,set29c
set29c,*,0,>,set29d
set29d,*,1,<,back3

set2A,*,1,>,set2Ab
set2Ab,*,0,>,set2Ac
set2Ac,*,1,>,set2Ad
set2Ad,*,0,<,back3

set22,*,0,>,set22b
set22b,*,0,>,set22c
set22c,*,1,>,set22d
set22d,*,0,<,back3

set2B,*,1,>,set2Bb
set2Bb,*,0,>,set2Bc
set2Bc,*,1,>,set2Bd
set2Bd,*,1,<,back3

set2C,*,1,>,set2Cb
set2Cb,*,1,>,set2Cc
set2Cc,*,0,>,set2Cd
set2Cd,*,0,<,back3

set2D,*,1,>,set2Db
set2Db,*,1,>,set2Dc
set2Dc,*,0,>,set2Dd
set2Dd,*,1,<,back3

set2E,*,1,>,set2Eb
set2Eb,*,1,>,set2Ec
set2Ec,*,1,>,set2Ed
set2Ed,*,0,<,back3

set2F,*,1,>,set2Fb
set2Fb,*,1,>,set2Fc
set2Fc,*,1,>,set2Fd
set2Fd,*,1,<,back3

back3,y,y,>3,conv3
back3,*,*,<,back3

//----convert nibble 3

conv3,0,0,>,conv4
conv3,1,1,>16,set31
conv3,2,2,>16,set32
conv3,3,3,>16,set33
conv3,4,4,>16,set34
conv3,5,5,>16,set35
conv3,6,6,>16,set36
conv3,7,7,>16,set37
conv3,8,8,>16,set38
conv3,9,9,>16,set39
conv3,A,A,>16,set3A
conv3,B,B,>16,set3B
conv3,C,C,>16,set3C
conv3,D,D,>16,set3D
conv3,E,E,>16,set3E
conv3,F,F,>16,set3F

set31,*,0,>,set31b
set31b,*,0,>,set31c
set31c,*,0,>,set31d
set31d,*,1,<,back4

set32,*,0,>,set32b
set32b,*,0,>,set32c
set32c,*,1,>,set32d
set32d,*,0,<,back4

set33,*,0,>,set33b
set33b,*,0,>,set33c
set33c,*,1,>,set33d
set33d,*,1,<,back4

set34,*,0,>,set34b
set34b,*,1,>,set34c
set34c,*,0,>,set34d
set34d,*,0,<,back4

set35,*,0,>,set35b
set35b,*,1,>,set35c
set35c,*,0,>,set35d
set35d,*,1,<,back4

set36,*,0,>,set36b
set36b,*,1,>,set36c
set36c,*,1,>,set36d
set36d,*,0,<,back4

set37,*,0,>,set37b
set37b,*,1,>,set37c
set37c,*,1,>,set37d
set37d,*,1,<,back4

set38,*,1,>,set38b
set38b,*,0,>,set38c
set38c,*,0,>,set38d
set38d,*,0,<,back4

set39,*,1,>,set39b
set39b,*,0,>,set39c
set39c,*,0,>,set39d
set39d,*,1,<,back4

set3A,*,1,>,set3Ab
set3Ab,*,0,>,set3Ac
set3Ac,*,1,>,set3Ad
set3Ad,*,0,<,back4

set32,*,0,>,set32b
set32b,*,0,>,set32c
set32c,*,1,>,set32d
set32d,*,0,<,back4

set3B,*,1,>,set3Bb
set3Bb,*,0,>,set3Bc
set3Bc,*,1,>,set3Bd
set3Bd,*,1,<,back4

set3C,*,1,>,set3Cb
set3Cb,*,1,>,set3Cc
set3Cc,*,0,>,set3Cd
set3Cd,*,0,<,back4

set3D,*,1,>,set3Db
set3Db,*,1,>,set3Dc
set3Dc,*,0,>,set3Dd
set3Dd,*,1,<,back4

set3E,*,1,>,set3Eb
set3Eb,*,1,>,set3Ec
set3Ec,*,1,>,set3Ed
set3Ed,*,0,<,back4

set3F,*,1,>,set3Fb
set3Fb,*,1,>,set3Fc
set3Fc,*,1,>,set3Fd
set3Fd,*,1,<,back4

back4,y,y,>4,conv4
back4,*,*,<,back4

//----convert nibble 4

conv4,0,0,>23,putplus
conv4,1,1,>19,set41
conv4,2,2,>19,set42
conv4,3,3,>19,set43
conv4,4,4,>19,set44
conv4,5,5,>19,set45
conv4,6,6,>19,set46
conv4,7,7,>19,set47
conv4,8,8,>19,set48
conv4,9,9,>19,set49
conv4,A,A,>19,set4A
conv4,B,B,>19,set4B
conv4,C,C,>19,set4C
conv4,D,D,>19,set4D
conv4,E,E,>19,set4E
conv4,F,F,>19,set4F

set41,*,0,>,set41b
set41b,*,0,>,set41c
set41c,*,0,>,set41d
set41d,*,1,>,putplus

set42,*,0,>,set42b
set42b,*,0,>,set42c
set42c,*,1,>,set42d
set42d,*,0,>,putplus

set43,*,0,>,set43b
set43b,*,0,>,set43c
set43c,*,1,>,set43d
set43d,*,1,>,putplus

set44,*,0,>,set44b
set44b,*,1,>,set44c
set44c,*,0,>,set44d
set44d,*,0,>,putplus

set45,*,0,>,set45b
set45b,*,1,>,set45c
set45c,*,0,>,set45d
set45d,*,1,>,putplus

set46,*,0,>,set46b
set46b,*,1,>,set46c
set46c,*,1,>,set46d
set46d,*,0,>,putplus

set47,*,0,>,set47b
set47b,*,1,>,set47c
set47c,*,1,>,set47d
set47d,*,1,>,putplus

set48,*,1,>,set48b
set48b,*,0,>,set48c
set48c,*,0,>,set48d
set48d,*,0,>,putplus

set49,*,1,>,set49b
set49b,*,0,>,set49c
set49c,*,0,>,set49d
set49d,*,1,>,putplus

set4A,*,1,>,set4Ab
set4Ab,*,0,>,set4Ac
set4Ac,*,1,>,set4Ad
set4Ad,*,0,>,putplus

set42,*,0,>,set42b
set42b,*,0,>,set42c
set42c,*,1,>,set42d
set42d,*,0,>,putplus

set4B,*,1,>,set4Bb
set4Bb,*,0,>,set4Bc
set4Bc,*,1,>,set4Bd
set4Bd,*,1,>,putplus

set4C,*,1,>,set4Cb
set4Cb,*,1,>,set4Cc
set4Cc,*,0,>,set4Cd
set4Cd,*,0,>,putplus

set4D,*,1,>,set4Db
set4Db,*,1,>,set4Dc
set4Dc,*,0,>,set4Dd
set4Dd,*,1,>,putplus

set4E,*,1,>,set4Eb
set4Eb,*,1,>,set4Ec
set4Ec,*,1,>,set4Ed
set4Ed,*,0,>,putplus

set4F,*,1,>,set4Fb
set4Fb,*,1,>,set4Fc
set4Fc,*,1,>,set4Fd
set4Fd,*,1,>,putplus

putplus,*,+,<,convrt
convrt,z,z,>,rtconv1
convrt,*,*,<,convrt

///---convert Rt

rtconv1,0,0,>,rtconv2
rtconv1,1,1,>22,rtset11
rtconv1,2,2,>22,rtset12
rtconv1,3,3,>22,rtset13
rtconv1,4,4,>22,rtset14
rtconv1,5,5,>22,rtset15
rtconv1,6,6,>22,rtset16
rtconv1,7,7,>22,rtset17
rtconv1,8,8,>22,rtset18
rtconv1,9,9,>22,rtset19
rtconv1,A,A,>22,rtset1A
rtconv1,B,B,>22,rtset1B
rtconv1,C,C,>22,rtset1C
rtconv1,D,D,>22,rtset1D
rtconv1,E,E,>22,rtset1E
rtconv1,F,F,>22,rtset1F

rtset11,*,0,>,rtset11b
rtset11b,*,0,>,rtset11c
rtset11c,*,0,>,rtset11d
rtset11d,*,1,<,rtback2

rtset12,*,0,>,rtset12b
rtset12b,*,0,>,rtset12c
rtset12c,*,1,>,rtset12d
rtset12d,*,0,<,rtback2

rtset13,*,0,>,rtset13b
rtset13b,*,0,>,rtset13c
rtset13c,*,1,>,rtset13d
rtset13d,*,1,<,rtback2

rtset14,*,0,>,rtset14b
rtset14b,*,1,>,rtset14c
rtset14c,*,0,>,rtset14d
rtset14d,*,0,<,rtback2

rtset15,*,0,>,rtset15b
rtset15b,*,1,>,rtset15c
rtset15c,*,0,>,rtset15d
rtset15d,*,1,<,rtback2

rtset16,*,0,>,rtset16b
rtset16b,*,1,>,rtset16c
rtset16c,*,1,>,rtset16d
rtset16d,*,0,<,rtback2

rtset17,*,0,>,rtset17b
rtset17b,*,1,>,rtset17c
rtset17c,*,1,>,rtset17d
rtset17d,*,1,<,rtback2

rtset18,*,1,>,rtset18b
rtset18b,*,0,>,rtset18c
rtset18c,*,0,>,rtset18d
rtset18d,*,0,<,rtback2

rtset19,*,1,>,rtset19b
rtset19b,*,0,>,rtset19c
rtset19c,*,0,>,rtset19d
rtset19d,*,1,<,rtback2

rtset1A,*,1,>,rtset1Ab
rtset1Ab,*,0,>,rtset1Ac
rtset1Ac,*,1,>,rtset1Ad
rtset1Ad,*,0,<,rtback2

rtset12,*,0,>,rtset12b
rtset12b,*,0,>,rtset12c
rtset12c,*,1,>,rtset12d
rtset12d,*,0,<,rtback2

rtset1B,*,1,>,rtset1Bb
rtset1Bb,*,0,>,rtset1Bc
rtset1Bc,*,1,>,rtset1Bd
rtset1Bd,*,1,<,rtback2

rtset1C,*,1,>,rtset1Cb
rtset1Cb,*,1,>,rtset1Cc
rtset1Cc,*,0,>,rtset1Cd
rtset1Cd,*,0,<,rtback2

rtset1D,*,1,>,rtset1Db
rtset1Db,*,1,>,rtset1Dc
rtset1Dc,*,0,>,rtset1Dd
rtset1Dd,*,1,<,rtback2

rtset1E,*,1,>,rtset1Eb
rtset1Eb,*,1,>,rtset1Ec
rtset1Ec,*,1,>,rtset1Ed
rtset1Ed,*,0,<,rtback2

rtset1F,*,1,>,rtset1Fb
rtset1Fb,*,1,>,rtset1Fc
rtset1Fc,*,1,>,rtset1Fd
rtset1Fd,*,1,<,rtback2

rtback2,z,z,>2,rtconv2
rtback2,*,*,<,rtback2

//---rtconvert nibble 2

rtconv2,0,0,>,rtconv3
rtconv2,1,1,>25,rtset21
rtconv2,2,2,>25,rtset22
rtconv2,3,3,>25,rtset23
rtconv2,4,4,>25,rtset24
rtconv2,5,5,>25,rtset25
rtconv2,6,6,>25,rtset26
rtconv2,7,7,>25,rtset27
rtconv2,8,8,>25,rtset28
rtconv2,9,9,>25,rtset29
rtconv2,A,A,>25,rtset2A
rtconv2,B,B,>25,rtset2B
rtconv2,C,C,>25,rtset2C
rtconv2,D,D,>25,rtset2D
rtconv2,E,E,>25,rtset2E
rtconv2,F,F,>25,rtset2F

rtset21,*,0,>,rtset21b
rtset21b,*,0,>,rtset21c
rtset21c,*,0,>,rtset21d
rtset21d,*,1,<,rtback3

rtset22,*,0,>,rtset22b
rtset22b,*,0,>,rtset22c
rtset22c,*,1,>,rtset22d
rtset22d,*,0,<,rtback3

rtset23,*,0,>,rtset23b
rtset23b,*,0,>,rtset23c
rtset23c,*,1,>,rtset23d
rtset23d,*,1,<,rtback3

rtset24,*,0,>,rtset24b
rtset24b,*,1,>,rtset24c
rtset24c,*,0,>,rtset24d
rtset24d,*,0,<,rtback3

rtset25,*,0,>,rtset25b
rtset25b,*,1,>,rtset25c
rtset25c,*,0,>,rtset25d
rtset25d,*,1,<,rtback3

rtset26,*,0,>,rtset26b
rtset26b,*,1,>,rtset26c
rtset26c,*,1,>,rtset26d
rtset26d,*,0,<,rtback3

rtset27,*,0,>,rtset27b
rtset27b,*,1,>,rtset27c
rtset27c,*,1,>,rtset27d
rtset27d,*,1,<,rtback3

rtset28,*,1,>,rtset28b
rtset28b,*,0,>,rtset28c
rtset28c,*,0,>,rtset28d
rtset28d,*,0,<,rtback3

rtset29,*,1,>,rtset29b
rtset29b,*,0,>,rtset29c
rtset29c,*,0,>,rtset29d
rtset29d,*,1,<,rtback3

rtset2A,*,1,>,rtset2Ab
rtset2Ab,*,0,>,rtset2Ac
rtset2Ac,*,1,>,rtset2Ad
rtset2Ad,*,0,<,rtback3

rtset22,*,0,>,rtset22b
rtset22b,*,0,>,rtset22c
rtset22c,*,1,>,rtset22d
rtset22d,*,0,<,rtback3

rtset2B,*,1,>,rtset2Bb
rtset2Bb,*,0,>,rtset2Bc
rtset2Bc,*,1,>,rtset2Bd
rtset2Bd,*,1,<,rtback3

rtset2C,*,1,>,rtset2Cb
rtset2Cb,*,1,>,rtset2Cc
rtset2Cc,*,0,>,rtset2Cd
rtset2Cd,*,0,<,rtback3

rtset2D,*,1,>,rtset2Db
rtset2Db,*,1,>,rtset2Dc
rtset2Dc,*,0,>,rtset2Dd
rtset2Dd,*,1,<,rtback3

rtset2E,*,1,>,rtset2Eb
rtset2Eb,*,1,>,rtset2Ec
rtset2Ec,*,1,>,rtset2Ed
rtset2Ed,*,0,<,rtback3

rtset2F,*,1,>,rtset2Fb
rtset2Fb,*,1,>,rtset2Fc
rtset2Fc,*,1,>,rtset2Fd
rtset2Fd,*,1,<,rtback3

rtback3,z,z,>3,rtconv3
rtback3,*,*,<,rtback3

//----rtconvert nibble 3

rtconv3,0,0,>,rtconv4
rtconv3,1,1,>28,rtset31
rtconv3,2,2,>28,rtset32
rtconv3,3,3,>28,rtset33
rtconv3,4,4,>28,rtset34
rtconv3,5,5,>28,rtset35
rtconv3,6,6,>28,rtset36
rtconv3,7,7,>28,rtset37
rtconv3,8,8,>28,rtset38
rtconv3,9,9,>28,rtset39
rtconv3,A,A,>28,rtset3A
rtconv3,B,B,>28,rtset3B
rtconv3,C,C,>28,rtset3C
rtconv3,D,D,>28,rtset3D
rtconv3,E,E,>28,rtset3E
rtconv3,F,F,>28,rtset3F

rtset31,*,0,>,rtset31b
rtset31b,*,0,>,rtset31c
rtset31c,*,0,>,rtset31d
rtset31d,*,1,<,rtback4

rtset32,*,0,>,rtset32b
rtset32b,*,0,>,rtset32c
rtset32c,*,1,>,rtset32d
rtset32d,*,0,<,rtback4

rtset33,*,0,>,rtset33b
rtset33b,*,0,>,rtset33c
rtset33c,*,1,>,rtset33d
rtset33d,*,1,<,rtback4

rtset34,*,0,>,rtset34b
rtset34b,*,1,>,rtset34c
rtset34c,*,0,>,rtset34d
rtset34d,*,0,<,rtback4

rtset35,*,0,>,rtset35b
rtset35b,*,1,>,rtset35c
rtset35c,*,0,>,rtset35d
rtset35d,*,1,<,rtback4

rtset36,*,0,>,rtset36b
rtset36b,*,1,>,rtset36c
rtset36c,*,1,>,rtset36d
rtset36d,*,0,<,rtback4

rtset37,*,0,>,rtset37b
rtset37b,*,1,>,rtset37c
rtset37c,*,1,>,rtset37d
rtset37d,*,1,<,rtback4

rtset38,*,1,>,rtset38b
rtset38b,*,0,>,rtset38c
rtset38c,*,0,>,rtset38d
rtset38d,*,0,<,rtback4

rtset39,*,1,>,rtset39b
rtset39b,*,0,>,rtset39c
rtset39c,*,0,>,rtset39d
rtset39d,*,1,<,rtback4

rtset3A,*,1,>,rtset3Ab
rtset3Ab,*,0,>,rtset3Ac
rtset3Ac,*,1,>,rtset3Ad
rtset3Ad,*,0,<,rtback4

rtset32,*,0,>,rtset32b
rtset32b,*,0,>,rtset32c
rtset32c,*,1,>,rtset32d
rtset32d,*,0,<,rtback4

rtset3B,*,1,>,rtset3Bb
rtset3Bb,*,0,>,rtset3Bc
rtset3Bc,*,1,>,rtset3Bd
rtset3Bd,*,1,<,rtback4

rtset3C,*,1,>,rtset3Cb
rtset3Cb,*,1,>,rtset3Cc
rtset3Cc,*,0,>,rtset3Cd
rtset3Cd,*,0,<,rtback4

rtset3D,*,1,>,rtset3Db
rtset3Db,*,1,>,rtset3Dc
rtset3Dc,*,0,>,rtset3Dd
rtset3Dd,*,1,<,rtback4

rtset3E,*,1,>,rtset3Eb
rtset3Eb,*,1,>,rtset3Ec
rtset3Ec,*,1,>,rtset3Ed
rtset3Ed,*,0,<,rtback4

rtset3F,*,1,>,rtset3Fb
rtset3Fb,*,1,>,rtset3Fc
rtset3Fc,*,1,>,rtset3Fd
rtset3Fd,*,1,<,rtback4

rtback4,z,z,>4,rtconv4
rtback4,*,*,<,rtback4

//----rtconvert nibble 4

rtconv4,0,0,>35,end
rtconv4,1,1,>31,rtset41
rtconv4,2,2,>31,rtset42
rtconv4,3,3,>31,rtset43
rtconv4,4,4,>31,rtset44
rtconv4,5,5,>31,rtset45
rtconv4,6,6,>31,rtset46
rtconv4,7,7,>31,rtset47
rtconv4,8,8,>31,rtset48
rtconv4,9,9,>31,rtset49
rtconv4,A,A,>31,rtset4A
rtconv4,B,B,>31,rtset4B
rtconv4,C,C,>31,rtset4C
rtconv4,D,D,>31,rtset4D
rtconv4,E,E,>31,rtset4E
rtconv4,F,F,>31,rtset4F

rtset41,*,0,>,rtset41b
rtset41b,*,0,>,rtset41c
rtset41c,*,0,>,rtset41d
rtset41d,*,1,-,end

rtset42,*,0,>,rtset42b
rtset42b,*,0,>,rtset42c
rtset42c,*,1,>,rtset42d
rtset42d,*,0,-,end

rtset43,*,0,>,rtset43b
rtset43b,*,0,>,rtset43c
rtset43c,*,1,>,rtset43d
rtset43d,*,1,-,end

rtset44,*,0,>,rtset44b
rtset44b,*,1,>,rtset44c
rtset44c,*,0,>,rtset44d
rtset44d,*,0,-,end

rtset45,*,0,>,rtset45b
rtset45b,*,1,>,rtset45c
rtset45c,*,0,>,rtset45d
rtset45d,*,1,-,end

rtset46,*,0,>,rtset46b
rtset46b,*,1,>,rtset46c
rtset46c,*,1,>,rtset46d
rtset46d,*,0,-,end

rtset47,*,0,>,rtset47b
rtset47b,*,1,>,rtset47c
rtset47c,*,1,>,rtset47d
rtset47d,*,1,-,end

rtset48,*,1,>,rtset48b
rtset48b,*,0,>,rtset48c
rtset48c,*,0,>,rtset48d
rtset48d,*,0,-,end

rtset49,*,1,>,rtset49b
rtset49b,*,0,>,rtset49c
rtset49c,*,0,>,rtset49d
rtset49d,*,1,-,end

rtset4A,*,1,>,rtset4Ab
rtset4Ab,*,0,>,rtset4Ac
rtset4Ac,*,1,>,rtset4Ad
rtset4Ad,*,0,-,end

rtset42,*,0,>,rtset42b
rtset42b,*,0,>,rtset42c
rtset42c,*,1,>,rtset42d
rtset42d,*,0,-,end

rtset4B,*,1,>,rtset4Bb
rtset4Bb,*,0,>,rtset4Bc
rtset4Bc,*,1,>,rtset4Bd
rtset4Bd,*,1,-,end

rtset4C,*,1,>,rtset4Cb
rtset4Cb,*,1,>,rtset4Cc
rtset4Cc,*,0,>,rtset4Cd
rtset4Cd,*,0,-,end

rtset4D,*,1,>,rtset4Db
rtset4Db,*,1,>,rtset4Dc
rtset4Dc,*,0,>,rtset4Dd
rtset4Dd,*,1,-,end

rtset4E,*,1,>,rtset4Eb
rtset4Eb,*,1,>,rtset4Ec
rtset4Ec,*,1,>,rtset4Ed
rtset4Ed,*,0,-,end

rtset4F,*,1,>,rtset4Fb
rtset4Fb,*,1,>,rtset4Fc
rtset4Fc,*,1,>,rtset4Fd
rtset4Fd,*,1,-,end