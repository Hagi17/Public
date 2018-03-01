//pointer stands on LEFT of 2 Nibbles to be copied (always right from counter)
//at end: pointer stands on right nibble of run
name: copyToCount
init: run
accept: end

run,0,0,>,first0
run,1,1,>,first1
run,2,2,>,first2
run,3,3,>,first3
run,4,4,>,first4
run,5,5,>,first5
run,6,6,>,first6
run,7,7,>,first7
run,8,8,>,first8
run,9,9,>,first9
run,A,A,>,firstA
run,B,B,>,firstB
run,C,C,>,firstC
run,D,D,>,firstD
run,E,E,>,firstE
run,F,F,>,firstF

first0,0,0,<,set00
set00,s,s,>,put00
set00,*,*,<,set00
put00,*,0,>,put0
put0,*,0,-,end

first0,1,1,<,set01
set01,s,s,>,put01
set01,*,*,<,set01
put01,*,0,>,put1
put1,*,1,-,end
first0,2,2,<,set02
set02,s,s,>,put02
set02,*,*,<,set02
put02,*,0,>,put2
put2,*,2,-,end
first0,3,3,<,set03
set03,s,s,>,put03
set03,*,*,<,set03
put03,*,0,>,put3
put3,*,3,-,end
first0,4,4,<,set04
set04,s,s,>,put04
set04,*,*,<,set04
put04,*,0,>,put4
put4,*,4,-,end
first0,5,5,<,set05
set05,s,s,>,put05
set05,*,*,<,set05
put05,*,0,>,put5
put5,*,5,-,end
first0,6,6,<,set06
set06,s,s,>,put06
set06,*,*,<,set06
put06,*,0,>,put6
put6,*,6,-,end
first0,7,7,<,set07
set07,s,s,>,put07
set07,*,*,<,set07
put07,*,0,>,put7
put7,*,7,-,end
first0,8,8,<,set08
set08,s,s,>,put08
set08,*,*,<,set08
put08,*,0,>,put8
put8,*,8,-,end
first0,9,9,<,set09
set09,s,s,>,put09
set09,*,*,<,set09
put09,*,0,>,put9
put9,*,9,-,end
first0,A,A,<,set0A
set0A,s,s,>,put0A
set0A,*,*,<,set0A
put0A,*,0,>,putA
putA,*,A,-,end
first0,B,B,<,set0B
set0B,s,s,>,put0B
set0B,*,*,<,set0B
put0B,*,0,>,putB
putB,*,B,-,end
first0,C,C,<,set0C
set0C,s,s,>,put0C
set0C,*,*,<,set0C
put0C,*,0,>,putC
putC,*,C,-,end
first0,D,D,<,set0D
set0D,s,s,>,put0D
set0D,*,*,<,set0D
put0D,*,0,>,putD
putD,*,D,-,end
first0,E,E,<,set0E
set0E,s,s,>,put0E
set0E,*,*,<,set0E
put0E,*,0,>,putE
putE,*,E,-,end
first0,F,F,<,set0F
set0F,s,s,>,put0F
set0F,*,*,<,set0F
put0F,*,0,>,putF
putF,*,F,-,end

first1,0,0,<,set10
set10,s,s,>,put10
set10,*,*,<,set10
put10,*,1,>,put0
first1,1,1,<,set11
set11,s,s,>,put11
set11,*,*,<,set11
put11,*,1,>,put1
first1,2,2,<,set12
set12,s,s,>,put12
set12,*,*,<,set12
put12,*,1,>,put2
first1,3,3,<,set13
set13,s,s,>,put13
set13,*,*,<,set13
put13,*,1,>,put3
first1,4,4,<,set14
set14,s,s,>,put14
set14,*,*,<,set14
put14,*,1,>,put4
first1,5,5,<,set15
set15,s,s,>,put15
set15,*,*,<,set15
put15,*,1,>,put5
first1,6,6,<,set16
set16,s,s,>,put16
set16,*,*,<,set16
put16,*,1,>,put6
first1,7,7,<,set17
set17,s,s,>,put17
set17,*,*,<,set17
put17,*,1,>,put7
first1,8,8,<,set18
set18,s,s,>,put18
set18,*,*,<,set18
put18,*,1,>,put8
first1,9,9,<,set19
set19,s,s,>,put19
set19,*,*,<,set19
put19,*,1,>,put9
first1,A,A,<,set1A
set1A,s,s,>,put1A
set1A,*,*,<,set1A
put1A,*,1,>,putA
first1,B,B,<,set1B
set1B,s,s,>,put1B
set1B,*,*,<,set1B
put1B,*,1,>,putB
first1,C,C,<,set1C
set1C,s,s,>,put1C
set1C,*,*,<,set1C
put1C,*,1,>,putC
first1,D,D,<,set1D
set1D,s,s,>,put1D
set1D,*,*,<,set1D
put1D,*,1,>,putD
first1,E,E,<,set1E
set1E,s,s,>,put1E
set1E,*,*,<,set1E
put1E,*,1,>,putE
first1,F,F,<,set1F
set1F,s,s,>,put1F
set1F,*,*,<,set1F
put1F,*,1,>,putF

