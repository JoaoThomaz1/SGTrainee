//Joao Vitor Rodrigues Thomaz
Clear

Set wrap on

//Variavel
cNomeJogador1 := Space(10)
cNomeJogador2 := Space(10)
nOpcaoJogada  := 0
cJogador      := "X"
nJogada       := 1

//Desenho X
cJogadaXpart1 := "\ /"
cJogadaXpart2 := " X "
cJogadaXpart3 := "/ \"
//Desenho O
cJogadaOpart1 := "/ \"
cJogadaOpart2 := "| |"
cJogadaOpart3 := "\ /"

//Campos
nLinha1  := 06
nLinha2  := 10
nLinha3  := 14
nColuna1 := 16
nColuna2 := 20
nColuna3 := 24

//Validacao Jogadas
cJogadasJogadarO      := ""
cJogadasJogadarX      := ""
cPossibilidadesGanho1 := "159"
cPossibilidadesGanho2 := "357"
cPossibilidadesGanho3 := "123"
cPossibilidadesGanho4 := "456"
cPossibilidadesGanho5 := "789"
cPossibilidadesGanho6 := "147"
cPossibilidadesGanho7 := "258"
cPossibilidadesGanho8 := "369"

do while .t.
    //Corpo jogo
    @ 09,16 to 09,26
    @ 13,16 to 13,26
    @ 06,19 to 16,19
    @ 06,23 to 16,23

    //Coluna Escolhas
    @ 07,30 to 07,37
    @ 09,30 to 09,37
    @ 06,32 to 10,32
    @ 06,35 to 10,35

    //Escolha de Jogada
    @ 06,30 prompt " 1"
    @ 06,33 prompt " 2"
    @ 06,36 prompt " 3"
    @ 08,30 prompt " 4"
    @ 08,33 prompt " 5"
    @ 08,36 prompt " 6"
    @ 10,30 prompt " 7"
    @ 10,33 prompt " 8"
    @ 10,36 prompt " 9"

    Menu to nOpcaoJogada

    If nOpcaoJogada == 1
        nLinha := nLinha1
        nColuna:= nColuna1
    ElseIf nOpcaoJogada == 2
        nLinha := nLinha1
        nColuna:= nColuna2
    ElseIf nOpcaoJogada == 3
        nLinha := nLinha1
        nColuna:= nColuna3
    ElseIf nOpcaoJogada == 4
        nLinha := nLinha2
        nColuna:= nColuna1
    ElseIf nOpcaoJogada == 5
        nLinha := nLinha2
        nColuna:= nColuna2
    ElseIf nOpcaoJogada == 6
        nLinha := nLinha2
        nColuna:= nColuna3
    ElseIf nOpcaoJogada == 7
        nLinha := nLinha3
        nColuna:= nColuna1
    ElseIf nOpcaoJogada == 8
        nLinha := nLinha3
        nColuna:= nColuna2
    ElseIf nOpcaoJogada == 9
        nLinha := nLinha3
        nColuna:= nColuna3
    Endif

    //Validacao jogador 1
    if Alltrim( cJogador ) == "X"
        cDesenhoJogadaPart1 := cJogadaXpart1
        cDesenhoJogadaPart2 := cJogadaXpart2
        cDesenhoJogadaPart3 := cJogadaXpart3
        cJogador            := "O"
        cJogadasJogadarX    += Transform( nOpcaoJogada, "9" )
    //Validacao jogador 2
    Elseif Alltrim( cJogador ) == "O"
        cDesenhoJogadaPart1 := cJogadaOpart1
        cDesenhoJogadaPart2 := cJogadaOpart2
        cDesenhoJogadaPart3 := cJogadaOpart3
        cJogador            := "X"
        cJogadasJogadarO    += Transform( nOpcaoJogada, "9" )
    Endif

    @ nLinha    ,nColuna say cDesenhoJogadaPart1
    @ nLinha + 1,nColuna say cDesenhoJogadaPart2
    @ nLinha + 2,nColuna say cDesenhoJogadaPart3

    nJogada++

    if nJogada >= 5
        if cJogadasJogadarX $ cPossibilidadesGanho1 .or. cJogadasJogadarX $ cPossibilidadesGanho2 .or. cJogadasJogadarX $ cPossibilidadesGanho3 .or. cJogadasJogadarX $ cPossibilidadesGanho4

        elseif cJogadasJogadarX $ cPossibilidadesGanho5 .or. cJogadasJogadarX $ cPossibilidadesGanho6 .or. cJogadasJogadarX $ cPossibilidadesGanho7 .or. cJogadasJogadarX $ cPossibilidadesGanho8

        elseif cJogadasJogadarO $ cPossibilidadesGanho1 .or. cJogadasJogadarO $ cPossibilidadesGanho2 .or. cJogadasJogadarO $ cPossibilidadesGanho3 .or. cJogadasJogadarO $ cPossibilidadesGanho4

        elseif cJogadasJogadarO $ cPossibilidadesGanho5 .or. cJogadasJogadarO $ cPossibilidadesGanho6 .or. cJogadasJogadarO $ cPossibilidadesGanho7 .or. cJogadasJogadarO $ cPossibilidadesGanho8

        endif
    endif

    Inkey(0)
enddo

// //Jogada X
// @ 06,16 say "\ /"
// @ 07,16 say " X "
// @ 08,16 say "/ \"

// //Jogada O
// @ 10,16 say "/ \"
// @ 11,16 say "| |"
// @ 12,16 say "\ /"