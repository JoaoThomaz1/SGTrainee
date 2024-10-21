Clear

Set scoreboard off

Set epoch to 1930
Set date british

/*
dData     := cTod("")
dDataHoje := Date()

@ 02,02 to 10,45 double

@ 03,13 say "Conferencia para CNH"
@ 05,05 say "A seguir insira sua data de nascimento:"
@ 07,03 say "Data de Nascimento: "

@ 07,23 get dData
Read

@ 09,10 say "Aquarde a analise..."

Inkey(3)
*/

nIdade := 0

@ 02,02 to 10,45 double

@ 03,13 say "Conferencia para CNH"
@ 05,05 say "A seguir insira sua data de nascimento:"
@ 07,03 say "Data de Nascimento: "

@ 07,23 get nIdade picture '999' valid nIdade > 0
Read

@ 09,10 say "Aquarde a analise..."
Inkey(1)

@ 09,27 clear to 09,30
Inkey(1)

@ 09,27 say "..."
Inkey(1)

@ 09,27 clear to 09,30
Inkey(1)

@ 09,27 say "..."

Inkey(3)

Clear

@ 02,02 to 06,60 double

If nIdade > 21

   cTexto := "PARABENS, VOCE ESTA APTO A CARTEIRA DE MOTORISTA!"

ElseIf nIdade > 16 .and. nIdade < 21

   cTexto := "PARABENS, VOCE ESTA APTO A CARTEIRA PROVISORIA!!"

Else

   cTexto := "INFELIZMENTE VOCE NAO POSSUI A IDADE NECESSARIA!"

Endif

@ 04,08 say cTexto picture "@!"

Inkey(0)

