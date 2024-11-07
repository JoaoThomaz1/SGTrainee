//Joao Vitor Rodrigues Thomaz
Set Date to British
Set Epoch to 1940
Set message to 24 center
Set wrap on

//Variaveis
nCodigo          := 0
cPictureMenu     := "9"
cPictureCodigo   := "999"
cPictureCaracter := "@!"
cListaSenhas     := ""
cListaDatas      := ""
cCodigoSenhas    := ""
cTamanhoSenhas   := ""
nOpcaoMenu       := 0

do while .t.
    //Variaveis
    cCodigoDigitado  := ""
    //Validacao da Senha
    cCaracterEspecial:= "!@#$%^&*()-+"
    cNumeroSenha     := "0123456789"
    cLetraMaiuscula  := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    cLetraMinuscula  := "abcdefghijklmnopqrstuvwxyz"
    
    Set Color to 8/7
    
    Clear
    
    //Moldura Programa
    @ 00,00 to 24,79
    
    Set Color to ( 0/15, 15/1 )
    
    //Sombra menu
    @ 03,03 to 08,26 color( "0/0" )
    
    //Fundo Menu
    @ 02,02 Clear to 07,25 
    
    //Borda Menu
    @ 02,02 to 07,25
    @ 24,00 say Space(80)
    
    //Cabecalho e opcoes menu
    @ 02,02 say " Menu" + Space(19) color ( "15/1" )
    @ 04,03 prompt " Cadastrar " message "Modulo para Cadastro de Senhas"
    @ 05,03 prompt " Consultar " message "Modulo para Consulta de Senhas"
    @ 06,03 prompt " Sair      " message "Sair do programa"     

    Menu to nOpcaoMenu
    
    If Empty( nOpcaoMenu )
        nOpcaoMenu := 3
    Endif
    
    if nOpcaoMenu == 1
        do while .t.
            
            If nCodigo = 0
                nCodigo := 1
            Endif
            
            //Variaveis
            lNumeroSenha     := .f.
            lCaracEspecSenha := .f.
            lLetraMaiuscSenha:= .f.
            lLetraMinuscSenha:= .f.
            cSenha        := Space(12)
            dCadastro     := CToD("")
            nInicioSubStr := 1
            
            Set Color to ( 15/3, 0/7 )
            
            //Sombra Cadastro Senha
            @ 08,26 to 12,61 color( "0/0" )
            
            //Fundo Cadastro Senha
            @ 07,25 Clear to 11,60 
            
            //Borda Cadastro Senha
            @ 07,25 to 11,60
            
            //Cadastro Senha
            @ 07,25 say " Cadastro de Senha" + Space(18) color ( "15/1" )
            @ 08,26 say " Codigo............: " + Transform( ( nCodigo++ ), cPictureCodigo )
            @ 09,26 say " Senha.............: "
            @ 10,26 say " Data Cadastro.....: "
            
            //Get Cadastro Senha
            @ 09,47 get cSenha    valid !Empty(  cSenha   ) 
            @ 10,47 get dCadastro valid !Empty( dCadastro ) .and. dCadastro <= date()
            read
            
            //Se o Usuario quiser sair
            If LastKey() == 27
                nOpcaoAlertCadastro := Alert( "Voltar?", { "Sim", "Nao" }, "4/15" )
                If nOpcaoAlertCadastro = 1
                    nCodigo--
                    exit
                endif
            endif
            
            cListaSenhas   += cSenha
            cListaDatas    += DToC( dCadastro )
             
            nTamanhoSenha := Len( alltrim( cSenha ) )
            
            //Se a senha e maior ou igual a 8
            if nTamanhoSenha < 8
                nOpcaoAlert := Alert( "A senha deve ter no minimo 8 digitos!", {"OK"} )
                nCodigo--
                loop
            endif
            
            //Se contem Letra Maiuscula
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( alltrim( cSenha ), nInicioSubStr++, 1  ) $ cLetraMaiuscula 
                    lLetraMaiuscSenha := .t.
                    nInicioSubStr     := 1
                    exit
                endif                        
            enddo
            
            if !( lLetraMaiuscSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos uma letra maiuscula!", {"OK"} )
                nCodigo--
                loop
            endif   

            //Se contem Numero
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( alltrim( cSenha ), nInicioSubStr++, 1  ) $ cNumeroSenha 
                    lNumeroSenha  := .t.
                    nInicioSubStr := 1
                    Exit
                endif         
            enddo
            
            if !( lNumeroSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos um Numero!", {"OK"} )
                nCodigo--
                loop
            endif   
            
            //Se contem Letra Minuscula
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( alltrim( cSenha ), nInicioSubStr++, 1  ) $ cLetraMinuscula
                    lLetraMinuscSenha := .t.
                    nInicioSubStr     := 1
                    exit
                endif             
            enddo
            
            if !( lLetraMinuscSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos uma letra minuscula!", {"OK"} )
                nCodigo--
                loop
            endif   
            
            //Se contem Caracter Especial
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( alltrim( cSenha ), nInicioSubStr++, 1  ) $ cCaracterEspecial
                    lCaracEspecSenha := .t.
                    nInicioSubStr    := 1
                    exit
                endif         
            enddo
            if !( lCaracEspecSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos um Caracter Especial!", {"OK"} )
                nCodigo--
                loop
            endif   
            
        enddo
    Elseif nOpcaoMenu = 2
        if nCodigo = 0
            nOpcaoAlert := Alert( "Nao existem senhas cadastradas.", { "Ok" } )
            if nOpcaoAlert = 1
                Loop                 
            endif
        endif
        do while .t.
            
            Set Color to ( 15/3, 0/7 )
            
            nCodigoDigitado  := 0
            
            //Sombra Cadastro Senha
            @ 08,26 to 12,61 color( "0/0" )
            
            //Fundo Cadastro Senha
            @ 07,25 Clear to 11,60 
            
            //Borda Cadastro Senha
            @ 07,25 to 11,60
            
            //Cadastro Senha
            @ 07,25 say " Cadastro de Senha" + Space(18) color ( "15/1" )
            @ 08,26 say " Codigo............: "
            
            @ 08,47 get nCodigoDigitado valid !Empty( nCodigoDigitado )
            read
            
            If LastKey() == 27
                nOpcaoAlertCadastro := Alert( "Voltar?", { "Sim", "Nao" }, "4/15" )
                If nOpcaoAlertCadastro = 1
                    exit
                endif
            endif
            
            nComecoData  := 1
            nComecoSenha := 1
            
            if nCodigoDigitado > 1
                nComecoData  += 8
                nComecoSenha += 12
            endif
            
            cSenhaEscolhida:= SubStr( cListaSenhas, nComecoSenha, 12 )
            cDataEscolhida := SubStr( cListaDatas , nComecoData, 8 )
            
            @ 09,26 say " Senha.............: " + Alltrim( cSenhaEscolhida )
            @ 10,26 say " Data Cadastro.....: " + cDataEscolhida

            nLinhaCalendario  := 15
            nColunaCalendario := 31
            
            //Calendario
            dEscolhida    := CToD( cDataEscolhida )
            nMesEscolhido := Month( dEscolhida )
            cDataEscolhida := "01/" + Transform( nMesEscolhido, "99" ) + "/" + Transform( year( dEscolhida ), "99" )
            dEscolhida     := ctod( cDataEscolhida )
            nDiaComecoMes  := Day( dEscolhida )
            
            //Dia da Semana
            nDiaSemana    := DoW( dEscolhida )


            do while .t.
                If nDiaSemana > 1
                    nColunaCalendario += 4 * nDiaSemana
                    exit
                Endif
            enddo
        
            //Ultimo dia do Mes
            nMesEscolhido += 1
            if nMesEscolhido = 13
                nMesEscolhido := 01
            endif
        
            cDataEscolhida := "01/" + Transform( nMesEscolhido, "99" ) + "/" + Transform( year( dEscolhida ), "99" )
            dEscolhida     := ctod( cDataEscolhida )
            nDiaFinalMes   := Day( dEscolhida - 1 )
            
            //Sombra Calendario
            @ 14,31 to 22,54 color( "0/0" )
            //Fundo Calendario
            @ 13,30 Clear to 20,53
            //Borda Cadastro Senha
            @ 13,30 to 21,53
            
            //Cabecalho calendario
            @ 14,31 say " D " Color("4/3")
            @ 14,34 say " S  T  Q  Q  S  S "
            
            do while nDiaFinalMes >= nDiaComecoMes

                @ nLinhaCalendario,nColunaCalendario say Transform( nDiaComecoMes, "99" )

                nColunaCalendario += 3

                If nColunaCalendario > 50
                    nColunaCalendario := 31
                    nLinhaCalendario++
                Endif

                nDiaComecoMes++

            enddo
            
            @ 24,00 say "  Aperte qualquer tecla para continuar...." + Space(80) Color("0/15")
            Inkey( 0 )

            Set Color to 8/7
            @ 12,25 Clear to 23,78
        enddo
        
    Else
        nOpcaoAlert := Alert( "Sair do programa?", { "Sim", "Nao" }, "4/15" )
        If nOpcaoAlert == 1
            exit
        endif
    Endif
enddo