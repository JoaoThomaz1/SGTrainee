//Joao Vitor Rodrigues Thomaz

Clear

cNome     := Space(10)
nLinha    := 10
nContagem := 1

@ 08,30 say "Nome: "

@ 08,40 get cNome picture "@!" valid !Empty(cNome)
read

do while nLinha < 21
    
    @ nLinha,25 say AllTrim(Str(nContagem)) + " " + cNome

    nLinha ++   
    nContagem ++

enddo

Inkey(0)