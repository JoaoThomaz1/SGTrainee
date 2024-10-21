// Joao Vitor Rodrigues Thomaz

Set color to B/W

Clear

Setmode(25,80)

Set scoreboard off
Set Date to British
Set Epoch to 1930
Set Century On

//Variavel
cLetra          := Space(1)
dDataUsuario    := cTod("")
nNumeroInteiro  := 00
nNumeroDecimal  := 0
cString         := space(5)

@ 05,18 to 20,60 double

@ 11,30 say "Letra...........: "
@ 12,30 say "Data............: "
@ 13,30 say "Numero Inteiro..: "
@ 14,30 say "Numero Decimal..: "
@ 15,30 say "String..........: "

@ 11,48 get cLetra         picture "@!"          valid !Empty(cLetra)
@ 12,48 get dDataUsuario
@ 13,47 get nNumeroInteiro picture "999"         valid !Empty(nNumeroInteiro)
@ 14,48 get nNumeroDecimal picture "9.99"        valid !Empty(nNumeroDecimal)
@ 15,48 get cString        picture "@!"          valid !Empty(cString)
read

Inkey(0)