first2,0,0,<,set20
set20,s,s,>,put20
set20,*,*,<,set20
put20,*,2,>,put0
first2,1,1,<,set21
set21,s,s,>,put21
set21,*,*,<,set21
put21,*,2,>,put1
first2,2,2,<,set22
set22,s,s,>,put22
set22,*,*,<,set22
put22,*,2,>,put2
first2,3,3,<,set23
set23,s,s,>,put23
set23,*,*,<,set23
put23,*,2,>,put3
first2,4,4,<,set24
set24,s,s,>,put24
set24,*,*,<,set24
put24,*,2,>,put4
first2,5,5,<,set25
set25,s,s,>,put25
set25,*,*,<,set25
put25,*,2,>,put5
first2,6,6,<,set26
set26,s,s,>,put26
set26,*,*,<,set26
put26,*,2,>,put6
first2,7,7,<,set27
set27,s,s,>,put27
set27,*,*,<,set27
put27,*,2,>,put7
first2,8,8,<,set28
set28,s,s,>,put28
set28,*,*,<,set28
put28,*,2,>,put8
first2,9,9,<,set29
set29,s,s,>,put29
set29,*,*,<,set29
put29,*,2,>,put9
first2,A,A,<,set2A
set2A,s,s,>,put2A
set2A,*,*,<,set2A
put2A,*,2,>,putA
first2,B,B,<,set2B
set2B,s,s,>,put2B
set2B,*,*,<,set2B
put2B,*,2,>,putB
first2,C,C,<,set2C
set2C,s,s,>,put2C
set2C,*,*,<,set2C
put2C,*,2,>,putC
first2,D,D,<,set2D
set2D,s,s,>,put2D
set2D,*,*,<,set2D
put2D,*,2,>,putD
first2,E,E,<,set2E
set2E,s,s,>,put2E
set2E,*,*,<,set2E
put2E,*,2,>,putE
first2,F,F,<,set2F
set2F,s,s,>,put2F
set2F,*,*,<,set2F
put2F,*,2,>,putF

first3,0,0,<,set30
set30,s,s,>,put30
set30,*,*,<,set30
put30,*,3,>,put0
first3,1,1,<,set31
set31,s,s,>,put31
set31,*,*,<,set31
put31,*,3,>,put1
first3,2,2,<,set32
set32,s,s,>,put32
set32,*,*,<,set32
put32,*,3,>,put2
first3,3,3,<,set33
set33,s,s,>,put33
set33,*,*,<,set33
put33,*,3,>,put3
first3,4,4,<,set34
set34,s,s,>,put34
set34,*,*,<,set34
put34,*,3,>,put4
first3,5,5,<,set35
set35,s,s,>,put35
set35,*,*,<,set35
put35,*,3,>,put5
first3,6,6,<,set36
set36,s,s,>,put36
set36,*,*,<,set36
put36,*,3,>,put6
first3,7,7,<,set37
set37,s,s,>,put37
set37,*,*,<,set37
put37,*,3,>,put7
first3,8,8,<,set38
set38,s,s,>,put38
set38,*,*,<,set38
put38,*,3,>,put8
first3,9,9,<,set39
set39,s,s,>,put39
set39,*,*,<,set39
put39,*,3,>,put9
first3,A,A,<,set3A
set3A,s,s,>,put3A
set3A,*,*,<,set3A
put3A,*,3,>,putA
first3,B,B,<,set3B
set3B,s,s,>,put3B
set3B,*,*,<,set3B
put3B,*,3,>,putB
first3,C,C,<,set3C
set3C,s,s,>,put3C
set3C,*,*,<,set3C
put3C,*,3,>,putC
first3,D,D,<,set3D
set3D,s,s,>,put3D
set3D,*,*,<,set3D
put3D,*,3,>,putD
first3,E,E,<,set3E
set3E,s,s,>,put3E
set3E,*,*,<,set3E
put3E,*,3,>,putE
first3,F,F,<,set3F
set3F,s,s,>,put3F
set3F,*,*,<,set3F
put3F,*,3,>,putF

