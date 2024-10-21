Set color to G+/N

Clear

nLinha    := 7
nContagem := 0
cNome     := Space(10)


@ 02,02 to 18,30 double

@ 03,04 say "Insert your First Name: "

@ 05,10 get cNome picture '@!' valid !Empty(cNome)
Read


Do while nContagem <= 10

   @ nLinha,04 say Alltrim(Transform(nContagem, '99'))
   @ nLinha,20 say cNome

   nContagem ++
   nLinha    ++

Enddo

Inkey(0)

