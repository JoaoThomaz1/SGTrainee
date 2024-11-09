//Joao Vitor Rodrigues Thomaz

Set Date to British
Set Epoch to 1940

//Variavel
cNomeJogador    := Space(15)
cPalavraChave   := Space(15)
cDificuldade1   := " Facil "
cDificuldade2   := " Medio "
cDificuldade3   := " Dificil "
cCorPadrao      := "0/15" 
cCorInvisivel   := "7/7"
cDesenho        := ""
lFimDeJogo      := .f. 
nColunaChutes   := 45
nColunaInicial  := 23
nLinhaDesenho   := 09
cPalavraCerta   := ""
cMensagem       := ""
cEnforcado      := "Enforcado! Jogar Novamente?"
cVitoria        := "Voce Venceu! Jogar Novamente?"
nAlertOpcao     := 0
//Dicas
cDicas1     := Space(25)
cDicas2     := Space(25)
cDicas3     := Space(25)
nErros      := 0

//Boneco
cCabeca := " 0 "
cBracos := "/|\"
cCorpo  := " | "
cPernas := "/ \"
cPes    := "* *"
cEnforcamento := "_0_"
//Pictures
cPictureCaracter := "@!"
//Alertas
cAlertNeutro := "1/7"
cAlertAvisos := "4/7"
nAlertFimJogo:= 0

do while .t.
    Set Color to 0/15
    Clear

    cLetrasUsadas  := ""

    //Corpo do jogo
    @ 00,00 to 24,79
    @ 00,33 say " JOGO DA FORCA "

    @ 04,01 to 04,78
    @ 01,02 say " Nome......: "
    @ 02,02 say " Palavra...: "

    @ 01,15 get cNomeJogador  picture cPictureCaracter valid !Empty( cNomeJogador  )
    @ 02,15 get cPalavraChave picture cPictureCaracter valid !Empty( cPalavraChave ) Color ( cCorInvisivel )
    read

    If Lastkey() == 27
        nAlertOpcao := Alert( "Sair do Jogo?", { "Sim", "Nao" }, cAlertAvisos )
        if nAlertOpcao = 1
            exit
        endif
    Endif

    nTamanhoPalavra := Len( Alltrim( cPalavraChave ) )
    nDificuldade := Alert( "Dificuldade", { cDificuldade1, cDificuldade2, cDificuldade3 }, cAlertNeutro )

    if nDificuldade == 1
        //Dicas
        @ 01,40 say "Dica 1...: "
        @ 02,40 say "Dica 2...: "
        @ 03,40 say "Dica 3...: "

        @ 01,51 get cDicas1 picture cPictureCaracter valid !Empty( cDicas1 ) Color ( cCorInvisivel )
        @ 02,51 get cDicas2 picture cPictureCaracter valid !Empty( cDicas2 ) Color ( cCorInvisivel )
        @ 03,51 get cDicas3 picture cPictureCaracter valid !Empty( cDicas3 ) Color ( cCorInvisivel )
        read

        If Lastkey() == 27
            nAlertOpcao := Alert( "Sair do Jogo?", { "Sim", "Nao" }, cAlertAvisos )
            if nAlertOpcao = 1
                exit
            endif
        Endif
    endif

    do while .t.
        //Variaveis
        nSubstrPalavra := 1
        nAcertos       := 0
        nColunaPalavra := 00
        cLetraChute    := Space(1)
        cCorChutes     := "10/15"

        @ 05,02 say " Letra Escolhida....: "
        @ 07,02 say " Palavra Escolhida..: "

        @ 05,24 get cLetraChute picture cPictureCaracter valid cLetraChute $ cLetrasDisp
        read

        If Lastkey() == 27
            nAlertOpcao := Alert( "Recomecar o Jogo?", { "Sim", "Nao", "Sair" }, cAlertAvisos )
            if nAlertOpcao = 1
                exit
            endif
        Endif

        If Alltrim( cLetraChute ) $ cLetrasUsadas
            Alert( "Letra ja utilizada", { "Ok" }, cAlertAvisos )
            Loop
        endif 

        do while nTamanhoPalavra >= nSubstrPalavra
            if Alltrim( cLetraChute ) $ SubStr( cPalavraChave, nSubstrPalavra, 1 )
                nColunaPalavra := ( nColunaInicial + nSubstrPalavra )
                nAcertos++
                cPalavraCerta += cLetraChute
            Endif
            @ 07,nColunaPalavra say cLetraChute
            nSubstrPalavra++
        enddo

        if nAcertos = 0
            nErros++
            cCorChutes := "4/15"
            if nErros > 1 .and. !( nErros = 3 )
                nLinhaDesenho++
            endif
        endif

        if nErros = 1
            cDesenho := cCabeca
        elseif nErros = 2
            cDesenho     := cCorpo
            if nDificuldade == 1
                @ 01,51 say cDicas1
            endif
        elseif nErros = 3
            cDesenho := cBracos
            if nDificuldade == 1
                @ 02,51 say cDicas2
            endif
        elseif nErros = 4
            cDesenho := cPernas
            if nDificuldade == 1
                @ 03,51 say cDicas3
            elseif nDificuldade == 3
                nLinhaDesenho := 09
                cDesenho   := cEnforcamento
                lFimDeJogo := .t.
                cMensagem  := cEnforcado
            endif
        elseif nErros = 5
            cDesenho := cPes
            if nDificuldade == 2
                nLinhaDesenho := 09
                cDesenho   := cEnforcamento
                lFimDeJogo := .t.
                cMensagem  := cEnforcado
            endif
        elseif nErros = 6
            nLinhaDesenho := 09
            cDesenho := cEnforcamento
            lFimDeJogo := .t.
            cMensagem  := cEnforcado
        endif

        if Len( cPalavraCerta ) = nTamanhoPalavra
            lFimDeJogo := .t.
            cMensagem  := cVitoria
        endif

        nColunaChutes += 2
        cLetrasUsadas += cLetraChute

        //Letras Usadas   
        @ 06,55 say " Letra Usadas " 
        @ 07,nColunaChutes say cLetraChute Color cCorChutes

        //Desenho do boneco
        @ nLinhaDesenho,40 say cDesenho

        //Se fim de jogo
        if lFimDeJogo
            Inkey( 3 )
            nAlertFimJogo := Alert( cMensagem, { "Sim", "Nao" }, cAlertNeutro )
            exit
        endif
    enddo
    if nAlertFimJogo == 2 .or. nAlertOpcao == 3
        exit
    elseif nAlertFimJogo == 1
        loop
    endif
enddo