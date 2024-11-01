// Joao Vitor Rodrigues Thomaz

Set color to B/W

Clear

Set scoreboard off 
Set date to British
Set Epoch to 1930


//Dados Mercado
cNomeMercado     := "SUPERMERCADO BOA MADRUGADA"
dAtual           := date()
nTotalCompra     := 0
//Pictures
cPictureCaracter := "@!"
cPictureNumerico2:= "99"
cPictureNumerico3:= "999"
cPictureNumerico4:= "9999"
cPictureValor    := "@E 9,999.99"
cPictureQuant    := "@E 999.99"
//Cores
cCorPadrao       := "B/W"
//Replicates
nReplicateDivisao:= 78
//Controle de Linhas
nLinhaProduto := 09
nLinhaTotal   := 22
do while .t.
   //Dados Cliente
   cVendedor	     := Space(10)
   cCliente		     := Space(10)
   nIdade           := 0
   nSequencial      := 1
   
   //Moldura e Divisao Cabecalho
   @ 00,00 to 24,79 double
   @ 04,01 say Replicate( "-", nReplicateDivisao )
   @ 06,01 say Replicate( "-", nReplicateDivisao )
   @ 21,01 say Replicate( "-", nReplicateDivisao )
   
   //Dados Cabecalho
   @ 02,25 say cNomeMercado
   @ 03,02 say "VENDEDOR: " + Space(53) + "DATA: " + DToC( dAtual )
   @ 05,02 say "CLIENTE: " + Space(54) + "IDADE: "
   
   //Get Cabecalho
   @ 03,13 get cVendedor picture cPictureCaracter  valid !Empty( cVendedor    ) color( cCorPadrao )
   @ 05,11 get cCliente  picture cPictureCaracter  valid !Empty( cCliente     ) color( cCorPadrao )
   @ 05,75 get nIdade    picture cPictureNumerico3 valid !Empty( nIdade       ) color( cCorPadrao )
   read
   
   //Cabecalho Venda
   @ 07,02 say " SEQ |  COD  | DESCRICAO " + Space(15) + " |  QTDE  | VALOR UN. |  VALOR TOTAL"
   @ 08,01 say Replicate( "-", nReplicateDivisao )
   
   do while .t.
      //Dados Produto
      cNomeProduto     := Space(20)
      nValorProduto    := 0
      nQtdProduto      := 0
      nCodigoProduto   := 0
      dEntrega         := CToD("")
      cEnderecoEntrega := Space(20)
      
      //Produto
      @ nLinhaProduto,03 say Transform( nSequencial, cPictureNumerico2 )
      
      @ nLinhaProduto,08 get nCodigoProduto picture cPictureNumerico4 valid !Empty( nCodigoProduto ) color( cCorPadrao )
      @ nLinhaProduto,17 get cNomeProduto   picture cPictureCaracter  valid !Empty( cNomeProduto   ) color( cCorPadrao )
      @ nLinhaProduto,44 get nQtdProduto    picture cPictureQuant     valid !Empty( nQtdProduto    ) color( cCorPadrao )
      @ nLinhaProduto,53 get nValorProduto  picture cPictureValor     valid !Empty( nValorProduto  ) color( cCorPadrao )
      read
      
      nTotalProd := nValorProduto * nQtdProduto
      
      @ nLinhaProduto,67 say Transform( nTotalProd, cPictureValor )
      
      nTotalCompra += nTotalProd
      
      @ nLinhaTotal,60 say "TOTAL: "
      @ nLinhaTotal,70 say Transform( nTotalCompra, cPictureValor )  
      
      nLinhaProduto++

      If nLinhaProduto = 21
         nLinhaProduto = 09
         @ 09,01 Clear to 20,78
      endif 
   enddo

   dEntrega := dAtual + 3
   
   @ nLinhaTotal,02 say "ENDERECO: " + Space(20) + "DATA ENTREGA: " + DToC( dEntrega )
   
   @ nLinhaTotal,12 get cEnderecoEntrega picture cPictureCaracter valid !Empty( cEnderecoEntrega ) color( cCorPadrao )
   read
   
   //Tela de espera
   @ 18,28 to 20,49
   
   @ 19,30 say "IMPRIMINDO CUPOM..."
   @ 19,27 to 20,27 color("N/N")
   @ 21,27 to 21,47 color("N/N")
   
   Inkey(3)
   
enddo

//Cupom Fiscal
// Clear

// cCorFundo := "GR/GR"
// cCorTexto := "N/GR"
// nLinha := 2

// do while nLinha < 23
//    @ nLinha,25 say Space(40) color( cCorFundo )
   
//    nLinha ++
// enddo

// @ 03,24 to 23,24 color("N/N")
// @ 23,24 to 23,63 color("N/N")

// @ 03,37 say "CUPOM NAO FISCAL"                                 color( cCorTexto )
// @ 04,35 say "SUPERMERCADO BOM DIA"                             color( cCorTexto )
// @ 06,27 say cCliente                                           color( cCorTexto )
// @ 06,45 say "VENDEDOR: " + cVendedor                           color( cCorTexto )
// @ 07,27 say DToC( dAtual )                                     color( cCorTexto )
// @ 09,27 say cProduto1                                          color( cCorTexto )
// @ 09,55 say AllTrim( Transform( nTotalProd1, "@E 9,999.99" ) ) color( cCorTexto )
// @ 10,27 say cProduto2                                          color( cCorTexto )
// @ 10,55 say AllTrim( Transform( nTotalProd2, "@E 9,999.99" ) ) color( cCorTexto )
// @ 11,27 say cProduto3                                          color( cCorTexto )
// @ 11,55 say AllTrim( Transform( nTotalProd3, "@E 9,999.99" ) ) color( cCorTexto ) 


// @ 13,33 say "TOTAL DA COMPRA: " + AllTrim( Transform( nTotalCompra, "@E 9,999.99" ) ) color( cCorTexto )
// @ 15,27 say "ENDERECO: " + cEnderecoEntrega                                           color( cCorTexto ) 
// @ 16,27 say "ENTREGA: " + DToC( dEntrega )                                            color( cCorTexto )
// @ 18,37 say "DEUS ABENCOE!"                                                           color( cCorTexto )
// @ 19,37 say "VOLTE SEMPRE!"                                                           color( cCorTexto )
// @ 20,30 say "DESENVOLVIDO PELA SGSISTEMAS"                                            color( cCorTexto )

// Inkey(0)