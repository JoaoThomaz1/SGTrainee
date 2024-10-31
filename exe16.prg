//Joao Vitor Rodrigues Thomaz
Set Color to W/RB+

Clear

//Dados Usuario
cNome              := Space(20)

//Pictures e Validadores
nLinha             := 04
nLinha2            := 07
nLinha3            := nLinha
nContagem          := 1
nRepeticao         := 0
cPictureContagem   := "999"
cPictureCaracter   := "@!"

//Cores
cCorInicial        := "W/RB+"

//Molduras e Divisoes
@ nLinha++,08 to nLinha2--,45 double

//Cabecalho Programa
@ nLinha ,10 say "NOME: "
@ nLinha2,10 say "QUANTAS VEZES QUER QUE REPITA? "

//Get do Cabecalho
@ nLinha ,16 get cNome      picture cPictureCaracter valid !Empty(cNome)  color( cCorInicial )
@ nLinha2,40 get nRepeticao picture cPictureContagem valid nRepeticao > 0 color( cCorInicial )
read

//Repeticao de acordo com o escolhido
do while nContagem < nRepeticao + 1
    @ nLinha++,47 say Transform(nContagem++, cPictureContagem ) + " " + AllTrim( cNome )
enddo

@ nLinha3,46 to nLinha++,70 double

Inkey(0)