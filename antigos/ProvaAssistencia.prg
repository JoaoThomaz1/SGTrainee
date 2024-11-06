//Joao Vitor Rodrigues Thomaz
Set Color to 15/8 

Clear

Set Date to British
Set Epoch to 1940
do while .t.
    Set Color to 15/8 

    Clear 

    //Variaveis
    cPictureCaracter := "@!"
    
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
    
    
    
    @ 23,02 say "EMPRESA: 423 - SG SISTEMAS - CNPJ: 24009708000171" color ( "7/8" )
    @ 24,02 say "VERSAO: TRUNK DATA: XX/XX/XXXX REVISAO: 27237 COMPILACAO: 31/10/24 11:31hs" color ( "7/8" )
    
    do while .t.
        cUsuarioDigitado := Space(10)
        cSenhaDigitada   := Space(10)
        nOpcao           := 0
        cEntrega         := ""
        

        Set color to 0/7
        
        @ 15,25 Clear to 20,55 
        @ 15,25 to 20,55 
        
        @ 15,25 say " Senha de acesso:" + Space(14) color ( "15/1" )
        @ 17,30 say "Usuario...: "
        @ 18,30 say "Senha.....: "
        
        @ 17,43 get cUsuarioDigitado picture cPictureCaracter valid !Empty( cUsuarioDigitado ) color ( "15/1" )
        @ 18,43 get cSenhaDigitada picture cPictureCaracter valid !Empty( cSenhaDigitada ) color ( "1/1" )
        read
        
        If LastKey() == 27
            Exit
        endif

        Inkey( 0 )
        do while .t.
            Set Color to 15/7

            Clear

            Set Color to 0/8
            
            @ 03,00 clear to 24,80
            
            @ 00,00 say " SISTEMA DE GERECIMENTO EMPRESARIAL - HARBOUR  | " + cUsuarioDigitado + Space(10) color ( "15/1" )
            @ 00,61 say "| " + dtoc(date()) + " " + SubStr( Time(), 1, 5) + Space(20) color ( "15/1" )
            @ 01,00 say " SG SISTEMAS " + Space(70) color ( "1/15" )
            
            Set Color to ( 0/7, 15/1 )

            @ 02,05 prompt " Assistencia Tecnica "
            @ 02,35 prompt " Frutaria "
            @ 02,60 prompt " Finalizar "

            
            menu to nOpcao

            If nOpcao == 1
                Set Color to ( 0/15, 15/1 ) 
                
                @ 05,04 to 09,26 color( "0/0" )
                
                @ 04,03 Clear to 08,25 
                
                @ 04,03 to 08,25
                
                set message to 24
                @ 24,00 say Space(80)
                
                @ 05,04 prompt " Efetuar Pedidos    "  message " Modulo para efetuar Pedidos    "
                @ 06,04 prompt " Trocar de Usuario  "  message " Modulo para troca de Usuario   "
                @ 07,04 prompt " Finalizar o Sistema " message " Opcao para finalizar o Sistema "
                
                
                menu to nOpcao
                
                if nOpcao == 1
                    Set color to 15/3
                    
                    @ 00,00 say " CADASTRO DE CLIENTE " + Space(80) color ( "15/1" )
                    @ 00,61 say "| " + dtoc(date()) + " " + SubStr( Time(), 1, 5) + Space(20) color ( "15/1" )
                    
                    @ 08,16 to 22,78 color( "0/0" )
                    
                    @ 07,15 clear to 21,77
                    
                    @ 07,15 to 21,77
                    
                    @ 07,15 say " CADASTRO DO CLIENTE " + Space(42) color( "15/1" )
                    @ 08,17 say "Codigo......: " + Space(10) + "CNPJ/CPF.:" + Space(12) + "Idade..:"
                    @ 09,17 say "Cliente.....: "
                    @ 10,17 say "Tec.Respon..: " + Space(30) + "Entrega:" + Space(3) + "(S/N)"
                    @ 11,17 say "Limite Credito.: "
                    
                    Inkey( 0 )
                    If cEntrega == "S"
                        @ 12,16 to 12,69
                        @ 13,17 say "Endereco....: " + Space(20) + "Numero...:"
                        @ 14,17 say "Bairro......: "
                        @ 15,17 say "Cidade......: " + Space(20) + "Estado..:"                        
                        @ 16,17 say "Referencia..: "                        
                        @ 17,17 say "Telefone....: "                        
                        @ 20,17 say "Sera cobrado taxa de entrega de 4% sobre a OS "                        
                    endif
                    Inkey( 0 )
                    
                    If LastKey() == 27
                        loop
                    endif
                    
                    do while .t.
                        Set color to 15/3
                        
                        Clear
                        
                        @ 00,00 say " PEDIDO " + Space(80) color ( "15/1" )
                        @ 00,61 say "| " + dtoc(date()) + " " + SubStr( Time(), 1, 5) + Space(20) color ( "15/1" )
                        @ 01,00 say " SG SISTEMAS " + Space(70) color ( "1/15" )
                        
                        @ 02,00 to 23,79
                        @ 02,00 say " Ordem de Servico / Pedido " + Space(80) color( "15/1" )
                         
                        @ 03,02 say "Entrega Domicilio..: " + Space(3) + "(S/N)" + Space(2) + "Numero OS..: " + Space(10) + "Data da OS..: "
                        @ 04,02 say "Vendedor.....: " + Space(35) + "Data da Compra..: "
                        @ 05,02 say "Cliente......: "
                        @ 06,02 say "Equipamento..: "
                        @ 07,02 say "Descricao do Equipamento..: "
                        @ 08,02 say "Descricao do Problema..: "                        


                        @ 24,00 say Space(80) color ( "1/15" )
    
                        Inkey( 0 )
    
                        If LastKey() == 27
                            Exit
                        endif
                    enddo
                    
                    If LastKey() == 27
                        Loop
                    endif
                    
                Elseif nOpcao == 2
                    exit
                else
                    exit
                Endif
            Elseif nOpcao == 2
                //frutaria
            elseif nOpcao == 3 .or. LastKey() == 27
                exit
            endif
            
        enddo
        If nOpcao == 3 .or. LastKey() == 27
            exit
        endif
    enddo
    If nOpcao == 3 .or. LastKey() == 27
        Set Color to 15/0
        clear
        exit
    endif
    
enddo


// Set color to 0/1

// @ 02,00 Clear to 02,79 


// menu to nOpcao

// Set Color to 15/8 

// if nOpcao = 1
//     Alert( "teste 1" )
// else
//     Alert( "teste 2" )
// endif