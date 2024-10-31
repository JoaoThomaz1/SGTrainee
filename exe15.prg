//Joao Vitor Rodrigues Thomaz

Set Color to W/RB+

Clear

//Dados
cNome            := Space(20)

//Pictures e Validadores
nLinha           := 5
nContagem        := 0
cPictureCaracter := "@!"
cPictureContagem := "99"

//Cores
cCorInicial      := "W/RB+"

//Molduras e Divisoes
@ 03,08 to 07,43 double

//Cabecalho
@ nLinha,10 say "NOME: "

//Get do Nome
@ nLinha,16 get cNome picture cPictureCaracter valid !Empty(cNome) color (cCorInicial)
read

//Laco de repeticao do nome
do while nContagem < 10
    @ nLinha++,46 say Transform(nContagem++, cPictureContagem) + " - " + AllTrim( cNome )  
enddo

@ 03,44 to 16,70 double 

Inkey(0)