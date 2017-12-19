//decrypt using monoalphabetic encryption
//input cipher&$key

name: decryptMono
init: begin
accept: finish

//take a letter from the cipher and go as many chars into the key, depending on the letter
//then set the letter from the key (back to front)