first4,0,0,<,set40
set40,s,s,>,put40
set40,*,*,<,set40
put40,*,4,>,put0
first4,1,1,<,set41
set41,s,s,>,put41
set41,*,*,<,set41
put41,*,4,>,put1
first4,2,2,<,set42
set42,s,s,>,put42
set42,*,*,<,set42
put42,*,4,>,put2
first4,3,3,<,set43
set43,s,s,>,put43
set43,*,*,<,set43
put43,*,4,>,put3
first4,4,4,<,set44
set44,s,s,>,put44
set44,*,*,<,set44
put44,*,4,>,put4
first4,5,5,<,set45
set45,s,s,>,put45
set45,*,*,<,set45
put45,*,4,>,put5
first4,6,6,<,set46
set46,s,s,>,put46
set46,*,*,<,set46
put46,*,4,>,put6
first4,7,7,<,set47
set47,s,s,>,put47
set47,*,*,<,set47
put47,*,4,>,put7
first4,8,8,<,set48
set48,s,s,>,put48
set48,*,*,<,set48
put48,*,4,>,put8
first4,9,9,<,set49
set49,s,s,>,put49
set49,*,*,<,set49
put49,*,4,>,put9
first4,A,A,<,set4A
set4A,s,s,>,put4A
set4A,*,*,<,set4A
put4A,*,4,>,putA
first4,B,B,<,set4B
set4B,s,s,>,put4B
set4B,*,*,<,set4B
put4B,*,4,>,putB
first4,C,C,<,set4C
set4C,s,s,>,put4C
set4C,*,*,<,set4C
put4C,*,4,>,putC
first4,D,D,<,set4D
set4D,s,s,>,put4D
set4D,*,*,<,set4D
put4D,*,4,>,putD
first4,E,E,<,set4E
set4E,s,s,>,put4E
set4E,*,*,<,set4E
put4E,*,4,>,putE
first4,F,F,<,set4F
set4F,s,s,>,put4F
set4F,*,*,<,set4F
put4F,*,4,>,putF

first5,0,0,<,set50
set50,s,s,>,put50
set50,*,*,<,set50
put50,*,5,>,put0
first5,1,1,<,set51
set51,s,s,>,put51
set51,*,*,<,set51
put51,*,5,>,put1
first5,2,2,<,set52
set52,s,s,>,put52
set52,*,*,<,set52
put52,*,5,>,put2
first5,3,3,<,set53
set53,s,s,>,put53
set53,*,*,<,set53
put53,*,5,>,put3
first5,4,4,<,set54
set54,s,s,>,put54
set54,*,*,<,set54
put54,*,5,>,put4
first5,5,5,<,set55
set55,s,s,>,put55
set55,*,*,<,set55
put55,*,5,>,put5
first5,6,6,<,set56
set56,s,s,>,put56
set56,*,*,<,set56
put56,*,5,>,put6
first5,7,7,<,set57
set57,s,s,>,put57
set57,*,*,<,set57
put57,*,5,>,put7
first5,8,8,<,set58
set58,s,s,>,put58
set58,*,*,<,set58
put58,*,5,>,put8
first5,9,9,<,set59
set59,s,s,>,put59
set59,*,*,<,set59
put59,*,5,>,put9
first5,A,A,<,set5A
set5A,s,s,>,put5A
set5A,*,*,<,set5A
put5A,*,5,>,putA
first5,B,B,<,set5B
set5B,s,s,>,put5B
set5B,*,*,<,set5B
put5B,*,5,>,putB
first5,C,C,<,set5C
set5C,s,s,>,put5C
set5C,*,*,<,set5C
put5C,*,5,>,putC
first5,D,D,<,set5D
set5D,s,s,>,put5D
set5D,*,*,<,set5D
put5D,*,5,>,putD
first5,E,E,<,set5E
set5E,s,s,>,put5E
set5E,*,*,<,set5E
put5E,*,5,>,putE
first5,F,F,<,set5F
set5F,s,s,>,put5F
set5F,*,*,<,set5F
put5F,*,5,>,putF

