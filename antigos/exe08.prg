Set color to W+/B

Clear

SetMode(25,80)

Set Scoreboard off
Set date to british
set epoch to 1930

nValorProduto := 0
nQuantidade   := 0
cNomeProduto  := Space(10)

//Cliente
cCliente    := Space(30)
nIdade      := 0
nCredito    := 0

//Entrega
dDataPedido := date()
dDataEntrega:= (dDataPedido) + 7

//Alerts
nDados      := 1

//Datas
dAtual      := Date()
nDia        := Day  (dAtual)
nMes        := Month(dAtual)
nAno        := Year (dAtual)
nDiaSemana  := DoW  (dAtual)
cMesExtenso := ""
cSemanaExt  := ""

//ESTETICA
@ 02,02 to 29,60 double

@ 04,03 to 04,59
@ 06,03 to 06,59
@ 08,03 to 08,59
@ 10,03 to 10,59
@ 12,03 to 12,59
@ 14,03 to 14,59
@ 16,03 to 16,59
@ 18,03 to 18,59
@ 20,03 to 20,59

@ 22,34 to 24,59

//CLIENTE
@ 03,03 say "Cliente:"
@ 03,45 say "Idade: "
@ 05,30 say "Limite de Cr�dito:"

//If para data cabe�alho
If nMes     == 1
   cMesExtenso := "Janeiro"

Elseif nMes == 2
   cMesExtenso := "Fevereiro"

Elseif nMes == 3
   cMesExtenso := "Mar�o"

Elseif nMes == 4
   cMesExtenso := "Abril"

Elseif nMes == 5
   cMesExtenso := "Maio"

Elseif nMes == 6
   cMesExtenso := "Junho"

Elseif nMes == 7
   cMesExtenso := "Julho"

Elseif nMes == 8
   cMesExtenso := "Agosto"

Elseif nMes == 9
   cMesExtenso := "Setembro"

Elseif nMes == 10
   cMesExtenso := "Outubro"

Elseif nMes == 11
   cMesExtenso := "Novembro"

Elseif nMes == 12
   cMesExtenso := "Dezembro"

Endif

If nDiaSemana == 1
   cSemanaExt := "Domingo"

Elseif nDiaSemana == 2
   cSemanaExt := "Segunda-Feira"

Elseif nDiaSemana == 3
   cSemanaExt := "Ter�a-Feira"

Elseif nDiaSemana == 4
   cSemanaExt := "Quarta-Feira"

Elseif nDiaSemana == 5
   cSemanaExt := "Quinta-Feira"

Elseif nDiaSemana == 6
   cSemanaExt := "Sexta-Feira"

Elseif nDiaSemana == 7
   cSemanaExt := "Sabado"

Endif

//CABE�ALHO
@ 01,04 say "Maringa, " + Transform( nDia, '99' ) + " de " + cMesExtenso + " de " + Transform( nAno, '9999' ) + " ( " + cSemanaExt + " ) "

@ 07,14 say "|    Mercado Cidade Cancao  |"

@ 09,04 say "Produto"
@ 09,14 say "| Valor"
@ 09,29 say "|Quantidade"
@ 09,42 say "|  Total"
@ 11,14 say "| R$ "
@ 11,42 say "| R$ "
@ 13,14 say "| R$ "
@ 13,42 say "| R$ "
@ 15,14 say "| R$ "

@ 15,42 say "| R$ "
@ 17,14 say "| R$ "
@ 17,42 say "| R$ "
@ 19,14 say "| R$ "
@ 19,42 say "| R$ "
@ 21,05 say "Data do Pedido: " + dToc(dDataPedido)

