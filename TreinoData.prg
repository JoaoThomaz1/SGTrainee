//Joao Vitor Rodrigues Thomaz

Set Color to RB/W

Clear

Set Date to british
Set epoch to 1940

//Datas
dAtual      := Date()
nMes        := Month(dAtual)
nAno        := Year (dAtual)
nDia        := Day  (dAtual)
nDiaSemana  := DoW  (dAtual)
cMesExtenso := ""
cSemanaExt  := ""

//If para data cabecalho
If nMes     == 1
    cMesExtenso := "Janeiro"

Elseif nMes == 2
    cMesExtenso := "Fevereiro"

Elseif nMes == 3
    cMesExtenso := "Marco"

Elseif nMes == 4
    cMesExtenso := "Abril"

Elseif nMes == 5
    cMesExtenso := "Maio"

Elseif nMes == 6
    cMesExtenso := "Junho"

Elseif nMes == 7
    cMesExtenso := "Julho"

Elseif nMes == 8
    cMesExtenso := "Agosto"

Elseif nMes == 9
    cMesExtenso := "Setembro"

Elseif nMes == 10
    cMesExtenso := "Outubro"

Elseif nMes == 11
    cMesExtenso := "Novembro"

Elseif nMes == 12
    cMesExtenso := "Dezembro"

Endif

If nDiaSemana == 1
    cSemanaExt := "Domingo"

Elseif nDiaSemana == 2
    cSemanaExt := "Segunda-Feira"

Elseif nDiaSemana == 3
    cSemanaExt := "Terca-Feira"

Elseif nDiaSemana == 4
    cSemanaExt := "Quarta-Feira"

Elseif nDiaSemana == 5
    cSemanaExt := "Quinta-Feira"

Elseif nDiaSemana == 6
    cSemanaExt := "Sexta-Feira"

Elseif nDiaSemana == 7
    cSemanaExt := "Sabado"

Endif

@ 09,12 to 13,66 double

@ 11,14 say "Maringa, " + Transform( nDia, "99" ) + " de " + cMesExtenso + " de " + Transform( nAno, "9999" ) + Space(3) + " ( " + cSemanaExt + " )" 

Inkey(0)