first6,0,0,<,set60
set60,s,s,>,put60
set60,*,*,<,set60
put60,*,6,>,put0
first6,1,1,<,set61
set61,s,s,>,put61
set61,*,*,<,set61
put61,*,6,>,put1
first6,2,2,<,set62
set62,s,s,>,put62
set62,*,*,<,set62
put62,*,6,>,put2
first6,3,3,<,set63
set63,s,s,>,put63
set63,*,*,<,set63
put63,*,6,>,put3
first6,4,4,<,set64
set64,s,s,>,put64
set64,*,*,<,set64
put64,*,6,>,put4
first6,5,5,<,set65
set65,s,s,>,put65
set65,*,*,<,set65
put65,*,6,>,put5
first6,6,6,<,set66
set66,s,s,>,put66
set66,*,*,<,set66
put66,*,6,>,put6
first6,7,7,<,set67
set67,s,s,>,put67
set67,*,*,<,set67
put67,*,6,>,put7
first6,8,8,<,set68
set68,s,s,>,put68
set68,*,*,<,set68
put68,*,6,>,put8
first6,9,9,<,set69
set69,s,s,>,put69
set69,*,*,<,set69
put69,*,6,>,put9
first6,A,A,<,set6A
set6A,s,s,>,put6A
set6A,*,*,<,set6A
put6A,*,6,>,putA
first6,B,B,<,set6B
set6B,s,s,>,put6B
set6B,*,*,<,set6B
put6B,*,6,>,putB
first6,C,C,<,set6C
set6C,s,s,>,put6C
set6C,*,*,<,set6C
put6C,*,6,>,putC
first6,D,D,<,set6D
set6D,s,s,>,put6D
set6D,*,*,<,set6D
put6D,*,6,>,putD
first6,E,E,<,set6E
set6E,s,s,>,put6E
set6E,*,*,<,set6E
put6E,*,6,>,putE
first6,F,F,<,set6F
set6F,s,s,>,put6F
set6F,*,*,<,set6F
put6F,*,6,>,putF

first7,0,0,<,set70
set70,s,s,>,put70
set70,*,*,<,set70
put70,*,7,>,put0
first7,1,1,<,set71
set71,s,s,>,put71
set71,*,*,<,set71
put71,*,7,>,put1
first7,2,2,<,set72
set72,s,s,>,put72
set72,*,*,<,set72
put72,*,7,>,put2
first7,3,3,<,set73
set73,s,s,>,put73
set73,*,*,<,set73
put73,*,7,>,put3
first7,4,4,<,set74
set74,s,s,>,put74
set74,*,*,<,set74
put74,*,7,>,put4
first7,5,5,<,set75
set75,s,s,>,put75
set75,*,*,<,set75
put75,*,7,>,put5
first7,6,6,<,set76
set76,s,s,>,put76
set76,*,*,<,set76
put76,*,7,>,put6
first7,7,7,<,set77
set77,s,s,>,put77
set77,*,*,<,set77
put77,*,7,>,put7
first7,8,8,<,set78
set78,s,s,>,put78
set78,*,*,<,set78
put78,*,7,>,put8
first7,9,9,<,set79
set79,s,s,>,put79
set79,*,*,<,set79
put79,*,7,>,put9
first7,A,A,<,set7A
set7A,s,s,>,put7A
set7A,*,*,<,set7A
put7A,*,7,>,putA
first7,B,B,<,set7B
set7B,s,s,>,put7B
set7B,*,*,<,set7B
put7B,*,7,>,putB
first7,C,C,<,set7C
set7C,s,s,>,put7C
set7C,*,*,<,set7C
put7C,*,7,>,putC
first7,D,D,<,set7D
set7D,s,s,>,put7D
set7D,*,*,<,set7D
put7D,*,7,>,putD
first7,E,E,<,set7E
set7E,s,s,>,put7E
set7E,*,*,<,set7E
put7E,*,7,>,putE
first7,F,F,<,set7F
set7F,s,s,>,put7F
set7F,*,*,<,set7F
put7F,*,7,>,putF

