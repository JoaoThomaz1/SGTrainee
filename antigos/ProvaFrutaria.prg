//João Vitor Rodrigues Thomaz
Set color to N/N+

Clear

SetMode(25,80)
Set Scoreboard Off
Set Date to British

//Variaveis do Picture
cPictureCaracter := "@!"


//Variaveis
cNomeEmpresa        := "FRUTARIA DO JOAO"
cUsuarioValido      := "ADMIN"
cSenhaValido        := "ADMIN"
cUsuarioDigitado    := Space(10)    //Criado as Variaveis cXxxxxValido para que valide posteriorente o Usuario e Senha que for digitado
cSenhaDigitada      := Space(10)
//Dados Venda
nNumeroPedido       := 1
cNomeCliente        := Space(15)
nLimiteCredito      := 0
dPedido             := CToD("")
dAtual              := date()
//Info Produtos
cDescricaoProduto1  := "BANANA PRATA"
cDescricaoProduto2  := "PERA ARGENTINA"
cDescricaoProduto3  := "BATATA PERUANA"
cDescricaoProduto4  := "ABACATE NEGRO"
nCodigoProduto1     := 3500
nCodigoProduto2     := 4501
nCodigoProduto3     := 7001
nCodigoProduto4     := 6002
nPrecoUnit1         := 3.50 
nPrecoUnit2         := 7.00
nPrecoUnit3         := 2.00
nPrecoUnit4         := 1.99
nEstoqueProduto1    := 125.00
nEstoqueProduto2    := 119.50
nEstoqueProduto3    := 865.00
nEstoqueProduto4    := 200.00
nDescontoProduto    := 0
nQtdeProduto        := 0
nValorTotalPorProd  := 0
nValorTotalCompra   := 0

do while .t.

    @ 05,30 say cNomeEmpresa
    @ 10,15 say "USER: "
    @ 11,11 say "PASSWORD: "

    @ 10,21 get cUsuarioDigitado picture cPictureCaracter valid !Empty( cUsuarioDigitado ) color "N+/N"
    @ 11,21 get cSenhaDigitada   picture cPictureCaracter valid !Empty(  cSenhaDigitada  ) color "N+/N"
    read

    if cUsuarioDigitado = cUsuarioValido .and. cSenhaDigitada = cSenhaValido
        Clear

        @ 05,30 say cNomeEmpresa
        @ 10,20 prompt "EFETUAR PEDIDOS" message "PROSSIGA PARA A TELA DE VENDA"
        @ 11,20 prompt "SAIR"            message "SAIR DO PROGRAMA"

        Menu to nOpcao1
        
        if nOpcao1 = 1
            do while .t.
                Set Color to B+/N+
        
                Clear
                
                @ 02,30 say cNomeEmpresa + Space(10) + "PEDIDO: " + AllTrim( Str( nNumeroPedido ) )
                @ 03,50 say "DATA DO PEDIDO: "
                @ 04,05 say "CLIENTE: " + Space(16) + "LIMITE CREDITO: R$"
                @ 06,05 say "CODIGO" + Space(3) + "DESCRICAO" + Space(6) + "QTDE." + Space(3) + "PRECO UNIT." + Space(3) + "DESC.%" + Space(3) + "TOTAL"
                
                @ 04,15 get cNomeCliente   picture cPictureCaracter valid !Empty( cNomeCliente )
                @ 04,50 get nLimiteCredito picture "@E 99,999.99" valid nLimiteCredito > 0
                @ 04,67 get dPedido                                 valid dPedido <= dAtual  
                Read
                
            enddo
        else
            exit
        endif        
    else
        
    endif    
enddo


inkey(0)
