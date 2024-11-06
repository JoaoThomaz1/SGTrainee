//Joao Vitor Rodrigues Thomaz
Set Color to 15/0

Clear

//Dados Jogador
cNomeJogador := Space(30)
cDificuldade := Space(1)
//Dicas
cDica1       := Space(25)
cDica2       := Space(25)
cDica3       := Space(25)
nDica        := 1
//Validadores
cNovaLetraDigitada   := Space(1) 
cAntigaLetraDigitada := ""
cCorpoBoneco         := ""
nContagemErros       := 0
nLinha               := 07
//Pictures
cPictureCaracter     := "@!"


//Corpo do Programa
do while .t.   
    //Impressao do jogador e Dificuldade
    @ 00,00 to 24,79

    @ 00,00 say "   JOGO DA FORCA" + Space(80) Color( "15/1" )
    
    @ 02,01 say " Jogador 1...: "
    @ 03,01 say " Dificuldade.: " + Space(3) + "[F]acil [M]edio [D]ificil" 

    //Get Jogador e Dificuldade
    @ 02,16 get cNomeJogador picture cPictureCaracter valid !Empty( cNomeJogador ) Color( "15/0" )
    @ 03,16 get cDificuldade picture cPictureCaracter valid cDificuldade $ "FMD"   Color( "15/0" )
    Read
    
    @ 05,01 to 05,78

    If LastKey() == 27
        nAlertOpcao := Alert( "Deseja Finalizar o Jogo?", { "Sim", "Nao" }, 4/15 )
        If nAlertOpcao := 1
            Exit
        else
            Loop
        Endif
    Endif

    if cDificuldade == "F"
        @ 07,01 say "Dica 1: "            
        @ 08,01 say "Dica 2: "            
        @ 09,01 say "Dica 3: "            
    
        @ 07,09 get cDica1 picture cPictureCaracter Valid !Empty( cDica1 ) Color( "15/0" )
        @ 08,09 get cDica2 picture cPictureCaracter Valid !Empty( cDica2 ) Color( "15/0" )
        @ 09,09 get cDica3 picture cPictureCaracter Valid !Empty( cDica3 ) Color( "15/0" )
        read

        @ 07,01 Clear to 09,35
    Endif

    //Alfabeto
    @ 07,02 to 09,54   
    @ 07,64 to 09,70   
    @ 12,02 to 14,25   

    cAlfabeto := "|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|"

    @ 06,25 say "Alfabeto"
    @ 08,02 say cAlfabeto 
    @ 08,65 say "Forca" 
    @ 13,03 say "Letra Escolhida: "




    Inkey( 0 )
enddo





// //Corpo do Programa
// do while .t.   
//     //Impressao do jogador e Dificuldade
//     @ 09,18 to 15,65

//     @ 09,18 say "   JOGO DA FORCA" + Space(32) Color( "15/1" )
    
//     Set Color to 0/15

//     @ 10,18 clear to 15,65

//     @ 11,20 say "Jogador 1...: " Color( "0/15" )
//     @ 13,20 say "Dificuldade.: " Color( "0/15" )

//     Inkey( 0 )
// enddo



// //Corpo do Programa
// do while .t.
//     //Banner abertura do Jogo
//     @ 07,03 to 12,76 Double Color( "15/5" )

//     @ 08,04 say " @@@@  @@@   @@@   @@@     @@@@   @@@     @@@@@  @@@  @@@@   @@@@  @@@  " Color( "15/5" )
//     @ 09,04 say "   @  @   @ @     @   @    @   @ @   @    @     @   @ @   @ @     @   @ " Color( "15/5" )
//     @ 10,04 say "   @  @   @ @  @@ @   @    @   @ @@@@@    @@@@  @   @ @@@@  @     @@@@@ " Color( "15/5" )
//     @ 11,04 say " @@@   @@@   @@@   @@@     @@@@  @   @    @      @@@  @   @  @@@@ @   @ " Color( "15/5" )
   
//     //Impressao do jogador e Dificuldade
//     @ 16,19 to 20,65

//     @ 17,20 say "Jogador 1...: " Color( "0/15" )
//     @ 19,20 say "Dificuldade.: " Color( "0/15" )


//     @ 23,26 to 25,50
    
//     @ 24,27 say "Powered by SG Sistemas."
//     Inkey( 0 )
// enddo


Inkey( 0 )