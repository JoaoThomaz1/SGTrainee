//João Vitor Rodrigues Thomaz
Set color to N/N+

Clear

SetMode(25,80)
Set Scoreboard Off
Set Date to British

//Variaveis
cUsuarioValido      := "ADMIN"
cSenhaValido        := "ADMIN"
cUsuarioDigitado    := Space(10)    //Criado as Variaveis cXxxxxValido para que valide posteriorente o Usuario e Senha que for digitado
cSenhaDigitada      := Space(10)
//Dados Venda
nNumeroPedido       := 1
cNomeCliente        := Space(15)
nLimiteCredito      := 0
dPedido             := date()
nCodigoProduto1     := 3500
nCodigoProduto2     := 4501
nCodigoProduto3     := 7001
nCodigoProduto4     := 6002
cDescricaoProduto1  := ""
cDescricaoProduto2  := ""
cDescricaoProduto3  := ""
cDescricaoProduto4  := ""
nQtdeProduto        := 0
nPrecoUnit1         := 3.50 
nPrecoUnit2         := 7.00
nPrecoUnit3         := 2.00
nPrecoUnit4         := 1.99
