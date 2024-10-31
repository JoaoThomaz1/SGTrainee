//João Vitor Rodrigues Thomaz
Set color to N/N+

Clear

SetMode(25,80)
Set Scoreboard Off
Set Date to British

//Variaveis
cNomeEmpresa        := "FRUTARIA DO JOAO"
cUsuarioValido      := "ADMIN"
cSenhaValido        := "ADMIN"
cUsuarioDigitado    := Space(10)    //Criado as Variaveis cXxxxxValido para que valide posteriorente o Usuario e Senha que for digitado
cSenhaDigitada      := Space(10)
//Dados Venda
nNumeroPedido       := 1
cNomeCliente        := Space(15)
nLimiteCredito      := 0
dPedido             := CToD("")
dAtual              := date()
//Info Produtos
cDescricaoProduto1  := "BANANA PRATA"
cDescricaoProduto2  := "PERA ARGENTINA"
cDescricaoProduto3  := "BATATA PERUANA"
cDescricaoProduto4  := "ABACATE NEGRO"
nCodigoProduto1     := 3500
nCodigoProduto2     := 4501
nCodigoProduto3     := 7001
nCodigoProduto4     := 6002
nPrecoUnit1         := 3.50 
nPrecoUnit2         := 7.00
nPrecoUnit3         := 2.00
nPrecoUnit4         := 1.99
nEstoqueProduto1    := 125.00
nEstoqueProduto2    := 119.50
nEstoqueProduto3    := 865.00
nEstoqueProduto4    := 200.00
//Pictures e Validadores
cPictureLimite      := "@E 9,999.99"
cPictureCaracter    := "@!"
cPictureCodProduto  := "9999"
cPictureEstoqueProd := "@E 999.99"
cPictureDescontoProd:= "999"
//Validacao Produto Escolhido
nValorTotalPorProd  := 0
nValorTotalCompra   := 0
nDescontoProduto    := 0
nQtdeProduto        := 0
nCodigoDigitado     := 0
nValidacaoEstoque   := 0
nPrecoUnitEscolhido := 0
nTotalProduto       := 0
nTotalCompra        := 0
cProdutoEscolhido   := ""

//Alerts
nAlertProdutoError  := 0
nAlertDescontError  := 0
nAlertAcimaLimite   := 0
nAlertEstoqueError  := 0