Do while .t.

   //CLIENTE Get
   @ 03,11 get cCliente  picture '@!'          valid !Empty(cCliente)
   @ 03,53 get nIdade    picture '999'         valid nIdade > 15
   @ 05,50 get nCredito  picture '@E 9,999.99' valid !Empty(nCredito)
   Read

   nDados := Alert( "Dados corretos?", { "Sim", "Nao" }, 'W+/R' )

   If nDados == 2
      Loop
   endif

   Do While .t.

      //PRODUTO

      @ 11,04 get cNomeProduto  picture '@!'          valid !Empty(cNomeProduto)
      @ 11,19 get nValorProduto picture '@E 99.99'    valid !Empty(nValorProduto)
      @ 11,30 get nQuantidade   picture '999.99'      valid nQuantidade > 0
      Read

      nSubTotal   := (nValorProduto*nQuantidade)

      @ 11,47 say Alltrim(Transform(nSubTotal,'@E 9,999.99'))

      nTotal    := nTotal   + nSubTotal
      nCredito  := nCredito - nSubTotal

      @ 23,35 say "Total Compra: R$ " + Alltrim(Transform(nTotal,'@E 9,999.99'))

      If nCredito <= 0

         Clear

         @ 02,02 to 29,60 double

         @ 13,20 say "O SR(A) ATINGIU O LIMITE" color 'R+/N'

      Elseif nCredito > 0
      Endif
   Enddo

   //TOTAL DA COMPRA
   @ 23,35 say "Total Compra: R$ " + Alltrim(Transform(nTotal,'@E 9,999.99'))
   Inkey(4)

   Clear

   @ 13,28 say " PRESSIONE QUALQUER TECLA"
   @ 14,29 say "PARA INSERIR O ENDERE�O!"
   Inkey(0)

   Clear

   //VARIAVEIS PARA O ENDERE�O
   cEndereco := Space(20)
   nNumero   := 0
   cBairro   := Space(10)
   cCidade   := Space(15)
   cEstado   := Space(2)
   //ESTETICA
   @ 02,02 to 10,60 double

   @ 04,03 to 04,59
   @ 06,03 to 06,59
   @ 08,03 to 08,59


   //ENDERE�O
   @ 03,03 say "Endere�o: "
   @ 03,45 say "Numero: "
   @ 05,03 say "Bairro: "
   @ 05,25 say "Cidade: "
   @ 05,50 say "UF: "
   @ 07,20 say "Pedido ser� entregue em: "
   @ 09,30 say dDataEntrega

   @ 03,14 get cEndereco picture '@!'   valid !Empty( cEndereco )
   @ 03,53 get nNumero   picture '9999' valid !Empty( nQuant1   )
   @ 05,11 get cBairro   picture '@!'   valid !Empty( cBairro   )
   @ 05,33 get cCidade   picture '@!'   valid !Empty( cCidade   )
   @ 05,55 get cEstado   picture '@!'   valid !Empty( cEstado   )
   Read

   Inkey(4)

   Clear

   @ 13,28 say " PRESSIONE QUALQUER TECLA"
   @ 14,20 say "PARA CONFIRMAR O ENDERE�O E OS PEDIDOS!"
   Inkey(0)

   Clear

   //ESTETICA
   @ 02,02 to 20,60 double

   @ 03,03 say "Data do pedido: "  + dToc( dDataPedido  )
   @ 03,35 say "Data da Entrega: " + dToc( dDataEntrega )
   @ 04,03 say "Nome: "            + Alltrim( cCliente  ) + "          Idade: " + Alltrim( Transform( nIdade, '999'   ))
   @ 06,03 say "Endere�o: "        + Alltrim( cEndereco ) + "     Numero: "     + Alltrim( Transform( nNumero, '9999' ))
   @ 07,03 say "Bairro: "          + Alltrim( cBairro   )
   @ 07,25 say "Cidade: "          + Alltrim( cCidade   )
   @ 07,50 say "UF: "              + Alltrim( cEstado   )
   @ 09,05 say "Pedido 1: "        + Alltrim( cProd1    ) + "     Qnt: "        + Alltrim( Transform( nQuant1, '999.99')) + " Custo: R$ " + Alltrim(Transform(nTotal1, '@E 9,999.99'))
   @ 11,05 say "Pedido 2: "        + Alltrim( cProd2    ) + "     Qnt: "        + Alltrim( Transform( nQuant2, '999.99')) + " Custo: R$ " + Alltrim(Transform(nTotal2, '@E 9,999.99'))
   @ 13,05 say "Pedido 3: "        + Alltrim( cProd3    ) + "     Qnt: "        + Alltrim( Transform( nQuant3, '999.99')) + " Custo: R$ " + Alltrim(Transform(nTotal3, '@E 9,999.99'))
   @ 15,05 say "Pedido 4: "        + Alltrim( cProd4    ) + "     Qnt: "        + Alltrim( Transform( nQuant4, '999.99')) + " Custo: R$ " + Alltrim(Transform(nTotal4, '@E 9,999.99'))
   @ 17,05 say "Pedido 5: "        + Alltrim( cProd5    ) + "     Qnt: "        + Alltrim( Transform( nQuant5, '999.99')) + " Custo: R$ " + Alltrim(Transform(nTotal5, '@E 9,999.99'))
   @ 19,35 say "Total Compra: R$ " + Alltrim( Transform( nTotal,'@E 9,999.99'))
   Inkey(0)

Enddo