first8,0,0,<,set80
set80,s,s,>,put80
set80,*,*,<,set80
put80,*,8,>,put0
first8,1,1,<,set81
set81,s,s,>,put81
set81,*,*,<,set81
put81,*,8,>,put1
first8,2,2,<,set82
set82,s,s,>,put82
set82,*,*,<,set82
put82,*,8,>,put2
first8,3,3,<,set83
set83,s,s,>,put83
set83,*,*,<,set83
put83,*,8,>,put3
first8,4,4,<,set84
set84,s,s,>,put84
set84,*,*,<,set84
put84,*,8,>,put4
first8,5,5,<,set85
set85,s,s,>,put85
set85,*,*,<,set85
put85,*,8,>,put5
first8,6,6,<,set86
set86,s,s,>,put86
set86,*,*,<,set86
put86,*,8,>,put6
first8,7,7,<,set87
set87,s,s,>,put87
set87,*,*,<,set87
put87,*,8,>,put7
first8,8,8,<,set88
set88,s,s,>,put88
set88,*,*,<,set88
put88,*,8,>,put8
first8,9,9,<,set89
set89,s,s,>,put89
set89,*,*,<,set89
put89,*,8,>,put9
first8,A,A,<,set8A
set8A,s,s,>,put8A
set8A,*,*,<,set8A
put8A,*,8,>,putA
first8,B,B,<,set8B
set8B,s,s,>,put8B
set8B,*,*,<,set8B
put8B,*,8,>,putB
first8,C,C,<,set8C
set8C,s,s,>,put8C
set8C,*,*,<,set8C
put8C,*,8,>,putC
first8,D,D,<,set8D
set8D,s,s,>,put8D
set8D,*,*,<,set8D
put8D,*,8,>,putD
first8,E,E,<,set8E
set8E,s,s,>,put8E
set8E,*,*,<,set8E
put8E,*,8,>,putE
first8,F,F,<,set8F
set8F,s,s,>,put8F
set8F,*,*,<,set8F
put8F,*,8,>,putF

first9,0,0,<,set90
set90,s,s,>,put90
set90,*,*,<,set90
put90,*,9,>,put0
first9,1,1,<,set91
set91,s,s,>,put91
set91,*,*,<,set91
put91,*,9,>,put1
first9,2,2,<,set92
set92,s,s,>,put92
set92,*,*,<,set92
put92,*,9,>,put2
first9,3,3,<,set93
set93,s,s,>,put93
set93,*,*,<,set93
put93,*,9,>,put3
first9,4,4,<,set94
set94,s,s,>,put94
set94,*,*,<,set94
put94,*,9,>,put4
first9,5,5,<,set95
set95,s,s,>,put95
set95,*,*,<,set95
put95,*,9,>,put5
first9,6,6,<,set96
set96,s,s,>,put96
set96,*,*,<,set96
put96,*,9,>,put6
first9,7,7,<,set97
set97,s,s,>,put97
set97,*,*,<,set97
put97,*,9,>,put7
first9,8,8,<,set98
set98,s,s,>,put98
set98,*,*,<,set98
put98,*,9,>,put8
first9,9,9,<,set99
set99,s,s,>,put99
set99,*,*,<,set99
put99,*,9,>,put9
first9,A,A,<,set9A
set9A,s,s,>,put9A
set9A,*,*,<,set9A
put9A,*,9,>,putA
first9,B,B,<,set9B
set9B,s,s,>,put9B
set9B,*,*,<,set9B
put9B,*,9,>,putB
first9,C,C,<,set9C
set9C,s,s,>,put9C
set9C,*,*,<,set9C
put9C,*,9,>,putC
first9,D,D,<,set9D
set9D,s,s,>,put9D
set9D,*,*,<,set9D
put9D,*,9,>,putD
first9,E,E,<,set9E
set9E,s,s,>,put9E
set9E,*,*,<,set9E
put9E,*,9,>,putE
first9,F,F,<,set9F
set9F,s,s,>,put9F
set9F,*,*,<,set9F
put9F,*,9,>,putF

