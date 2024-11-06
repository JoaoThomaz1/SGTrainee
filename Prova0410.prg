//Joao Vitor Rodrigues Thomaz
Set Date to British
Set Epoch to 1940

//Variaveis
nCodigo          := 0
cPictureMenu     := "9"
cPictureCodigo   := "999"
cPictureCaracter := "@!"
cListaSenhas     := ""
cListaDatas      := ""
cCodigoSenhas    := ""
cTamanhoSenhas   := ""

do while .t.
    //Variaveis
    nOpcaoMenu       := 0
    nCodigoDigitado  := 0
    cCodigoDigitado  := ""
    //Validacao da Senha
    cCaracterEspecial:= "!@#$%^&*()-+"
    cNumeroSenha     := "0123456789"
    cLetraMaiuscula  := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    cLetraMinuscula  := "abcdefghijklmnopqrstuvwxyz"
    lNumeroSenha     := .f.
    lCaracEspecSenha := .f.
    lLetraMaiuscSenha:= .f.
    lLetraMinuscSenha:= .f.
    
    Set Color to 8/7

    Clear
    
    //Moldura Programa
    @ 00,00 to 24,79

    Set Color to 0/15

    //Sombra menu
    @ 03,03 to 08,26 color( "0/0" )

    //Fundo Menu
    @ 02,02 Clear to 07,25 

    //Borda Menu
    @ 02,02 to 07,25

    //Cabecalho e opcoes menu
    @ 02,02 say " Menu" + Space(19) color ( "15/1" )
    @ 03,03 say "1 - Cadastrar"
    @ 04,03 say "2 - Consultar"
    @ 05,03 say "3 - Sair"
    
    //Get da opcao do menu
    @ 06,05 get nOpcaoMenu picture cPictureMenu valid nOpcaoMenu > 0 .and. nOpcaoMenu <= 3
    read
    
    //Se o Usuario quiser sair
    If LastKey() == 27
        nOpcaoAlert := Alert( "Sair do programa?", { "Sim", "Nao" }, "4/15" )
        If nOpcaoAlert == 1
            exit
        endif
    endif
    
    if nOpcaoMenu == 1
        do while .t.
            //Variaveis
            cSenha        := Space(12)
            dCadastro     := CToD("")
            nInicioSubStr := 1

            Set Color to 15/3
            
            //Sombra Cadastro Senha
            @ 08,26 to 12,61 color( "0/0" )
            
            //Fundo Cadastro Senha
            @ 07,25 Clear to 11,60 
            
            //Borda Cadastro Senha
            @ 07,25 to 11,60
            
            //Cadastro Senha
            @ 07,25 say " Cadastro de Senha" + Space(18) color ( "15/1" )
            @ 08,26 say " Codigo............: " + Transform( ( nCodigo + 1 ), cPictureCodigo )
            @ 09,26 say " Senha.............: "
            @ 10,26 say " Data Cadastro.....: "

            //Get Cadastro Senha
            @ 09,47 get cSenha    valid !Empty(  cSenha   ) 
            @ 10,47 get dCadastro valid !Empty( dCadastro )
            read
            
            //Se o Usuario quiser sair
            If LastKey() == 27
                nOpcaoAlertCadastro := Alert( "Voltar?", { "Sim", "Nao" }, "4/15" )
                If nOpcaoAlertCadastro == 1
                    exit
                endif
            endif
            
            cSenha        := Alltrim( cSenha ) 
            nTamanhoSenha := Len( cSenha )
            
            //Se a senha e maior ou igual a 8
            if nTamanhoSenha < 8
                nOpcaoAlert := Alert( "A senha deve ter no minimo 8 digitos!", {"OK"} )
                nCodigo--
                loop
            endif
            
            //Se contem Letra Maiuscula
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( cSenha, nInicioSubStr++, 1  ) $ cLetraMaiuscula 
                    lLetraMaiuscSenha := .t.
                    nInicioSubStr     := 1
                    exit
                else
                    loop
                endif                        
            enddo
            
            if !( lLetraMaiuscSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos uma letra maiuscula!", {"OK"} )
                nCodigo--
                loop
            endif   
            
            //Se contem Numero
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( cSenha, nInicioSubStr++, 1  ) $ cNumeroSenha 
                    lNumeroSenha  := .t.
                    nInicioSubStr := 1
                    exit
                else
                    loop
                endif         
            enddo
            
            if !( lNumeroSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos um Numero!", {"OK"} )
                nCodigo--
                loop
            endif   
            
            //Se contem Letra Minuscula
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( cSenha, nInicioSubStr++, 1  ) $ cLetraMinuscula
                    lLetraMinuscSenha := .t.
                    nInicioSubStr     := 1
                    exit
                else
                    Loop
                endif             
            enddo
            
            if !( lLetraMinuscSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos uma letra minuscula!", {"OK"} )
                nCodigo--
                loop
            endif   
            
            //Se contem Caracter Especial
            do while nInicioSubStr <= nTamanhoSenha
                if SubStr( cSenha, nInicioSubStr++, 1  ) $ cCaracterEspecial
                    lCaracEspecSenha := .t.
                    nInicioSubStr    := 1
                    exit
                else
                    Loop
                endif         
            enddo
            
            if !( lCaracEspecSenha ) 
                nOpcaoAlert := Alert( "A senha deve conter ao menos um Caracter Especial!", {"OK"} )
                nCodigo--
                loop
            endif   

            nCodigo++
            cListaSenhas   += cSenha
            cListaDatas    += DToC( dCadastro )
            cCodigoSenhas  += Transform( nCodigo, cPictureCodigo )
            cTamanhoSenhas += Transform( nTamanhoSenha, cPictureCodigo )
        enddo
    Elseif nOpcaoMenu == 2
        if nCodigo == 0
            nOpcaoAlert := Alert( "Nao existem senhas cadastradas.", { "Ok" } )
            if nOpcaoAlert = 1
                Loop                 
            endif
        endif

        Set Color to 15/3
        
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
            If nOpcaoAlertCadastro == 1
                loop
            endif
        endif

        // cCodigoDigitado := Transform( nCodigoDigitado, cPictureCodigo )

        // do while nInicioSubStr <= nTamanhoSenha
        //     if SubStr( cCodigoDigitado, nInicioSubStr++, 1  ) $ cCodigoSenhas
        //         cTamanhoSenhaEscolhida := SubStr( cTamanhoSenhas, nCodigoDigitado, 2 )
        //         if nTamanhoSenhaEscolhida > 12 .and. nTamanhoSenhaEscolhida < 8
        //             nTamanhoSenhaEscolhida := SubStr( cTamanhoSenhas, nCodigoDigitado, 1 )
        //         endif
        //     endif            
        // enddo

        // if nCodigoDigitado == 1
        //     nComecoData := 1
        // else
        //     nComecoData := ( 8 * nCodigoDigitado ) + 1
        // endif

        // // dSenhaEscolhida := DToC( SubStr( cListaDatas, nComecoData, 8 ) )

        // Alert( SubStr( cListaDatas, nComecoData, 8 ), {"ok"} )
        // inkey(0)

        @ 23,02 say "Aperte qualquer tecla para continuar...." Color("8/7")
        Inkey( 0 )

    Else
        exit
    Endif
enddo