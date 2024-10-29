//João Vitor Rodrigues Thomaz
Set color to N+/W

Clear

Setmode(25,80)

Set ScoreBoard Off
Set Date to British
Set Epoch to 1940


//Variaveis
cNomeColegio      := "Colegio Santa Cruz"
cEndereco         := "Praca Sete de Setembro, 126"
cNomeAluno        := Space(15)
dNascimento       := ctod("")
cCursoEscolhido   := Space(10)
cSerie            := Space(2)
nAnoLetivo        := 0
nValorMensalidade := 0

//Variavel Notas
nNotaFinal1       := 0
nNotaFinal2       := 0
nNotaFinal3       := 0
nNotaFinal4       := 0
cDisciplina1      := Space(5)
cDisciplina2      := Space(5)
cDisciplina3      := Space(5)
cDisciplina4      := Space(5)
nFaltasDisciplina1:= 0
nFaltasDisciplina2:= 0
nFaltasDisciplina3:= 0
nFaltasDisciplina4:= 0
//Variavel Notas
nNotaA1            := 0
nNotaA2            := 0
nNotaA3            := 0
nNotaA4            := 0
nNotaB1            := 0
nNotaB2            := 0
nNotaB3            := 0
nNotaB4            := 0
nNotaC1            := 0
nNotaC2            := 0
nNotaC3            := 0
nNotaC4            := 0
nNotaD1            := 0
nNotaD2            := 0
nNotaD3            := 0
nNotaD4            := 0
//Variavel Faltas
nFaltasA1          := 0
nFaltasA2          := 0
nFaltasA3          := 0
nFaltasA4          := 0
nFaltasB1          := 0
nFaltasB2          := 0
nFaltasB3          := 0
nFaltasB4          := 0
nFaltasC1          := 0
nFaltasC2          := 0
nFaltasC3          := 0
nFaltasC4          := 0
nFaltasD1          := 0
nFaltasD2          := 0
nFaltasD3          := 0
nFaltasD4          := 0


//Corpo do Programa
@ 02,02 say cNomeColegio + Space(10) + cEndereco
@ 03,02 say "Nome: "
@ 03,25 say "Nascimento: "
@ 03,52 say "Serie: "
@ 04,02 say "Ano Letivo: "
@ 04,20 say "Curso: "
@ 04,40 say "Mensalidade: "

//Cabecalho
@ 03,08 Get cNomeAluno          picture "@!"            valid !Empty ( cNomeAluno )
@ 03,38 Get dNascimento
@ 03,60 Get cSerie              picture "@!"            valid !Empty ( cSerie )
@ 04,15 Get nAnoLetivo          picture "9999"          valid !Empty ( nAnoLetivo )
@ 04,28 Get cCursoEscolhido     picture "@!"            valid !Empty ( cCursoEscolhido )
@ 04,55 Get nValorMensalidade   picture "@E 999,999.99"
//Disciplinas
@ 06,02 Get cDisciplina1 picture "@!"  valid !Empty ( cDisciplina1 )
@ 08,02 Get cDisciplina2 picture "@!"  valid !Empty ( cDisciplina2 )
@ 10,02 Get cDisciplina3 picture "@!"  valid !Empty ( cDisciplina3 )
@ 12,02 Get cDisciplina4 picture "@!"  valid !Empty ( cDisciplina4 )
Read
    