firstA,0,0,<,setA0
setA0,s,s,>,putA0
setA0,*,*,<,setA0
putA0,*,A,>,put0
firstA,1,1,<,setA1
setA1,s,s,>,putA1
setA1,*,*,<,setA1
putA1,*,A,>,put1
firstA,2,2,<,setA2
setA2,s,s,>,putA2
setA2,*,*,<,setA2
putA2,*,A,>,put2
firstA,3,3,<,setA3
setA3,s,s,>,putA3
setA3,*,*,<,setA3
putA3,*,A,>,put3
firstA,4,4,<,setA4
setA4,s,s,>,putA4
setA4,*,*,<,setA4
putA4,*,A,>,put4
firstA,5,5,<,setA5
setA5,s,s,>,putA5
setA5,*,*,<,setA5
putA5,*,A,>,put5
firstA,6,6,<,setA6
setA6,s,s,>,putA6
setA6,*,*,<,setA6
putA6,*,A,>,put6
firstA,7,7,<,setA7
setA7,s,s,>,putA7
setA7,*,*,<,setA7
putA7,*,A,>,put7
firstA,8,8,<,setA8
setA8,s,s,>,putA8
setA8,*,*,<,setA8
putA8,*,A,>,put8
firstA,9,9,<,setA9
setA9,s,s,>,putA9
setA9,*,*,<,setA9
putA9,*,A,>,put9
firstA,A,A,<,setAA
setAA,s,s,>,putAA
setAA,*,*,<,setAA
putAA,*,A,>,putA
firstA,B,B,<,setAB
setAB,s,s,>,putAB
setAB,*,*,<,setAB
putAB,*,A,>,putB
firstA,C,C,<,setAC
setAC,s,s,>,putAC
setAC,*,*,<,setAC
putAC,*,A,>,putC
firstA,D,D,<,setAD
setAD,s,s,>,putAD
setAD,*,*,<,setAD
putAD,*,A,>,putD
firstA,E,E,<,setAE
setAE,s,s,>,putAE
setAE,*,*,<,setAE
putAE,*,A,>,putE
firstA,F,F,<,setAF
setAF,s,s,>,putAF
setAF,*,*,<,setAF
putAF,*,A,>,putF

firstB,0,0,<,setB0
setB0,s,s,>,putB0
setB0,*,*,<,setB0
putB0,*,B,>,put0
firstB,1,1,<,setB1
setB1,s,s,>,putB1
setB1,*,*,<,setB1
putB1,*,B,>,put1
firstB,2,2,<,setB2
setB2,s,s,>,putB2
setB2,*,*,<,setB2
putB2,*,B,>,put2
firstB,3,3,<,setB3
setB3,s,s,>,putB3
setB3,*,*,<,setB3
putB3,*,B,>,put3
firstB,4,4,<,setB4
setB4,s,s,>,putB4
setB4,*,*,<,setB4
putB4,*,B,>,put4
firstB,5,5,<,setB5
setB5,s,s,>,putB5
setB5,*,*,<,setB5
putB5,*,B,>,put5
firstB,6,6,<,setB6
setB6,s,s,>,putB6
setB6,*,*,<,setB6
putB6,*,B,>,put6
firstB,7,7,<,setB7
setB7,s,s,>,putB7
setB7,*,*,<,setB7
putB7,*,B,>,put7
firstB,8,8,<,setB8
setB8,s,s,>,putB8
setB8,*,*,<,setB8
putB8,*,B,>,put8
firstB,9,9,<,setB9
setB9,s,s,>,putB9
setB9,*,*,<,setB9
putB9,*,B,>,put9
firstB,A,A,<,setBA
setBA,s,s,>,putBA
setBA,*,*,<,setBA
putBA,*,B,>,putA
firstB,B,B,<,setBB
setBB,s,s,>,putBB
setBB,*,*,<,setBB
putBB,*,B,>,putB
firstB,C,C,<,setBC
setBC,s,s,>,putBC
setBC,*,*,<,setBC
putBC,*,B,>,putC
firstB,D,D,<,setBD
setBD,s,s,>,putBD
setBD,*,*,<,setBD
putBD,*,B,>,putD
firstB,E,E,<,setBE
setBE,s,s,>,putBE
setBE,*,*,<,setBE
putBE,*,B,>,putE
firstB,F,F,<,setBF
setBF,s,s,>,putBF
setBF,*,*,<,setBF
putBF,*,B,>,putF

