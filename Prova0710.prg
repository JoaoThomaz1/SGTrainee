//Joao Vitor Rodrigues Thomaz

Set Date to British
Set Epoch to 1940
Set Message to 24 Center
Set Wrap On

//Variaveis
dAtual            := date()
nNumeroPedido     := 1
//Dados Empresa
cNomeEmpresa      := " SG Assistencia Tecnica "
cCnpjEmpresa      := " 16670108000121 "
//Tela Login
cUsuarioCorreto  := "ADMIN"
cSenhaCorreta    := "123mudar"
cSupervisor      := Space(15)
cSenhaSupervisor := "123LIBERA"
//Pictures
cPictureCaracter  := "@!"
cPictureNumerico4 := "9999"
cPictureNumerico3 := "99999999"
cPictureTelefone  := "99999999999"
cPictureDesconto  := "@E 999.99"
cPictureMonetario := "@E 9,999,999.99"
//Cores
cCorPadrao      := "0/15"
cCorPadraoAlert := "4/7"
cCorCabecalhos  := "15/1"
cCorTelaVendas  := "15/3"
//Alerts
nAlertOpcao := 0
nAlertMenu  := 0
cOpcaoSim   := "Sim"
cOpcaoNao   := "Nao"
cOpcaoSair  := "Sair"

