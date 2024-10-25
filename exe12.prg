//Joao Vitor Rodrigues Thomaz

Clear

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0
nMaior	:= 0

cPictureCaracter := "99999"

@ 05,25 say "Numero 1: "
@ 06,25 say "Numero 2: "
@ 07,25 say "Numero 3: "

@ 05,35 get nNumero1 picture cPictureCaracter valid !Empty( nNumero1 )
@ 06,35 get nNumero2 picture cPictureCaracter valid !Empty( nNumero2 )
@ 07,35 get nNumero3 picture cPictureCaracter valid !Empty( nNumero3 )
read

if nNumero1 >= nNumero2 .and. nNumero1 >= nNumero3
   nMaior := nNumero1
elseif   nNumero2 >= nNumero1 .and. nNumero2 >= nNumero3
   nMaior := nNumero2
else
   nMaior := nNumero3
endif

@ 09,20 say "O Maior Numero: " + AllTrim( Str( nMaior ) )

Inkey(0)