firstC,0,0,<,setC0
setC0,s,s,>,putC0
setC0,*,*,<,setC0
putC0,*,C,>,put0
firstC,1,1,<,setC1
setC1,s,s,>,putC1
setC1,*,*,<,setC1
putC1,*,C,>,put1
firstC,2,2,<,setC2
setC2,s,s,>,putC2
setC2,*,*,<,setC2
putC2,*,C,>,put2
firstC,3,3,<,setC3
setC3,s,s,>,putC3
setC3,*,*,<,setC3
putC3,*,C,>,put3
firstC,4,4,<,setC4
setC4,s,s,>,putC4
setC4,*,*,<,setC4
putC4,*,C,>,put4
firstC,5,5,<,setC5
setC5,s,s,>,putC5
setC5,*,*,<,setC5
putC5,*,C,>,put5
firstC,6,6,<,setC6
setC6,s,s,>,putC6
setC6,*,*,<,setC6
putC6,*,C,>,put6
firstC,7,7,<,setC7
setC7,s,s,>,putC7
setC7,*,*,<,setC7
putC7,*,C,>,put7
firstC,8,8,<,setC8
setC8,s,s,>,putC8
setC8,*,*,<,setC8
putC8,*,C,>,put8
firstC,9,9,<,setC9
setC9,s,s,>,putC9
setC9,*,*,<,setC9
putC9,*,C,>,put9
firstC,A,A,<,setCA
setCA,s,s,>,putCA
setCA,*,*,<,setCA
putCA,*,C,>,putA
firstC,B,B,<,setCB
setCB,s,s,>,putCB
setCB,*,*,<,setCB
putCB,*,C,>,putB
firstC,C,C,<,setCC
setCC,s,s,>,putCC
setCC,*,*,<,setCC
putCC,*,C,>,putC
firstC,D,D,<,setCD
setCD,s,s,>,putCD
setCD,*,*,<,setCD
putCD,*,C,>,putD
firstC,E,E,<,setCE
setCE,s,s,>,putCE
setCE,*,*,<,setCE
putCE,*,C,>,putE
firstC,F,F,<,setCF
setCF,s,s,>,putCF
setCF,*,*,<,setCF
putCF,*,C,>,putF

firstD,0,0,<,setD0
setD0,s,s,>,putD0
setD0,*,*,<,setD0
putD0,*,D,>,put0
firstD,1,1,<,setD1
setD1,s,s,>,putD1
setD1,*,*,<,setD1
putD1,*,D,>,put1
firstD,2,2,<,setD2
setD2,s,s,>,putD2
setD2,*,*,<,setD2
putD2,*,D,>,put2
firstD,3,3,<,setD3
setD3,s,s,>,putD3
setD3,*,*,<,setD3
putD3,*,D,>,put3
firstD,4,4,<,setD4
setD4,s,s,>,putD4
setD4,*,*,<,setD4
putD4,*,D,>,put4
firstD,5,5,<,setD5
setD5,s,s,>,putD5
setD5,*,*,<,setD5
putD5,*,D,>,put5
firstD,6,6,<,setD6
setD6,s,s,>,putD6
setD6,*,*,<,setD6
putD6,*,D,>,put6
firstD,7,7,<,setD7
setD7,s,s,>,putD7
setD7,*,*,<,setD7
putD7,*,D,>,put7
firstD,8,8,<,setD8
setD8,s,s,>,putD8
setD8,*,*,<,setD8
putD8,*,D,>,put8
firstD,9,9,<,setD9
setD9,s,s,>,putD9
setD9,*,*,<,setD9
putD9,*,D,>,put9
firstD,A,A,<,setDA
setDA,s,s,>,putDA
setDA,*,*,<,setDA
putDA,*,D,>,putA
firstD,B,B,<,setDB
setDB,s,s,>,putDB
setDB,*,*,<,setDB
putDB,*,D,>,putB
firstD,C,C,<,setDC
setDC,s,s,>,putDC
setDC,*,*,<,setDC
putDC,*,D,>,putC
firstD,D,D,<,setDD
setDD,s,s,>,putDD
setDD,*,*,<,setDD
putDD,*,D,>,putD
firstD,E,E,<,setDE
setDE,s,s,>,putDE
setDE,*,*,<,setDE
putDE,*,D,>,putE
firstD,F,F,<,setDF
setDF,s,s,>,putDF
setDF,*,*,<,setDF
putDF,*,D,>,putF

