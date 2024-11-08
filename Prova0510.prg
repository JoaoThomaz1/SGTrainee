//Joao Vitor Rodrigues Thomaz
Set Date to British
Set Epoch to 1940
Set Message to 24 Center

//Variaveis
nNumeroPedido := 1
nAlertOpcao   := 0
//Nome Frutaria
cNomeFrutaria := " Frutaria do Joao "
//Tela Login
cUsuarioCorreto  := "5"
cSenhaCorreta    := "5"
//Codigo Produto
nCodigoProd1  := 5500
nCodigoProd3  := 4445
nCodigoProd2  := 7744
nCodigoProd4  := 6565
nEstoqueProd1 := 445.00
nEstoqueProd2 := 198.50
nEstoqueProd3 := 110.00
nEstoqueProd4 := 200.00
//Pictures
cPictureCaracter  := "@!"
cPictureValores   := "@E 99,999.99"
cPictureTotalComp := "@E 9,999,999.99"
cPictureBaixoValor:= "@E 99.99"
cPictureNumerico3 := "999"
cPictureNumerico4 := "9999"
cPictureQtdeProd  := "999.99"
do while .t.
    Set Color to 15/8 
    
    Clear 
    
    @ 00,00 say "        S I S T E M A   D E   G E R E C I M E N T O   E M P R E S A R I A L      " color ( "15/1" )
    
    @ 03,01 say "        @@@@@@@@@@@@@\   @@@@@@@@@@@@@\"
    @ 04,01 say "       @@@@@@@@@@@@@\   @@@@@@@@@@@@@\ "
    @ 05,01 say "      @@@@\            @@@@\           @@@@@@@@@\  @@@@@@@@@\      @@@@@@@@@\ "
    @ 06,01 say "     @@@@\            @@@@\           @@@@@@@@@\  @@@@@@@@@@@\    @@@@@@@@@@@\ "
    @ 07,01 say "    @@@@@@@@@@@@@@\  @@@@\   @@@@@\  @@@@\       @@@@\   @@@@\   @@@@\   @@@@\ "
    @ 08,01 say "   @@@@@@@@@@@@@@\  @@@@\   @@@@@\  @@@@@@@@@\  @@@@\   @@@@\   @@@@\   @@@@\ "
    @ 09,01 say "            @@@@\  @@@@\     @@@\  @@@@@@@@@\  @@@@@@@@@@\     @@@@@@@@@@@\ "
    @ 10,01 say "           @@@@\  @@@@\     @@@\  @@@@\       @@@@\ @@@@\     @@@@\ "
    @ 11,01 say " @@@@@@@@@@@@@\  @@@@@@@@@@@@@\  @@@@@@@@@\  @@@@\   @@@@\   @@@@\ "
    @ 12,01 say "@@@@@@@@@@@@@\  @@@@@@@@@@@@@\  @@@@@@@@@\  @@@@\     @@@@\ @@@@\ "
    
    
    
    @ 23,02 say "EMPRESA: 001 - FRUTARIA DO JOAO - CNPJ: 16670108000121" color ( "7/8" )
    @ 24,02 say "VERSAO: TRUNK DATA: XX/XX/XXXX REVISAO: 27237 COMPILACAO: 07/11/24 21:40" color ( "7/8" )
    
    //While Comeco do Programa
    do while .t.
        //Dados do Cliente
        cUsuarioDigitado := Space(10)
        cSenhaDigitada   := Space(10)
        cNomeCliente     := Space(30)
        dPedido          := CToD( DToC( Date() ) )
        nLimiteCliente   := 0
        nOpcaoMenu       := 0

        Set color to 0/7
        
        @ 15,25 Clear to 20,55 
        @ 15,25 to 20,55 
        
        @ 15,25 say " Senha de acesso:" + Space(14) color ( "15/1" )
        @ 17,30 say "Usuario...: "
        @ 18,30 say "Senha.....: "
        
        @ 17,43 get cUsuarioDigitado picture cPictureCaracter valid !Empty( cUsuarioDigitado ) color ( "15/1" )
        @ 18,43 get cSenhaDigitada   picture cPictureCaracter valid !Empty( cSenhaDigitada ) color ( "1/1" )
        read
        
        If LastKey() == 27
            Exit
        endif

        If Alltrim( cUsuarioDigitado ) == cUsuarioCorreto .and. Alltrim( cSenhaDigitada ) == cSenhaCorreta                
            do while .t.
                Set Color to 15/7

                Clear

                Set Color to 0/8
                
                @ 03,00 clear to 24,80
                
                @ 00,00 say " SISTEMA DE GERECIMENTO EMPRESARIAL - HARBOUR  | " + cUsuarioDigitado + Space(12) color ( "15/1" )
                @ 00,60 say " | " + dtoc(date()) + " " + SubStr( Time(), 1, 5) + Space(20) color ( "15/1" )
                @ 01,00 say cNomeFrutaria + Space(70) color ( "1/15" )
                
                Set Color to ( 0/7, 15/1 )

                @ 02,15 prompt " Frutaria "
                @ 02,55 prompt " Finalizar "

                menu to nOpcao

                If nOpcao == 1
                    Set Color to ( 0/15, 15/1 ) 
                    
                    @ 05,04 to 09,26 color( "0/0" )
                    
                    @ 04,03 Clear to 08,25 
                    
                    @ 04,03 to 08,25
                    
                    @ 24,00 say Space(80)
                    
                    @ 05,04 prompt " Efetuar Pedidos    "  message " Modulo para efetuar Pedidos    "
                    @ 06,04 prompt " Trocar de Usuario  "  message " Modulo para troca de Usuario   "
                    @ 07,04 prompt " Finalizar o Sistema " message " Opcao para finalizar o Sistema "
                    
                    
                    menu to nOpcao
                    
                    if nOpcao == 1
                        //tela de Pedidos
                        do while .t.
                            //Variavel Tela de Venda
                            nLinha        := 08
                            nTotalVenda   := 0

                            Set color to 15/3
                            
                            Clear
                            
                            @ 00,00 say " PEDIDO " + Space(80) color ( "15/1" )
                            @ 00,61 say "| " + dtoc(date()) + " " + SubStr( Time(), 1, 5) + Space(20) color ( "15/1" )
                            @ 01,00 say cNomeFrutaria + Space(70) color ( "1/15" )
                            
                            @ 02,00 to 23,79

                            @ 03,01 Clear to 22,78
                            
                            //Cabecalho venda
                            @ 02,00 say " Venda de Produtos " + Space(80) color( "15/1" )
                            @ 03,02 say " Limite Credito..: " + Space(38) + " Numero Pedido:" + Transform( nNumeroPedido++, cPictureNumerico3 )
                            @ 04,02 say " Cliente.........: " + Space(35) + " Data Pedido: "
                            @ 05,01 to 05,78

                            @ 24,00 say Space(80) color ( "1/15" )
        
                            //Get Cabecalho venda
                            @ 03,21 get nLimiteCliente picture cPictureValores  valid nLimiteCliente > 0     Color ( "15/3" )
                            @ 04,21 get cNomeCliente   picture cPictureCaracter valid !Empty( cNomeCliente ) Color ( "15/3" )
                            @ 04,70 get dPedido                                 valid dPedido <= Date()      Color ( "15/3" )
                            read
                            
                            If Lastkey() == 27
                                nAlertOpcao := Alert( "Sair da Venda?", { "Sim", "Nao" }, "4/7" )
                                if nAlertOpcao = 1
                                    nNumeroPedido--
                                    exit
                                endif
                            Endif

                            //While para Venda produto
                            do while .t.
                                //Variavel Produtos
                                nQtdDigitada    := 0
                                nDescDigitado   := 0
                                nCodigoDigitado := 0
                                nEstoqueProd    := 0

                                //Validacao final da Pagina
                                if nLinha > 20
                                    nLinha := 08
                                    @ nLinha,01 clear to 20,78
                                endif
                                
                                @ nLinha,01 clear to nLinha,78
                                
                                //Venda de produto Cabecalho
                                @ 06,02 say " Cod. | Descricao Produto  | Qtde. | Valor Unit. | %Desc. |  Total  "
                                @ 07,01 to 07,78

                                @ nLinha,03 get nCodigoDigitado picture cPictureNumerico4 valid nCodigoDigitado >= 0  Color ( "15/3" )
                                read
                                
                                If Lastkey() == 27
                                    nAlertOpcao := Alert( "Sair da Venda?", { "Sim", "Nao" }, "4/7" )
                                    if nAlertOpcao = 1
                                        nNumeroPedido--
                                        exit
                                    endif
                                Endif
                                
                                If nCodigoDigitado = nCodigoProd1
                                    cNomeProduto := "Amora Preta"
                                    nPrecoUnit   := 1.50
                                    nDescMaxProd := 0.12
                                    nEstoqueProd := nEstoqueProd1
                                Elseif nCodigoDigitado = nCodigoProd2
                                    cNomeProduto := "Uva Rubi"
                                    nPrecoUnit   := 8.00
                                    nDescMaxProd := 0.11
                                    nEstoqueProd := nEstoqueProd2
                                Elseif nCodigoDigitado = nCodigoProd3
                                    cNomeProduto := "Pepino"
                                    nPrecoUnit   := 3.99
                                    nDescMaxProd := 0.02
                                    nEstoqueProd := nEstoqueProd3
                                Elseif nCodigoDigitado = nCodigoProd4
                                    cNomeProduto := "Morango"
                                    nPrecoUnit   := 15.49
                                    nDescMaxProd := 0.06
                                    nEstoqueProd := nEstoqueProd4
                                else
                                    Alert( "Produto Invalido!" )
                                    Loop
                                Endif

                                //Produto Escolhido
                                @ nLinha,11 say cNomeProduto
                                @ nLinha,42 say Transform( nPrecoUnit, cPictureBaixoValor )
                        
                                //Get da Qtd e Desc do Produto escolhido
                                @ nLinha,31 get nQtdDigitada  picture cPictureQtdeProd  valid nQtdDigitada  >  0                            Color ( "15/3" )
                                @ nLinha,54 get nDescDigitado picture cPictureNumerico3 valid nDescDigitado >= 0 .and. nDescDigitado <= 100 Color ( "15/3" )
                                read
                                
                                //Se quiser Sair, Cancelar ou Processar a Venda
                                If Lastkey() == 27
                                    nAlertOpcao := Alert( "", { "Digitar Novamente", "Cancelar a Venda", "Processar Venda" }, "4/7" )
                                    if nAlertOpcao = 1
                                        Loop
                                    elseif nAlertOpcao = 2
                                        nAlertOpcao:= Alert( "Certeza que quer cancelar?", { "Sim", " Nao" }, "4/15" )
                                        if nAlertOpcao = 1
                                            nNumeroPedido--
                                            Exit
                                        endif
                                    endif
                                Endif

                                //Conversao do Desconto
                                nDescDigitado := nDescDigitado / 100
                        
                                //Validacao se Qtde maior que Estoque
                                If nQtdDigitada > nEstoqueProd
                                    Alert( "Sem a Quantidade em estoque", { "Ok" }, "4/15" )
                                    Loop
                                //Validacao do Desconto Maximo
                                Elseif nDescDigitado > nDescMaxProd
                                    Alert( "Desconto Maior que o Permitido", { "Ok" }, "4/15" )
                                    Loop
                                Endif

                                //Total do produto
                                nTotalProduto := nPrecoUnit * nQtdDigitada
                                
                                //Calculo do total do produto menos o desconto
                                nTotalProduto -= nTotalProduto * nDescDigitado
                                
                                //Total da Venda
                                nTotalVenda   += nTotalProduto
                                
                                //Validacao do Limite para Compra
                                if nTotalVenda > nLimiteCliente
                                    Alert( "Limite Disponivel pra compra ultrapassado!", { "Ok" }, "4/15" )
                                    nTotalVenda -= nTotalProduto
                                    nNumeroPedido--
                                    Loop
                                endif

                                //Impressao do total produto e total venda
                                @ nLinha++,62 say Transform( nTotalProduto, cPictureValores )
                                @ 22,47       say "Total Compra: " + Transform( nTotalVenda, cPictureTotalComp ) 

                                
                                //Se Quiser Processar a venda
                                if nAlertOpcao = 3
                                    Exit
                                Endif
                            enddo
                            //Se Quiser Processar a venda
                            if nAlertOpcao = 3
                                Exit
                            Endif
                        enddo
                        
                        If LastKey() == 27
                            Loop
                        endif
                        
                    Elseif nOpcao == 2
                        exit
                    else
                        exit
                    Endif
                elseif nOpcao == 3 .or. LastKey() == 27
                    exit
                endif
            enddo
        else
            Alert( "Usuario ou Senha Incorreta", { "Ok" }, "0/15" )
            loop
        Endif
        If nOpcao == 3 .or. LastKey() == 27
            exit
        endif
    enddo
    If nOpcao == 3 .or. LastKey() == 27
        nAlertSair := Alert( " Tem Certeza? ", { "Sim", "Nao" }, "4/15" )
        If nAlertSair = 1
            Set Color to 15/0
            clear
            exit
        endif
    endif
enddo