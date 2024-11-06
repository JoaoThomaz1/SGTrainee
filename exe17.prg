//Joao Vitor Rodrigues Thomaz

Set Color to  0/15

Clear

Set Date to British
Set Epoch to 1940


do while .t.
    //Variaveis
    cNomeUsuario := Space(10)
    cPictureCarac:= "@!"
    nColuna       := 31
    
    Clear
    
    @ 15,25 say "Nome: "
    
    @ 15,31 get cNomeUsuario picture cPictureCarac valid !Empty( cNomeUsuario )
    read

    If LastKey() == 27
        nAlertOpcao := Alert( "Deseja Sair?", { "Sim", "Reiniciar", "Nao" }, '4/15' )
        if nAlertOpcao = 1 
            exit
        elseif  nAlertOpcao = 2
            loop
        endif
    endif
    
    cNomeUsuario := AllTrim( cNomeUsuario )
    nTamanhoNome := Len( cNomeUsuario )        
    
    do while nTamanhoNome >= 0
        cNomeImpresso := SubStr( cNomeUsuario, nTamanhoNome, nTamanhoNome-- )

        @ 17,nColuna++ say cNomeImpresso
    enddo
    Inkey(0)
enddo