firstE,0,0,<,setE0
setE0,s,s,>,putE0
setE0,*,*,<,setE0
putE0,*,E,>,put0
firstE,1,1,<,setE1
setE1,s,s,>,putE1
setE1,*,*,<,setE1
putE1,*,E,>,put1
firstE,2,2,<,setE2
setE2,s,s,>,putE2
setE2,*,*,<,setE2
putE2,*,E,>,put2
firstE,3,3,<,setE3
setE3,s,s,>,putE3
setE3,*,*,<,setE3
putE3,*,E,>,put3
firstE,4,4,<,setE4
setE4,s,s,>,putE4
setE4,*,*,<,setE4
putE4,*,E,>,put4
firstE,5,5,<,setE5
setE5,s,s,>,putE5
setE5,*,*,<,setE5
putE5,*,E,>,put5
firstE,6,6,<,setE6
setE6,s,s,>,putE6
setE6,*,*,<,setE6
putE6,*,E,>,put6
firstE,7,7,<,setE7
setE7,s,s,>,putE7
setE7,*,*,<,setE7
putE7,*,E,>,put7
firstE,8,8,<,setE8
setE8,s,s,>,putE8
setE8,*,*,<,setE8
putE8,*,E,>,put8
firstE,9,9,<,setE9
setE9,s,s,>,putE9
setE9,*,*,<,setE9
putE9,*,E,>,put9
firstE,A,A,<,setEA
setEA,s,s,>,putEA
setEA,*,*,<,setEA
putEA,*,E,>,putA
firstE,B,B,<,setEB
setEB,s,s,>,putEB
setEB,*,*,<,setEB
putEB,*,E,>,putB
firstE,C,C,<,setEC
setEC,s,s,>,putEC
setEC,*,*,<,setEC
putEC,*,E,>,putC
firstE,D,D,<,setED
setED,s,s,>,putED
setED,*,*,<,setED
putED,*,E,>,putD
firstE,E,E,<,setEE
setEE,s,s,>,putEE
setEE,*,*,<,setEE
putEE,*,E,>,putE
firstE,F,F,<,setEF
setEF,s,s,>,putEF
setEF,*,*,<,setEF
putEF,*,E,>,putF

firstF,0,0,<,setF0
setF0,s,s,>,putF0
setF0,*,*,<,setF0
putF0,*,F,>,put0
firstF,1,1,<,setF1
setF1,s,s,>,putF1
setF1,*,*,<,setF1
putF1,*,F,>,put1
firstF,2,2,<,setF2
setF2,s,s,>,putF2
setF2,*,*,<,setF2
putF2,*,F,>,put2
firstF,3,3,<,setF3
setF3,s,s,>,putF3
setF3,*,*,<,setF3
putF3,*,F,>,put3
firstF,4,4,<,setF4
setF4,s,s,>,putF4
setF4,*,*,<,setF4
putF4,*,F,>,put4
firstF,5,5,<,setF5
setF5,s,s,>,putF5
setF5,*,*,<,setF5
putF5,*,F,>,put5
firstF,6,6,<,setF6
setF6,s,s,>,putF6
setF6,*,*,<,setF6
putF6,*,F,>,put6
firstF,7,7,<,setF7
setF7,s,s,>,putF7
setF7,*,*,<,setF7
putF7,*,F,>,put7
firstF,8,8,<,setF8
setF8,s,s,>,putF8
setF8,*,*,<,setF8
putF8,*,F,>,put8
firstF,9,9,<,setF9
setF9,s,s,>,putF9
setF9,*,*,<,setF9
putF9,*,F,>,put9
firstF,A,A,<,setFA
setFA,s,s,>,putFA
setFA,*,*,<,setFA
putFA,*,F,>,putA
firstF,B,B,<,setFB
setFB,s,s,>,putFB
setFB,*,*,<,setFB
putFB,*,F,>,putB
firstF,C,C,<,setFC
setFC,s,s,>,putFC
setFC,*,*,<,setFC
putFC,*,F,>,putC
firstF,D,D,<,setFD
setFD,s,s,>,putFD
setFD,*,*,<,setFD
putFD,*,F,>,putD
firstF,E,E,<,setFE
setFE,s,s,>,putFE
setFE,*,*,<,setFE
putFE,*,F,>,putE
firstF,F,F,<,setFF
setFF,s,s,>,putFF
setFF,*,*,<,setFF
putFF,*,F,>,putF