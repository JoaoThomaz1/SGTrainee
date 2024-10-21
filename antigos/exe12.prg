Set color to W+/B
Clear

Setmode ( 25,80 )

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0

cNome1   := Space(10)
cNome2   := Space(10)
cNome3   := Space(10)

cSexo1   := Space(1)
cSexo2   := Space(1)
cSexo3   := Space(1)

cTexto   := "O FILHO MAIS VELHO E: "

//Estetica
@ 02,02 to 14,40 double

@ 04,03 to 04,39
@ 06,03 to 06,39
@ 08,03 to 08,39
@ 10,03 to 10,39

//Cabe‡alho
@ 05,03 say "Nome: "
@ 05,20 say "Sexo: "
@ 05,28 say "Idade: "

@ 07,03 say "Nome: "
@ 07,20 say "Sexo: "
@ 07,28 say "Idade: "

@ 09,03 say "Nome: "
@ 09,20 say "Sexo: "
@ 09,28 say "Idade: "

//get's
@ 03,15 say "|   Filhos   |"

@ 05,10 get cNome1   picture '@!'  valid !Empty ( cNome1 )
@ 05,26 get cSexo1   picture '@!'  valid !Empty ( cSexo1 ) .and. cSexo1 $'MF'
@ 05,35 get nNumero1 picture '999' valid nNumero1 > 0
Read

@ 07,10 get cNome2   picture '@!'  valid !Empty ( cNome2 )
@ 07,26 get cSexo2   picture '@!'  valid !Empty ( cSexo2 ) .and. cSexo2 $'MF'
@ 07,35 get nNumero2 picture '999' valid nNumero2 > 0
Read

@ 09,10 get cNome3   picture '@!'  valid !Empty ( cNome3 )
@ 09,26 get cSexo3   picture '@!'  valid !Empty ( cSexo3 ) .and. cSexo3 $'MF'
@ 09,35 get nNumero3 picture '999' valid nNumero3 > 0
Read

nMaior      := nNumero1
cMaisVelho  := cNome1

If nNumero2 > nMaior

   nMaior     := nNumero2
   cMaisVelho := cNome2

Endif

If nNumero3 > nMaior

   nMaior     := nNumero3
   cMaisVelho := cNome3

Endif

@ 11,10 say cTexto   picture '@!'
@ 12,17 say cMaisVelho

Inkey(0)


