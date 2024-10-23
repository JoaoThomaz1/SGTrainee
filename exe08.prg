// Joao Vitor Rodrigues Thomaz

Set color to B/W

Clear

setmode(25,80)
Set scoreboard off 
Set date to British
Set Epoch to 1930
Set Century on

//Variaveis
cCliente		     := Space(10)
nIdade           := 0
cVendedor	     := Space(10)
cProduto1        := Space(20)
cProduto2        := Space(20)
cProduto3        := Space(20)
nProdValor1      := 0
nProdValor2      := 0
nProdValor3      := 0
nProdQtd1        := 0
nProdQtd2        := 0
nProdQtd3        := 0
dEntrega         := CToD("")
dAtual           := date()
nCodigoProd1     := 0
nCodigoProd2     := 0
nCodigoProd3     := 0
cEnderecoEntrega := Space(20)
nSequencial      := 1

//Corpo do Sistema
@ 00,00 to 24,79 double

@ 02,30 say "SUPERMERCADO BOM DIA"

@ 04,01 say Replicate("-", 78)

@ 05,02 say "CLIENTE: "
@ 05,25 say "IDADE: "
@ 05,40 say "VENDEDOR: "
@ 05,62 say "DATA: " + DToC( dAtual )

@ 05,11 get cCliente  picture "@!"  valid !Empty( cCliente     ) color("B/W")
@ 05,32 get nIdade    picture "999" valid !Empty( nIdade       ) color("B/W")
@ 05,50 get cVendedor picture "@!"  valid !Empty( cVendedor    ) color("B/W")
read

@ 06,01 say Replicate("-", 78)

@ 07,03 say "SEQ"
@ 07,09 say "COD"
@ 07,16 say "DESCRICAO"
@ 07,45 say "QTDE"
@ 07,55 say "VALOR UN."
@ 07,67 say "VALOR TOTAL"

@ 07,07 to 23,07
@ 07,14 to 23,14
@ 07,43 to 23,43
@ 07,53 to 23,53
@ 07,65 to 23,65
@ 08,01 say Replicate("-", 78)

//Produto 1
@ 09,04 say AllTrim( Str( nSequencial ) )

@ 09,09 get nCodigoProd1 picture "9999"      valid !Empty( nCodigoProd1 ) color("B/W")
@ 09,16 get cProduto1    picture "@!"        valid !Empty( cProduto1    ) color("B/W")
@ 09,45 get nProdQtd1    picture "@E 999.99" valid !Empty( nProdQtd1    ) color("B/W")
@ 09,55 get nProdValor1  picture "@E 999.99" valid !Empty( nProdValor1  ) color("B/W")
read

nTotalProd1 := nProdValor1 * nProdQtd1

@ 09,67 say AllTrim( Transform( nTotalProd1, "@E 9,999.99" ) )
@ 10,01 say Replicate("-", 78)

nTotalCompra := nTotalProd1

@ 22,55 say "TOTAL: "
@ 22,67 say AllTrim( Transform( nTotalCompra, "@E 9,999.99" ) )
@ 21,54 say Replicate("-", 24)

//Produto 2
@ 11,04 say AllTrim( Str( nSequencial + 1 ) )

@ 11,09 get nCodigoProd2 picture "9999"      valid !Empty( nCodigoProd2 ) color("B/W")
@ 11,16 get cProduto2    picture "@!"        valid !Empty( cProduto2    ) color("B/W")
@ 11,45 get nProdQtd2    picture "@E 999.99" valid !Empty( nProdQtd2    ) color("B/W")
@ 11,55 get nProdValor2  picture "@E 999.99" valid !Empty( nProdValor2  ) color("B/W")
read

nTotalProd2 := nProdValor2 * nProdQtd2

@ 11,67 say AllTrim( Transform( nTotalProd2, "@E 9,999.99" ) )
@ 12,01 say Replicate("-", 78)

nTotalCompra += nTotalProd2
@ 22,67 say AllTrim( Transform( nTotalCompra, "@E 9,999.99" ) )


//Produto 3
@ 13,04 say AllTrim( Str( nSequencial + 1 ) )

@ 13,09 get nCodigoProd3 picture "9999"      valid !Empty( nCodigoProd3 ) color("B/W")
@ 13,16 get cProduto3    picture "@!"        valid !Empty( cProduto3    ) color("B/W")
@ 13,45 get nProdQtd3    picture "@E 999.99" valid !Empty( nProdQtd3    ) color("B/W")
@ 13,55 get nProdValor3  picture "@E 999.99" valid !Empty( nProdValor3  ) color("B/W")
read

nTotalProd3 := nProdValor3 * nProdQtd3

@ 13,67 say AllTrim( Transform( nTotalProd3, "@E 9,999.99" ) )
@ 14,01 say Replicate("-", 78)

nTotalCompra += nTotalProd3
@ 22,67 say AllTrim( Transform( nTotalCompra, "@E 9,999.99" ) )


//Entrega
@ 15,03 clear to 23,50
@ 15,03 clear to 20,78

dEntrega := dAtual + 3

@ 17,03 say "ENDERECO: "
@ 17,40 say "DATA ENTREGA: " + DToC( dEntrega )

@ 17,13 get cEnderecoEntrega picture "@!" valid !Empty( cEnderecoEntrega ) color("B/W")
read

//Tela de espera
@ 18,28 to 20,49

@ 19,30 say "EMITINDO CUPOM...."
@ 19,27 to 20,27 color("N/N")
@ 21,27 to 21,47 color("N/N")

Inkey(3)

//Cupom Fiscal
Clear

cCorFundo := "GR/GR"
cCorTexto := "N/GR"
nLinha := 2

do while nLinha < 23
   @ nLinha,25 say Space(40) color( cCorFundo )
   
   nLinha ++
enddo

@ 03,24 to 23,24 color("N/N")
@ 23,24 to 23,63 color("N/N")

@ 03,37 say "CUPOM NAO FISCAL"                                 color( cCorTexto )
@ 04,35 say "SUPERMERCADO BOM DIA"                             color( cCorTexto )
@ 06,27 say cCliente                                           color( cCorTexto )
@ 06,45 say "VENDEDOR: " + cVendedor                           color( cCorTexto )
@ 07,27 say DToC( dAtual )                                     color( cCorTexto )
@ 09,27 say cProduto1                                          color( cCorTexto )
@ 09,55 say AllTrim( Transform( nTotalProd1, "@E 9,999.99" ) ) color( cCorTexto )
@ 10,27 say cProduto2                                          color( cCorTexto )
@ 10,55 say AllTrim( Transform( nTotalProd2, "@E 9,999.99" ) ) color( cCorTexto )
@ 11,27 say cProduto3                                          color( cCorTexto )
@ 11,55 say AllTrim( Transform( nTotalProd3, "@E 9,999.99" ) ) color( cCorTexto ) 


@ 13,33 say "TOTAL DA COMPRA: " + AllTrim( Transform( nTotalCompra, "@E 9,999.99" ) ) color( cCorTexto )
@ 15,27 say "ENDERECO: " + cEnderecoEntrega                                           color( cCorTexto ) 
@ 16,27 say "ENTREGA: " + DToC( dEntrega )                                            color( cCorTexto )
@ 18,37 say "DEUS ABENCOE!"                                                           color( cCorTexto )
@ 19,37 say "VOLTE SEMPRE!"                                                           color( cCorTexto )
@ 20,30 say "DESENVOLVIDO PELA SGSISTEMAS"                                            color( cCorTexto )

Inkey(0)