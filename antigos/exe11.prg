Clear

Setmode (25,80)

cNome   := Space(20)
cSexo   := space(1)
nIdade  := 0
cTexto  := "O NADADOR SE ENCONTRA NA CATEGORIA: "
cTexto2 := "SEM CATEGORIA"

@ 02,02 to 15,60 double //estitica

@ 04,03 to 04,59
@ 06,03 to 06,59         //estitica
@ 08,03 to 08,59
@ 10,03 to 10,59

//CLIENTE
@ 03,03 say "Nadador: "
@ 03,45 say "Sexo: "
@ 05,03 say "Idade: "

//CABE€ALHO
@ 07,15 say "|   Clube de Natacao SG   |"

@ 03,11 get cNome  picture '@!'  valid !Empty ( cNome )
@ 03,51 get cSexo  picture '@!'  valid !Empty ( cSexo ).and. cSexo $'MF'
@ 05,11 get nIdade picture '999' valid nIdade > 0
Read

If nIdade >= 5 .and. nIdade <= 7

   cTexto2 := " INFANTIL (A) "

ElseIf nIdade >= 8 .and. nIdade <= 10

   cTexto2 := " INFANTIL (B) "

ElseIf nIdade >= 11 .and. nIdade <= 13

   cTexto2 := " JUVENIL (A) "

ElseIf nIdade >= 14 .and. nIdade <= 17

   cTexto2 := " JUVENIL (B) "

ElseIf nIdade >= 18

   cTexto2 := " SENIOR "

Endif


If cSexo == 'M'

   cTexto3 := "MASCULINO"

else

   cTexto3 := "FEMININO "

Endif

@ 09,12 say cTexto  picture '@!'
@ 12,24 say cTexto2 picture '@!'
@ 13,25 say cTexto3 picture '@!'
Inkey(0)

