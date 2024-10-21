// Joao Vitor Rodrigues Thomaz

set color to N/BG

clear 

Setmode(25,80)
Set scoreboard off
set date to british
set epoch to 1930
set century on

//Variaveis
cResponsavel    := Space(10)
cProduto        := "Leite Longa Vida."
nEstoqueFilialA := 27
nEstoqueFilialB := 24
nFilialA        := 0
nFilialB        := 0
dData           := date()

//Cabecalho
@ 07,10 to 19,11 color("N/N")
@ 19,12 to 19,65 color("N/N")
@ 06,12 to 18,67 double //comando para fazer moldura; //caso queira 1 linha apenas, só retirar o double;


@ 07,13 say "*               SUPERMERCADO BOM DIA                 *"
@ 08,13 say "************(TRANSFERENCIA ENTRE FILIAIS)*************"
@ 09,13 say "*                                                    *"
@ 10,13 say "*        Transferencias entre as filiais   e  .      *"
@ 11,13 say "*                                                    *"

//Entrada do Usuario
@ 10,53 get nFilialA picture "99" valid !Empty(nFilialA)
@ 10,57 get nFilialB picture "99" valid !Empty(nFilialB)
read

@ 10,53 say Transform(nFilialA, "99")
@ 10,57 say Transform(nFilialB, "99")

//Cabecalho
@ 12,13 say "* Data da Transferencia: " + DToC(dData)
@ 12,66 say "*"
@ 13,13 say "*                                                    *"
@ 14,13 say "* Responsavel:                                       *"
@ 15,13 say "* Produto: " + AllTrim(cProduto)
@ 15,66 say "*"
@ 16,13 say "* Quantidade Filial" + Transform(nFilialA, "99") + ": " + AllTrim(Str(nEstoqueFilialA))
@ 16,66 say "*"
@ 17,13 say "* Quantidade Filial" + Transform(nFilialB, "99") + ": " + AllTrim(Str(nEstoqueFilialB))
@ 17,66 say "*"

//Entrada do Usuario
@ 14,28 get cResponsavel picture "@!" valid !Empty(cResponsavel)
read

@ 14,28 clear to 14,38

@ 14,28 say cResponsavel

@ 04,20 say "Aguarde, Realizando a Transferencia...."

Inkey(3)

//Troca dos numeros
nEstoqueFilialA := (nEstoqueFilialB:= nEstoqueFilialA + nEstoqueFilialB ) - nEstoqueFilialA
nEstoqueFilialB := nEstoqueFilialB - nEstoqueFilialA

//nEstoqueFilialA := nEstoqueFilialA + nEstoqueFilialB
//nEstoqueFilialB := nEstoqueFilialA - nEstoqueFilialB
//nEstoqueFilialA := nEstoqueFilialA - nEstoqueFilialB

@ 04,20 clear to 04,70
@ 16,14 clear to 16,65
@ 17,14 clear to 17,65

@ 16,13 say "* Quantidade Filial" + Transform(nFilialA, "99") + " Pos-Troca: " + AllTrim(Str(nEstoqueFilialA))
@ 17,13 say "* Quantidade Filial" + Transform(nFilialB, "99") + " Pos-Troca: " + AllTrim(Str(nEstoqueFilialB))


Inkey(0)