// Joao Vitor Rodrigues Thomaz

Set color to B/W

Clear

setmode(25,80)
Set scoreboard off 
Set date to British
Set Epoch to 1930
Set Century on

//Variaveis
cCliente		:= Space(10)
cVendedor	:= Space(10)
cProduto1   := "REFRIGERANTE OURO VERDE 2L"
cProduto2   := "CAFE PELE 1KG"
cProduto3   := "ARROZ TIO JOAO 5KG"
nProdValor1 := 10.00
nProdValor2 := 5.25
nProdValor3 := 20.00
nProdQtd1 := 0
nProdQtd2 := 0
nProdQtd3 := 0
dDataHoje := date()

//Corpo do Sistema
@ 00,00 to 24,79 double

@ 02,30 say "SUPERMERCADO BOM DIA"

@ 04,01 say Replicate("-", 78)

@ 05,02 say "CLIENTE: "
@ 05,25 say "VENDEDOR: "
@ 05,60 say "DATA: " + DToC(dDataHoje)

@ 05,11 get cCliente picture "@!" valid !Empty(cCliente) color("B/W")
@ 05,35 get cVendedor picture "@!" valid !Empty(cVendedor) color("B/W")
read

@ 06,01 say Replicate("-", 78)

@ 07,03 say "CODIGO"
@ 07,15 say "DESCRICAO"
@ 07,45 say "QTDE"
@ 07,55 say "VALOR UN."
@ 07,67 say "VALOR TOTAL"

@ 07,12 to 23,12
@ 07,43 to 23,43
@ 07,53 to 23,53
@ 07,65 to 23,65
@ 08,01 say Replicate("-", 78)

//Produto 1
@ 09,03 say "0945"
@ 09,15 say cProduto1
@ 09,55 say AllTrim(STR(nProdValor1))

@ 09,45 get nProdQtd1 picture "9999" valid !Empty(nProdQtd1) color("B/W")
read

nTotalProd1 := nProdValor1 * nProdQtd1

@ 09,67 say AllTrim(str(nTotalProd1))
@ 10,01 say Replicate("-", 78)

//Produto 2
@ 11,03 say "6591"
@ 11,15 say cProduto2
@ 11,55 say AllTrim(STR(nProdValor2))

@ 11,45 get nProdQtd2 picture "9999" valid !Empty(nProdQtd2) color("B/W")
read

nTotalProd2 := nProdValor2 * nProdQtd2

@ 11,67 say AllTrim(str(nTotalProd2))
@ 12,01 say Replicate("-", 78)

//Produto 3
@ 13,03 say "3468"
@ 13,15 say cProduto3
@ 13,55 say AllTrim(STR(nProdValor3))

@ 13,45 get nProdQtd3 picture "9999" valid !Empty(nProdQtd3) color("B/W")
read

nTotalProd3 := nProdValor3 * nProdQtd3

@ 13,67 say AllTrim(str(nTotalProd3))
@ 14,01 say Replicate("-", 78)

//Tela de espera
@ 17,28 to 19,49

@ 18,30 say "EMITINDO CUPOM...."
@ 18,27 to 19,27 color("N/N")
@ 20,27 to 20,47 color("N/N")

Inkey(3)

//Cupom Fiscal
Clear

cCorFundo := "GR/GR"
cCorTexto := "N/GR"
nLinha := 2

do while nLinha < 23
   @ nLinha,25 say Space(40) color(cCorFundo)
   
   nLinha ++
enddo

@ 03,24 to 23,24 color("N/N")
@ 23,24 to 23,63 color("N/N")

@ 03,35 say "SUPERMERCADO BOM DIA" color(cCorTexto)
@ 05,27 say cCliente color(cCorTexto)
@ 06,27 say cVendedor color(cCorTexto)
@ 07,27 say DToC(dDataHoje) color(cCorTexto)
@ 09,27 say cProduto1 color(cCorTexto)
@ 09,55 say AllTrim(str(nTotalProd1)) color(cCorTexto)
@ 10,27 say cProduto2  color(cCorTexto)
@ 10,55 say AllTrim(str(nTotalProd2)) color(cCorTexto)
@ 11,27 say cProduto3  color(cCorTexto)
@ 11,55 say AllTrim(str(nTotalProd3)) color(cCorTexto)

//Total da compra
nTotalCompra := nTotalProd1 + nTotalProd2 + nTotalProd3

@ 13,33 say "TOTAL DA COMPRA: " + AllTrim(str(nTotalCompra)) color(cCorTexto)
@ 17,30 say "DESENVOLVIDO PELA SGSISTEMAS" color(cCorTexto)
@ 18,37 say "VOLTE SEMPRE!" color(cCorTexto)
@ 20,37 say "DEUS ABENCOE!" color(cCorTexto)


Inkey(0)