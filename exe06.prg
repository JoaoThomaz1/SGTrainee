// Joao Vitor Rodrigues Thomaz

Set color to N/BG

Clear

Setmode(25,80)
Set scoreboard off
set date to british
set epoch to 1930
set century on

//Variavel
cNomeAluno := space(10)
nNota1     := 0
nNota2     := 0
nNota3     := 0

//Cabecalho
@ 06,12 to 20,68 double
@ 07,21 to 09,59 double
@ 12,13 to 12,67

@ 08,22 say "Massachussets Institute of technology"
@ 10,25 say "Bimonthly Notes of Student"

//Entrada do Usuario
@ 10,52 get cNomeAluno picture "@!" valid !Empty(cNomeAluno)
Read

@ 10,52 say cNomeAluno

//Notas Bimestrais
@ 14,15 say "English Grade: "
@ 14,33 say "History Grade: "
@ 14,53 say "Math Grade: "

//Entrada do Usuario
@ 14,29 get nNota1 picture "999" valid !Empty(nNota1)
@ 14,47 get nNota2 picture "999" valid !Empty(nNota2)
@ 14,64 get nNota3 picture "999" valid !Empty(nNota3)
Read

@ 14,29 say Transform(nNota1, "999")
@ 14,47 say Transform(nNota2, "999")
@ 14,64 say Transform(nNota3, "999")

@ 03,29 to 05,56
@ 04,30 say "Wait, calculating grade..." 

Inkey(4)
@ 03,02 clear to 05,80

nMedia := (nNota1 + nNota2 + nNota3)/3

@ 15,29 to 17,50
@ 16,30 say "Student Average: " + Alltrim(Transform(nMedia, "999"))

Inkey(0)