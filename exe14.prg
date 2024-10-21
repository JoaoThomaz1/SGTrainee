//Joao Vitor Roodrigues Thomaz

Clear

do while .t.

    nCodCli := 0 //Estava com 'Space(06)' geralmente usado para string nao para variavel numerica

    @ 12,10 say "Informe o codigo do cliente: " //usando acento em harbour e abrindo com asppas duplas e fechando com aspas simples

    @ 12,40 get nCodCli picture "999999" //picture escrita de forma errada 'pict'
    read

    Inkey(0) //para capturar a ultima tecladigitada precisamos de um inkey

    if LastKey() == 27
        exit        //nao precisa de confirmacao do loop apenas confirmacao para sair dele
    endif

enddo
