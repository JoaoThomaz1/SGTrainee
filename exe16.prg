//Joao Vitor Rodrigues Thomaz

Clear

cNome      := Space(10)
nContagem  := 1
nLinha     := 10
nRepeticao := 0

@ 08,25 say "Nome: "
@ 09,15 say "Quantas vezes quer que repita? "

@ 08,33 get cNome picture "@!" valid !Empty(cNome)
@ 09,45 get nRepeticao picture "99" valid !Empty(nRepeticao)
read

do while nContagem < nRepeticao + 1

    @ nLinha,25 say AllTrim(Str(nContagem)) + " " + cNome

    nLinha++
    nContagem++
    
enddo

Inkey(0)