do while .t.

    @ 05,30 say cNomeEmpresa
    @ 10,15 say "USER: "
    @ 11,11 say "PASSWORD: "

    @ 10,21 get cUsuarioDigitado picture cPictureCaracter valid !Empty( cUsuarioDigitado ) color "N+/N"
    @ 11,21 get cSenhaDigitada   picture cPictureCaracter valid !Empty(  cSenhaDigitada  ) color "N/N"
    read

    if cUsuarioDigitado = cUsuarioValido .and. cSenhaDigitada = cSenhaValido
        Clear

        @ 05,30 say cNomeEmpresa
        @ 10,20 prompt "EFETUAR PEDIDOS" message "PROSSIGA PARA A TELA DE VENDA"
        @ 11,20 prompt "SAIR"            message "SAIR DO PROGRAMA"

        Menu to nOpcao1
        
        if nOpcao1 = 1
            do while .t.
                Set Color to B+/N+
        
                Clear

                //molduras e divisorias
                @ 01,01 to 24,78 double
                @ 03,02 to 03,77
                @ 06,02 to 06,77
                @ 08,02 to 08,77
                
                //Cabecalho Frutaria
                @ 02,30 say cNomeEmpresa + Space(20) + "PEDIDO: " + AllTrim( Str( nNumeroPedido ) )
                @ 04,03 say "CLIENTE: " + Space(40) + "DATA DO PEDIDO: "
                @ 05,20 say "LIMITE CREDITO: R$"
                @ 07,02 say "  CODIGO  |  DESCRICAO " + Space(5) + "|  QTDE.  |  PRECO UNIT.  |  DESC.%  |  TOTAL"
                
                //Gets do cabecalho
                @ 04,70 get dPedido                                 valid dPedido <= dAtual          Color "B+/N+"
                @ 04,14 get cNomeCliente   picture cPictureCaracter valid !Empty( cNomeCliente )     Color "B+/N+"
                @ 05,35 get nLimiteCredito picture cPictureLimite   valid nLimiteCredito > 0         Color "B+/N+"
                Read
                
                do while .t.

                    if nTotalCompra > nLimiteCredito
                        nAlertAcimaLimite := Alert( "VALOR DA COMPRA ACIMA DO LIMITE", { "CANCELAR COMPRA", "FINALIZAR COMPRA" }, "N+/W+" )
                        if nAlertAcimaLimite == 1
                            exit
                        endif
                    endif
                    
                    //Gets dos produtos
                    @ 09,03 get nCodigoDigitado picture cPictureCodProduto valid nCodigoDigitado >= 0
                    read
                    
                    //Validacao de qual produto e
                    if nCodigoDigitado = nCodigoProduto1
                        cProdutoEscolhido   := cDescricaoProduto1
                        nValidacaoEstoque   := nEstoqueProduto1
                        nPrecoUnitEscolhido := nPrecoUnit1
                        nDescontoMaximo     := 0.18
                    elseif nCodigoDigitado = nCodigoProduto2
                        cProdutoEscolhido   := cDescricaoProduto2
                        nValidacaoEstoque   := nEstoqueProduto2
                        nPrecoUnitEscolhido := nPrecoUnit2
                        nDescontoMaximo     := 0.16
                    elseif nCodigoDigitado = nCodigoProduto3
                        cProdutoEscolhido   := cDescricaoProduto3
                        nValidacaoEstoque   := nEstoqueProduto3
                        nPrecoUnitEscolhido := nPrecoUnit3
                        nDescontoMaximo     := 0.09
                    elseif nCodigoDigitado = nCodigoProduto4
                        cProdutoEscolhido   := cDescricaoProduto4
                        nValidacaoEstoque   := nEstoqueProduto4
                        nPrecoUnitEscolhido := nPrecoUnit4
                        nDescontoMaximo     := 0.03
                    else
                        nAlertProdutoError:= Alert( "PRODUTO INCORRETO!", { "REFAZER", "SAIR" }, "W/R+" )
                        if nAlertProdutoError == 1
                            loop
                        else
                            Exit
                        endif                        
                    endif
                    
                    //Declaracao do produto escolhido
                    @ 09,15 say cProdutoEscolhido + space(20) + Alltrim( Str(nPrecoUnitEscolhido ) )
                    //Digitacao da quantidade do produto
                    @ 09,32 get nQtdeProduto     picture cPictureEstoqueProd  valid nQtdeProduto > 0                                         Color "B+/N+"
                    @ 09,58 get nDescontoProduto picture cPictureDescontoProd valid nDescontoProduto >= 0 .and. nDescontoProduto <= 100      Color "B+/N+"
                    read
                    
                    if nQtdeProduto > nValidacaoEstoque
                        nAlertEstoqueError := Alert( "QUANTIDADE ACIMA DO ESTOQUE", { "DIGITAR NOVAMENTE", "FINALIZAR COMPRA" }, "N+/W+" )
                        if nAlertEstoqueError == 1
                            loop
                        else
                            exit
                        endif
                    endif   

                    if nDescontoProduto < nDescontoMaximo
                        nAlertDescontError := Alert( "DESCONTO MAIOR QUE PERMITIDO", { "VOLTAR" }, "W/R+" ) 
                        if nAlertDescontError == 1
                            Loop
                        endif                       
                    endif
                    
                    nTotalProduto := ( nPrecoUnitEscolhido * 0.001 * ( 100 - nDescontoProduto ) ) * nQtdeProduto
                    nTotalCompra  += nTotalProduto
                    
                    
                enddo
                //Compra cancelada
                if nAlertAcimaLimite == 1
                    exit
                endif
            enddo
            //Compra cancelada
            if nAlertAcimaLimite == 1
                exit
            endif
        else
            exit
        endif        
    else
        Exit    
    endif    
    //Compra cancelada
    if nAlertAcimaLimite == 1
        exit
    endif
enddo


inkey(0)
