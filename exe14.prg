//Joao Vitor Roodrigues Thomaz

Clear

do while .t.

    nCodCliente := 0 //Estava com 'Space(06)' geralmente usado para string nao para variavel numerica, Nome da variavel pouca informacao

    @ 12,10 say "Informe o codigo do cliente: " //usando acento em harbour e abrindo com asppas duplas e fechando com aspas simples

    @ 12,40 get nCodCliente picture "999999" valid nCodCliente > 0 //picture escrita de forma errada 'pict' e sem valid
    read

    if LastKey() == 27
        exit        //nao precisa de confirmacao do loop apenas confirmacao para sair dele
    endif

enddo
