//Joao Vitor Roodrigues Thomaz

Clear

nCodigoProduto := 0
cClassificacao := ""

@ 10,20 say "Digite o Codigo do produto: "

@ 10,48 get nCodigoProduto picture "99" valid !Empty(nCodigoProduto)
read

If nCodigoProduto == 1
    cClassificacao := "Alimento nao-perecivel"
Elseif nCodigoProduto >= 2 .and. nCodigoProduto <=4
    cClassificacao := "Alimento perecivel"
Elseif nCodigoProduto >= 5 .and. nCodigoProduto <=6
    cClassificacao := "Vestuario"
Elseif nCodigoProduto == 7
    cClassificacao := "Higiene pessooal"
Elseif nCodigoProduto >= 8 .and. nCodigoProduto <=15
    cClassificacao := "Limpeza e Utensilios Domesticos"
Else
    @ 12,25 say "Codigo invalido!"
    Quit
Endif

    @ 12,15 say "O produto e classificado como " + cClassificacao

Inkey(0)