do while .t.
    Set Color to 15/8 
    
    Clear 
    
    @ 00,00 say "        S I S T E M A   D E   G E R E C I M E N T O   E M P R E S A R I A L      " color ( cCorCabecalhos )
    
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
    
    
    
    @ 23,02 say "EMPRESA: 002 - " + cNomeEmpresa + " - CNPJ: " + cCnpjEmpresa              color ( "7/8" )
    @ 24,02 say "VERSAO: TRUNK DATA: XX/XX/XXXX REVISAO: 27237 COMPILACAO: 12/11/24 21:20" color ( "7/8" )
    
    //While Comeco do Programa
    do while .t.
        //Dados do Cliente
        cUsuarioDigitado := Space(10)
        cSenhaDigitada   := Space(10)
        
        Set color to 0/7
        
        @ 15,25 Clear to 20,55 
        @ 15,25 to 20,55 
        
        @ 15,25 say " Senha de acesso:" + Space(14) color ( cCorCabecalhos )
        @ 17,30 say "Usuario...: "
        @ 18,30 say "Senha.....: "
        
        @ 17,43 get cUsuarioDigitado picture cPictureCaracter valid !Empty( cUsuarioDigitado ) color ( cCorCabecalhos )
        @ 18,43 get cSenhaDigitada                            valid !Empty( cSenhaDigitada )   color ( "1/1" )
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
                
                @ 00,00 say " SISTEMA DE GERECIMENTO EMPRESARIAL - HARBOUR  | " + cUsuarioDigitado + Space(12) color ( cCorCabecalhos )
                @ 00,60 say " | " + dtoc(date()) + " " + SubStr( Time(), 1, 5) + Space(20)                     color ( cCorCabecalhos )
                @ 01,00 say cNomeEmpresa + Space(70)                                                           color ( "1/15" )
                
                Set Color to ( 0/7, 15/1 )
                
                @ 02,15 prompt " Assistencia Tecnica "
                @ 02,55 prompt " Finalizar "
                
                menu to nOpcao
                
                If nOpcao == 1
                    Set Color to ( 0/15, 15/1 ) 
                    
                    @ 05,04 to 08,26 color( "0/0" )
                    
                    @ 04,03 Clear to 07,25 
                    
                    @ 04,03 to 07,25
                    
                    @ 24,00 say Space(80)
                    
                    @ 05,04 prompt " Efetuar Pedidos    "  message " Modulo para efetuar Pedidos    "
                    @ 06,04 prompt " Finalizar o Sistema " message " Opcao para finalizar o Sistema "
                    
                    
                    menu to nOpcao
                    
                    if nOpcao == 1
                        //Dados da Ordem de Servico
                        do while .t.
                            //Dados Venda
                            nComissaoTotalTecnico := 0
                            nLinha         := 07
                            nTotalVenda    := 0
                            //Dados Cliente
                            cEntregaEmCasa   := Space(1)
                            cEndereco        := Space(20)
                            cBairroEndereco  := Space(10)
                            cRefEndereco     := Space(10)
                            cDescricaoEquip  := Space(40)
                            cNomeCliente     := Space(40)
                            cNomeTecnico     := Space(30)
                            dPedido          := CToD( DToC( dAtual ) )
                            dCompra          := CToD( DToC( dAtual ) )
                            cOpcaoEntrega    := "SN"
                            nTelefone        := 0
                            nLimiteCliente   := 0
                            nOpcaoMenu       := 0
                            nNumeroEndereco  := 0
                            cMensagem        := " Adicional de 3% no valor da OS. "
                            
                            Set color to 15/3

                            @ 09,02 to 21,79 color( "0/0" )
                            
                            @ 08,01 Clear to 20,78
                            
                            @ 08,01 to 20,78

                            //Cabecalho venda
                            @ 08,01 say " Dados da Ordem de Servico " + Space(51) color ( cCorCabecalhos )
                            @ 09,01 say " Limite Credito..: " + Space(30) + " Numero da OS:" + Transform( nNumeroPedido, cPictureNumerico3 )
                            @ 10,01 say " Cliente.........: " + Space(40) + " Data OS: "
                            @ 11,01 say " Tecnico.........: " + Space(30) + " Data Compra: "
                            @ 12,01 say " Entrega Domicilio.....:    [S/N]"
                            @ 13,01 say " Descricao Equipamento.: "
                            @ 14,02 to 14,77
        
                            //Get Cabecalho venda
                            @ 09,20 get nLimiteCliente  picture cPictureMonetario valid nLimiteCliente > 0             Color ( cCorTelaVendas )
                            @ 10,20 get cNomeCliente    picture cPictureCaracter  valid !Empty( cNomeCliente )         Color ( cCorTelaVendas )
                            @ 10,70 get dPedido                                   valid dPedido <= dAtual              Color ( cCorTelaVendas )
                            @ 11,20 get cNomeTecnico    picture cPictureCaracter  valid !Empty( cNomeTecnico )         Color ( cCorTelaVendas )
                            @ 11,64 get dCompra                                   valid dCompra <= dAtual              Color ( cCorTelaVendas )
                            @ 12,26 get cEntregaEmCasa  picture cPictureCaracter  valid cEntregaEmCasa $ cOpcaoEntrega Color ( cCorTelaVendas )
                            @ 13,26 get cDescricaoEquip picture cPictureCaracter  valid !Empty( cDescricaoEquip )      Color ( cCorTelaVendas )
                            read
                            
                            If Lastkey() == 27
                                nAlertOpcao := Alert( "Sair da Venda?", { cOpcaoSim, cOpcaoNao }, "4/7" )
                                if nAlertOpcao = 1
                                    exit
                                endif
                            Endif
                            
                            if Alltrim( cEntregaEmCasa ) == "S"
                                //Cabecalho venda
                                @ 15,02 say " Endereco......: " + Space(25) + " N.: "
                                @ 16,02 say " Bairro........: "
                                @ 17,02 say " Referencia....: " + Space(20) + " Telefone: "
                                @ 18,02 say cMensagem
                                
                                //Get Cabecalho venda
                                @ 15,19 get cEndereco       picture cPictureCaracter  valid !Empty( cEndereco )       Color ( cCorTelaVendas )
                                @ 15,50 get nNumeroEndereco picture cPictureNumerico4 valid nNumeroEndereco > 0       Color ( cCorTelaVendas )
                                @ 16,19 get cBairroEndereco picture cPictureCaracter  valid !Empty( cBairroEndereco ) Color ( cCorTelaVendas )
                                @ 17,19 get cRefEndereco    picture cPictureCaracter  valid !Empty( cRefEndereco )    Color ( cCorTelaVendas )
                                @ 17,51 get nTelefone       picture cPictureTelefone  valid nTelefone > 0             Color ( cCorTelaVendas )
                                read

                                If Lastkey() == 27
                                    nAlertOpcao := Alert( "Sair da Venda?", { cOpcaoSim, cOpcaoNao }, "4/7" )
                                    if nAlertOpcao = 1
                                        nNumeroPedido--
                                        exit
                                    endif
                                Endif
                            endif
                            
                            lGarantiaProd := .f.
                            lGarantiaServ := .f.

                            //Calculo de Garantia
                            if Day( dPedido ) < Day( dCompra ) .and. Month( dPedido ) <= Month( dCompra ) .and. Year( dPedido ) <= ( Year( dCompra ) + 2 )
                                lGarantiaProd := .t.
                            Elseif Day( dPedido ) < Day( dCompra ) .and. Month( dPedido ) <= Month( dCompra ) .and. Year( dPedido ) <= ( Year( dCompra ) + 1 )
                                lGarantiaServ := .t.
                            endif

                            //tela de Pedidos
                            do while .t.
                                //Variavel Tela de Venda/Assistencia
                                cPedidoServico := Space(1)
                                cOpcaoPedServ  := "PS"
                                
                                Set color to 15/3
                                
                                Clear
                                
                                @ 00,00 say " PEDIDO/DADOS DA ASSISTENCIA " + Space(80)                   color ( cCorCabecalhos )
                                @ 00,61 say "| " + dtoc(date()) + " " + SubStr( Time(), 1, 5) + Space(20) color ( cCorCabecalhos )
                                @ 01,00 say cNomeEmpresa + Space(70)                                      color ( "1/15" )
                                
                                @ 02,00 to 23,79                                
                                @ 03,01 Clear to 22,78
                                @ 24,00 say Space(80) color ( "1/15" )
                                
                                //Cabecalho venda
                                @ 02,00 say " Ordem de Servico " + Space(80) color ( cCorCabecalhos )
                                @ 03,02 say " [P]roduto [S]ervico ..: " + Space(38) + " OS:" + Transform( nNumeroPedido++, cPictureNumerico3 )
                                @ 04,01 to 04,78
                                
                                //Get Cabecalho venda
                                @ 03,27 get cPedidoServico picture cPictureCaracter valid cPedidoServico $ cOpcaoPedServ Color ( cCorTelaVendas )
                                read
                                
                                If Lastkey() == 27
                                    nAlertOpcao := Alert( "Sair da Venda?", { cOpcaoSim, cOpcaoNao }, "4/7" )
                                    if nAlertOpcao = 1
                                        nNumeroPedido--
                                        exit
                                    endif
                                Endif
                                
                                if Alltrim( cPedidoServico ) == "P"
                                    do while .t.
                                        //Dados produtos
                                        cDescricaoProd   := Space(30)
                                        nQntDigitadaProd := 0
                                        nPrecUnitProd    := 0
                                        nDescontoProd    := 0

                                        //Venda de produto Cabecalho
                                        @ 05,02 say " Descricao Produto" + Space(10) + " | Qtde. | Valor Unit.      | %Desc. |  Total    "
                                        @ 06,01 to 06,78

                                        @ nLinha,02 get cDescricaoProd   picture cPictureCaracter  valid !Empty( cDescricaoProd ) color ( cCorTelaVendas )
                                        @ nLinha,37 get nQntDigitadaProd picture cPictureNumerico4 valid nQntDigitadaProd >= 0    color ( cCorTelaVendas )
                                        @ nLinha,45 get nPrecUnitProd    picture cPictureMonetario valid nPrecUnitProd >= 0       color ( cCorTelaVendas )
                                        @ nLinha,65 get nDescontoProd    picture cPictureDesconto  valid nDescontoProd >= 0       color ( cCorTelaVendas )
                                        read

                                        If Lastkey() == 27
                                            nAlertOpcao := Alert( "Finalizar a Ordem de Servico?", { cOpcaoSim, cOpcaoNao, "Escolher outro Tipo" }, "4/7" )
                                            if nAlertOpcao = 1
                                                exit
                                            endif
                                        Endif

                                        //Total do servico
                                        nTotalProduto := nPrecUnitProd
                                        
                                        //Calculo do total do servico menos o desconto
                                        nTotalProduto -= nTotalProduto / nDescontoProd
                                        
                                        //Total da Venda
                                        nTotalVenda   += nTotalProduto

                                        if lGarantiaServ
                                            nTotalVenda := 0
                                        endif
                                        
                                        //Validacao do Limite para Compra
                                        if nTotalVenda > nLimiteCliente
                                            cUsuarioDigitado := Space(10)
                                            cSenhaDigitada   := Space(10)

                                            Set color to 0/7
        
                                            @ 15,25 Clear to 20,55 
                                            @ 15,25 to 20,55 
                                            
                                            @ 15,25 say " Senha de acesso:" + Space(14) color ( cCorCabecalhos )
                                            @ 17,30 say "Usuario...: "
                                            @ 18,30 say "Senha.....: "
                                            
                                            @ 17,43 get cUsuarioDigitado picture cPictureCaracter valid !Empty( cUsuarioDigitado ) color ( cCorCabecalhos )
                                            @ 18,43 get cSenhaDigitada                            valid !Empty( cSenhaDigitada )   color ( "1/1" )
                                            read
                                            
                                            If LastKey() == 27
                                                Exit
                                            endif

                                            If !( Alltrim( cSenhaDigitada ) == cSenhaSupervisor )   
                                                if !( nTotalVenda = 0 )
                                                    nTotalVenda -= nTotalServico
                                                else
                                                    nTotalVenda := 0
                                                endif
                                                Loop
                                            endif
                                        endif

                                        //Impressao do total servico e total venda
                                        @ nLinha++,74 say Transform( nTotalProduto, cPictureMonetario )
                                        @ 22,47       say "Total Compra: " + Transform( nTotalVenda, cPictureMonetario ) 
                                    enddo
                                Elseif Alltrim( cPedidoServico ) == "S"
                                    do while .t.
                                        //Dados Servico
                                        cDescricaoServ   := Space(25)
                                        nPrecUnitServ    := 0
                                        nDescontoServ    := 0
                                        nComissaoTecnico := 0

                                        //Cabechalho Servico
                                        @ 05,02 say " Descricao Servico" + Space(5) + " | Valor Unit.       | %Desc. | %Com. Tec. |  Total        "
                                        @ 06,01 to 06,78

                                        @ nLinha,02 get cDescricaoServ   picture cPictureCaracter  valid !Empty( cDescricaoServ ) color ( cCorTelaVendas )
                                        @ nLinha,28 get nPrecUnitServ    picture cPictureMonetario valid nPrecUnitServ    >= 0    color ( cCorTelaVendas )
                                        @ nLinha,48 get nDescontoServ    picture cPictureDesconto  valid nDescontoServ    >= 0    color ( cCorTelaVendas )
                                        @ nLinha,57 get nComissaoTecnico picture cPictureDesconto  valid nComissaoTecnico >= 0    color ( cCorTelaVendas )
                                        read

                                        If Lastkey() == 27
                                            nAlertOpcao := Alert( "Finalizar a Ordem de Servico?", { cOpcaoSim, cOpcaoNao, "Escolher outro Tipo" }, "4/7" )
                                            if nAlertOpcao = 1
                                                exit
                                            endif
                                        Endif

                                        //Comissao Tecnico
                                        nComissaoTotalTecnico += nTotalVenda / nComissaoTecnico
                                        
                                        //Total do servico
                                        nTotalServico := nPrecUnitServ
                                        
                                        //Calculo do total do servico menos o desconto
                                        nTotalServico -= nTotalServico / nDescontoServ
                                        
                                        //Total da Venda
                                        nTotalVenda   += nTotalServico

                                        if lGarantiaServ
                                            nTotalVenda := 0
                                        endif
                                        
                                        //Validacao do Limite para Compra
                                        if nTotalVenda > nLimiteCliente
                                            cUsuarioDigitado := Space(10)
                                            cSenhaDigitada   := Space(10)

                                            Set color to 0/7
        
                                            @ 15,25 Clear to 20,55 
                                            @ 15,25 to 20,55 
                                            
                                            @ 15,25 say " Senha de acesso:" + Space(14) color ( cCorCabecalhos )
                                            @ 17,30 say "Usuario...: "
                                            @ 18,30 say "Senha.....: "
                                            
                                            @ 17,43 get cUsuarioDigitado picture cPictureCaracter valid !Empty( cUsuarioDigitado ) color ( cCorCabecalhos )
                                            @ 18,43 get cSenhaDigitada                            valid !Empty( cSenhaDigitada )   color ( "1/1" )
                                            read
                                            
                                            If LastKey() == 27
                                                Exit
                                            endif

                                            If !( Alltrim( cSenhaDigitada ) == cSenhaSupervisor )   
                                                if !( nTotalVenda = 0 )
                                                    nTotalVenda -= nTotalServico
                                                else
                                                    nTotalVenda := 0
                                                endif
                                                Loop
                                            endif
                                        endif

                                        //Impressao do total servico e total venda
                                        @ nLinha++,70 say Transform( nTotalServico, cPictureMonetario )
                                        @ 22,02       say " Comissao Tecnico: " + Transform( nComissaoTotalTecnico, cPictureMonetario ) 
                                        @ 22,47       say "Total Compra: " + Transform( nTotalVenda, cPictureMonetario ) 
                                    enddo                               
                                endif
                                if nAlertOpcao == 3
                                    loop
                                elseif nAlertOpcao == 1
                                    Do While .t.

                                        @ 08,02 clear to 23,78
                                        
                                        @ 09,02 to 09,78 Double
                                        @ 11,02 to 11,78 Double
                                        @ 21,45 to 23,78 Double
                                        
                                        @ 10,37 say "FATURAMENTO"
                                        @ 12,03 say "[D]inheiro / [C]artao / Che[Q]ue: "
                                        @ 13,03 say "Total a Pagar...................: " + Transform( nTotal, '@E 999,999,999.99' )
                                        @ 14,03 say "Valor recebido..................: "
                                        
                                        @ 12,37 get cOpcaoPagamento picture '@!'          valid cOpcaoPagamento $'DCQ'
                                        @ 14,37 get nValorPagamento picture '@E 999,999,999.99' valid nValorPagamento > 0
                                        Read
                                        
                                        If nValorPagamento < nTotal
                                            nValorAbaixo := Alert( "Valor recebido menor que o valor total a pagar. Tente Novamente!", {"Ok"}, 'W+/R' )
                                            If nValorAbaixo == 1
                                                Loop
                                            Endif
                                        Endif
                                        
                                        @ 15,03 say "Valor Troco.....................: "
                                        @ 17,03 say "Pagamento efetuado com sucesso!"
                                        @ 18,03 say "Pressione alguma tecla para continuar."
                                        
                                        Inkey(0)
                                        
                                        @ 10,02 clear to 23,78
                                    Enddo
                                    exit
                                endif
                            enddo
                            If Lastkey() == 27
                                nAlertOpcao := Alert( "Sair da Venda?", { cOpcaoSim, cOpcaoNao }, "4/7" )
                                if nAlertOpcao = 1
                                    nNumeroPedido--
                                    exit
                                endif
                            Endif

                            if nAlertOpcao == 1
                                exit
                            endif
                        enddo
                    elseif nOpcao == 2 .or. lastkey() == 27
                        Exit                    
                    endif
                endif
            enddo
        endif
    enddo
enddo