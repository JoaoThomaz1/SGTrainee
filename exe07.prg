// Joao Vitor Rodrigues Thomaz

Set color to N/BG

Clear

Setmode(25,80)
Set scoreboard off
Set date to british
Set Epoch to 1930
Set century on

//Variaveis
nNumero1       := 0
nNumero2       := 0

//Cabecalho
@ 05,10 to 20,65 double

@ 07,17 say "Operacoes Matematicas com 2 Numeros Inteiros"

@ 11,16 to 19,60
@ 13,17 to 13,59
@ 15,17 to 15,59
@ 17,17 to 17,59

@ 09,32 say "Numero 1: "
@ 10,32 say "Numero 2: "

@ 12,18 say "Adicao: "
@ 14,18 say "Subtracao: "
@ 16,18 say "Divisao: "
@ 18,18 say "Multiplicacao: "

//Entrada do Usuario
@ 09,42 get nNumero1 picture "999999" valid !Empty(nNumero1)
@ 10,42 get nNumero2 picture "999999" valid !Empty(nNumero2)
read

@ 09,42 say Transform(nNumero1, "999999")
@ 10,42 say Transform(nNumero2, "999999")

//Operacoes matematicas
nAdicao         := nNumero1 + nNumero2
nSubtracao      := nNumero1 - nNumero2
nDivisao        := nNumero1 / nNumero2
nMultiplicacao  := nNumero1 * nNumero2


@ 21,25 say "Aguarde, Calculando ....."

Inkey(3)
@ 21,25 clear to 21,60

@ 12,33 say AllTrim(str(nNumero1)) + " + " + AllTrim(str(nNumero2)) + " = " + Alltrim(str(nAdicao)) 
@ 14,33 say AllTrim(str(nNumero1)) + " - " + AllTrim(str(nNumero2)) + " = " + Alltrim(str(nSubtracao))
@ 16,33 say AllTrim(str(nNumero1)) + " / " + AllTrim(str(nNumero2)) + " = " + Alltrim(str(nDivisao))
@ 18,33 say AllTrim(str(nNumero1)) + " X " + AllTrim(str(nNumero2)) + " = " + Alltrim(str(nMultiplicacao))

Inkey(0)