//Notas e Faltas Bimestre 1
@ 06,10 Get nNotaA1       picture "999" valid !Empty ( nNotaA1 ) .and. nNotaA1   <= 100 
@ 06,15 Get nFaltasA1     picture "999" valid nFaltasA1 >= 0     .and. nFaltasA1 <= 65
@ 08,10 Get nNotaB1       picture "999" valid !Empty ( nNotaB1 ) .and. nNotaB1   <= 100  
@ 08,15 Get nFaltasB1     picture "999" valid nFaltasB1 >= 0     .and. nFaltasB1 <= 65  
@ 10,10 Get nNotaC1       picture "999" valid !Empty ( nNotaC1 ) .and. nNotaC1   <= 100
@ 10,15 Get nFaltasC1     picture "999" valid nFaltasC1 >= 0     .and. nFaltasC1 <= 65
@ 12,10 Get nNotaD1       picture "999" valid !Empty ( nNotaD1 ) .and. nNotaD1   <= 100
@ 12,15 Get nFaltasD1     picture "999" valid nFaltasD1 >= 0     .and. nFaltasD1 <= 65
//Notas e Faltas Bimestre 2
@ 06,20 Get nNotaA2       picture "999" valid !Empty ( nNotaA2 ) .and. nNotaA2   <= 100
@ 06,25 Get nFaltasA2     picture "999" valid nFaltasA2 >= 0     .and. nFaltasA2 <= 65
@ 08,20 Get nNotaB2       picture "999" valid !Empty ( nNotaB2 ) .and. nNotaB2   <= 100  
@ 08,25 Get nFaltasB2     picture "999" valid nFaltasB2 >= 0     .and. nFaltasB2 <= 65  
@ 10,20 Get nNotaC2       picture "999" valid !Empty ( nNotaC2 ) .and. nNotaC2   <= 100
@ 10,25 Get nFaltasC2     picture "999" valid nFaltasC2 >= 0     .and. nFaltasC2 <= 65
@ 12,20 Get nNotaD2       picture "999" valid !Empty ( nNotaD2 ) .and. nNotaD2   <= 100
@ 12,25 Get nFaltasD2     picture "999" valid nFaltasD2 >= 0     .and. nFaltasD2 <= 65
//Notas e Faltas Bimestre 3
@ 06,30 Get nNotaA3       picture "999" valid !Empty ( nNotaA3 ) .and. nNotaA3   <= 100
@ 06,35 Get nFaltasA3     picture "999" valid nFaltasA3 >= 0     .and. nFaltasA3 <= 65
@ 08,30 Get nNotaB3       picture "999" valid !Empty ( nNotaB3 ) .and. nNotaB3   <= 100  
@ 08,35 Get nFaltasB3     picture "999" valid nFaltasB3 >= 0     .and. nFaltasB3 <= 65  
@ 10,30 Get nNotaC3       picture "999" valid !Empty ( nNotaC3 ) .and. nNotaC3   <= 100
@ 10,35 Get nFaltasC3     picture "999" valid nFaltasC3 >= 0     .and. nFaltasC3 <= 65
@ 12,30 Get nNotaD3       picture "999" valid !Empty ( nNotaD3 ) .and. nNotaD3   <= 100
@ 12,35 Get nFaltasD3     picture "999" valid nFaltasD3 >= 0     .and. nFaltasD3 <= 65
//Notas e Faltas Bimestre 4
@ 06,40 Get nNotaA4       picture "999" valid !Empty ( nNotaA4 ) .and. nNotaA4   <= 100
@ 06,45 Get nFaltasA4     picture "999" valid nFaltasA4 >= 0     .and. nFaltasA4 <= 65
@ 08,40 Get nNotaB4       picture "999" valid !Empty ( nNotaB4 ) .and. nNotaB4   <= 100  
@ 08,45 Get nFaltasB4     picture "999" valid nFaltasB4 >= 0     .and. nFaltasB4 <= 65  
@ 10,40 Get nNotaC4       picture "999" valid !Empty ( nNotaC4 ) .and. nNotaC4   <= 100
@ 10,45 Get nFaltasC4     picture "999" valid nFaltasC4 >= 0     .and. nFaltasC4 <= 65
@ 12,40 Get nNotaD4       picture "999" valid !Empty ( nNotaD4 ) .and. nNotaD4   <= 100
@ 12,45 Get nFaltasD4     picture "999" valid nFaltasD4 >= 0     .and. nFaltasD4 <= 65
Read

//Calculo Media
nNotaFinal1        := ( nNotaA1 + nNotaA2 + nNotaA3 + nNotaA4 ) / 4
nFaltasDisciplina1 := nFaltasA1 + nFaltasA2 + nFaltasA3 + nFaltasA4

nNotaFinal2        := ( nNotaB1 + nNotaB2 + nNotaB3 + nNotaB4 ) / 4
nFaltasDisciplina2 := nFaltasB1 + nFaltasB2 + nFaltasB3 + nFaltasB4

nNotaFinal3        := ( nNotaC1 + nNotaC2 + nNotaC3 + nNotaC4 ) / 4
nFaltasDisciplina3 := nFaltasC1 + nFaltasC2 + nFaltasC3 + nFaltasC4

nNotaFinal4        := ( nNotaD1 + nNotaD2 + nNotaD3 + nNotaD4 ) / 4
nFaltasDisciplina4 := nFaltasD1 + nFaltasD2 + nFaltasD3 + nFaltasD4

cSituacaoMateria1 := ""
cSituacaoMateria2 := ""
cSituacaoMateria3 := ""
cSituacaoMateria4 := ""
nDependencias     := 0

//Dependencias
If nNotaFinal1 < 6 .or. nFaltasDisciplina1 > 48
    nDependencias++
    cSituacaoMateria1 := "Reprovado! Com Dependencia na Materia"
else
    cSituacaoMateria1 := "Aprovado!"
endif

If nNotaFinal2 < 6 .or. nFaltasDisciplina2 > 48
    nDependencias++
    cSituacaoMateria2 := "Reprovado! Com Dependencia na Materia"
else
    cSituacaoMateria2 := "Aprovado!"
endif

If nNotaFinal3 < 6 .or. nFaltasDisciplina3 > 48
    nDependencias++
    cSituacaoMateria3 := "Reprovado! Com Dependencia na Materia"
else
    cSituacaoMateria3 := "Aprovado!"
endif

If nNotaFinal4 < 6 .or. nFaltasDisciplina4 > 48
    nDependencias++
    cSituacaoMateria4 := "Reprovado! Com Dependencia na Materia"
else
    cSituacaoMateria4 := "Aprovado!"
endif

nValorMensalidade := nValorMensalidade + ( nValorMensalidade * nDependencias * 0.15 ) 

//Resolucao do Aluno
@ 15,02 say "A nova mensalidade e: " + AllTrim( Transform( nValorMensalidade, "@E 999,999.99" ) )

@ 16,02 say cDisciplina1 + Space(1) + cSituacaoMateria1
@ 17,02 say cDisciplina2 + Space(1) + cSituacaoMateria2
@ 18,02 say cDisciplina3 + Space(1) + cSituacaoMateria3 
@ 19,02 say cDisciplina4 + Space(1) + cSituacaoMateria4

If nDependencias > 2
    @ 22,10 say "Aluno nao foi aprovado de ano, reprovou por excesso de Dependecias!"
Elseif nDependencias > 0
    @ 22,10 say "Aluno Foi Aprovado! Com " + Alltrim( Str( nDependencias ) ) + " Dependencias!"
Else
    @ 22,10 say "Aluno foi Aprovado!"
endif

Inkey(0)