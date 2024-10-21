Set color to W+/B+

Clear

Setmode ( 25,80 )

cProduto := Space(20)
nCodigo  := 0
cTexto   := "O SEGUINTE PRODUTO E: "
cTexto2  := "!CODIGO INVALIDO!"
cCor     := ""

//ESTETICA
@ 02,02 to 15,45 double

@ 04,03 to 04,44
@ 06,03 to 06,44
@ 08,03 to 08,44
@ 10,03 to 10,44
@ 03,60 to 15,60

@ 02,50 to 15,79 double

@ 04,51 to 04,77

@ 03,53 say "CODIGO"
@ 03,62 say "CLASSIFICACAO"

@ 05,53 say "1"
@ 07,53 say "2 a 4"
@ 09,53 say "5 e 6"
@ 11,53 say "7"
@ 13,53 say "8 a 15"

@ 05,61 say "Alim. n/ perecivel"
@ 07,61 say "Alimento perecivel"
@ 09,61 say "Vestuario"
@ 11,61 say "Higiene Pessoal"
@ 13,61 say "Limp. e Uten. Dom."

//CLIENTE
@ 03,03 say "PRODUTO: " color 'GR+/BG'
@ 03,35 say "CODIGO: " color 'GR+/BG'

//CABE€ALHO
@ 07,08 say "|  GALPAO ARMAZENAMENTO SG  |"

@ 03,11 get cProduto picture '@!'  valid !Empty ( cProduto )
@ 03,42 get nCodigo  picture '99'  valid nCodigo > 0
Read

If nCodigo == 1


   cTexto2 := " ALIMENTO NAO-PERECIVEL "
   cCor    := 'G+/N'

ElseIf nCodigo >= 2 .and. nCodigo <= 4

   cTexto2 := " ALIMENTO PERECIVEL "
   cCor    := 'G+/N'

ElseIf nCodigo == 5 .or. nCodigo == 6

   cTexto2 := " VESTUARIO "
   cCor    := 'G+/N'

ElseIf nCodigo == 7

   cTexto2 := " HIGIENE PESSOAL "
   cCor    := 'G+/N'

ElseIf nCodigo >= 8 .and. nCodigo <= 15

   cTexto2 := " LIMPEZA E UTENSILIOS DOMESTICOS "
   cCor    := 'G+/N'

Else

   cTexto2 := "!CODIGO INVALIDO!"
   cCor    := 'R+/N'

Endif

@ 09,11 say cTexto  picture  '@!'
@ 12,11 say cTexto2 picture  '@!' color cCor

Inkey(0)

