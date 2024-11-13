//Joao  Vitor Rodrigues Thomaz
Set Date to British
Set Epoch to 1940

do while .t.
    Set Color to
    
    Clear

    //Dados
    cNomeTeste        := " CORRECAO ENEM 2024 "
    cNomeParticipante := Space(40)
    cCorProva         := Space(10)
    dNascimento       := CToD("")
    dAplicacaoProva   := CToD("")
    cGabaritoProva    := "BBECEDCBADBCEBCADDECCADAAEDBAAAACEEEEBAACBACDECAADADEBCCDDCBEEACACDBEBDBBDABEBABEDAABBDABC" 
    nNumeroInscricao  := 0
    nProvaDoDia       := 0
    //Dados do Corretor
    nNumeroQuestao    := 1
    nNumeroMaxQuestao := 90
    cOpcaoResposta1   := "[A]"
    cOpcaoResposta2   := "[B]"
    cOpcaoResposta3   := "[C]"
    cOpcaoResposta4   := "[D]"
    cOpcaoResposta5   := "[E]"
    nOpcaoRespPrompt  := 0
    //Controle de linhas e Colunas
    nLinhaQuestao     := 04
    nColunaQuestao    := 01
    //Pictures
    cPictureCaracter   := "@!" 
    cPictureNumeroInsc := "9999999999"
    cPictureNumerico2  := "99"

    @ 00,00 to 24,79 
    @ 00,30 say cNomeTeste
    @ 01,01 say " NOME: " + Space(40) + " DATA DE NASCIMENTO: " 
    @ 02,01 say " INSCRICAO: " + Space(10) + " COR PROVA: " + Space(18) + " DATA DA PROVA.....: "
    @ 03,01 to 03,78
    
    @ 01,08 get cNomeParticipante picture cPictureCaracter   valid !Empty( cNomeParticipante )
    @ 01,69 get dNascimento                                  valid dNascimento < date()
    @ 02,13 get nNumeroInscricao  picture cPictureNumeroInsc valid nNumeroInscricao > 0
    @ 02,35 get cCorProva         picture cPictureCaracter   valid !Empty( cCorProva )
    @ 02,69 get dAplicacaoProva                              valid Year( dAplicacaoProva ) < Year( date() )
    read
    
    If LastKey()==27
        nOpcaoAlert := Alert( "Deseja: ", { "Digitar Novamente", "Sair" }, "15/1" )
        if nOpcaoAlert == 1
            loop
        else
            Exit
        endif
    endif

    @ 03,30 say " Prova " + cCorProva + " "

    do while .t.
        @ nLinhaQuestao,nColunaQuestao say Transform( nNumeroQuestao++, cPictureNumerico2 ) + 
    enddo
enddo
