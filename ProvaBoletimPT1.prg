Set color to N+/W

Clear

Setmode(25,80)

Set ScoreBoard Off
Set Date to British
Set Epoch to 1930
Set Century On

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
nNota1            := 0
nNota2            := 0
nNota3            := 0
nNota4            := 0
nFaltas1          := 0
nFaltas2          := 0
nFaltas3          := 0
nFaltas4          := 0

//Corpo do Programa
@ 02,02 say cNomeColegio + Space(10) + cEndereco
@ 03,02 say "Nome: "
@ 03,25 say "Nascimento: "
@ 03,52 say "Serie: "
@ 04,02 say "Ano Letivo: "
@ 04,20 say "Curso: "
@ 04,40 say "Mensalidade: "

@ 03,08 Get cNomeAluno          picture "@!"            valid !Empty ( cNomeAluno )
@ 03,38 Get dNascimento
@ 03,60 Get cSerie              picture "@!"            valid !Empty ( cSerie )
@ 04,15 Get nAnoLetivo          picture "9999"          valid !Empty ( nAnoLetivo )
@ 04,28 Get cCursoEscolhido     picture "@!"            valid !Empty ( cCursoEscolhido )
@ 04,55 Get nValorMensalidade   picture "@E 999,999.99"
read

@ 06,02 Get cDisciplina1 picture "@!"  valid !Empty ( cDisciplina1 )
@ 08,02 Get cDisciplina2 picture "@!"  valid !Empty ( cDisciplina2 ) wqddqwdq
@ 10,02 Get cDisciplina3 picture "@!"  valid !Empty ( cDisciplina3 )
@ 12,02 Get cDisciplina4 picture "@!"  valid !Empty ( cDisciplina4 )
Read
    
//Notas e Faltas Materia 1
@ 06,10 Get nNota1       picture "999" valid !Empty ( nNota1 )
@ 06,15 Get nFaltas1     picture "999" valid !Empty ( nFaltas1 )
@ 08,20 Get nNota2       picture "999" valid !Empty ( nNota2 )  
@ 08,25 Get nFaltas2     picture "999" valid !Empty ( nFaltas2 )  
@ 10,30 Get nNota3       picture "999" valid !Empty ( nNota3 )
@ 10,35 Get nFaltas3     picture "999" valid !Empty ( nFaltas3 )
@ 12,40 Get nNota4       picture "999" valid !Empty ( nNota4 )
@ 12,45 Get nFaltas4     picture "999" valid !Empty ( nFaltas4 )
//Notas e Faltas Materia 2
@ 06,10 Get nNota1       picture "999" valid !Empty ( nNota1 )
@ 06,15 Get nFaltas1     picture "999" valid !Empty ( nFaltas1 )
@ 08,20 Get nNota2       picture "999" valid !Empty ( nNota2 )  
@ 08,25 Get nFaltas2     picture "999" valid !Empty ( nFaltas2 )  
@ 10,30 Get nNota3       picture "999" valid !Empty ( nNota3 )
@ 10,35 Get nFaltas3     picture "999" valid !Empty ( nFaltas3 )
@ 12,40 Get nNota4       picture "999" valid !Empty ( nNota4 )
@ 12,45 Get nFaltas4     picture "999" valid !Empty ( nFaltas4 )
//Notas e Faltas Materia 3
@ 06,10 Get nNota1       picture "999" valid !Empty ( nNota1 )
@ 06,15 Get nFaltas1     picture "999" valid !Empty ( nFaltas1 )
@ 08,20 Get nNota2       picture "999" valid !Empty ( nNota2 )  
@ 08,25 Get nFaltas2     picture "999" valid !Empty ( nFaltas2 )  
@ 10,30 Get nNota3       picture "999" valid !Empty ( nNota3 )
@ 10,35 Get nFaltas3     picture "999" valid !Empty ( nFaltas3 )
@ 12,40 Get nNota4       picture "999" valid !Empty ( nNota4 )
@ 12,45 Get nFaltas4     picture "999" valid !Empty ( nFaltas4 )
//Notas e Faltas Materia 4
@ 06,10 Get nNota1       picture "999" valid !Empty ( nNota1 )
@ 06,15 Get nFaltas1     picture "999" valid !Empty ( nFaltas1 )
@ 08,20 Get nNota2       picture "999" valid !Empty ( nNota2 )  
@ 08,25 Get nFaltas2     picture "999" valid !Empty ( nFaltas2 )  
@ 10,30 Get nNota3       picture "999" valid !Empty ( nNota3 )
@ 10,35 Get nFaltas3     picture "999" valid !Empty ( nFaltas3 )
@ 12,40 Get nNota4       picture "999" valid !Empty ( nNota4 )
@ 12,45 Get nFaltas4     picture "999" valid !Empty ( nFaltas4 )
Read

nNotaFinal1        += nNota1
nFaltasDisciplina1 += nFaltas1

nNotaFinal2        += nNota2
nFaltasDisciplina2 += nFaltas2

nNotaFinal3        += nNota3
nFaltasDisciplina3 += nFaltas3

nNotaFinal4        += nNota4
nFaltasDisciplina4 += nFaltas4

cSituacaoMateria1 := ""
cSituacaoMateria2 := ""
cSituacaoMateria3 := ""
cSituacaoMateria4 := ""
nDependencias     := 0

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



@ 15,02 say "A nova mensalidade e: " + AllTrim( Str( nValorMensalidade ) )

@ 16,02 say cDisciplina1 + " " + cSituacaoMateria1
@ 17,02 say cDisciplina2 + " " + cSituacaoMateria2
@ 18,02 say cDisciplina3 + " " + cSituacaoMateria3 
@ 19,02 say cDisciplina4 + " " + cSituacaoMateria4

If nDependencias > 2
    @ 22,10 say "Aluno nao foi aprovado de ano, reprovou por excesso de Dependecias!"
Elseif nDependencias > 0
    @ 22,10 say "Aluno Foi Aprovado! Com " + Alltrim( Str( nDependencias ) ) + " Dependencias!"
Else
    @ 22,10 say "Aluno foi Aprovado!"
endif

Inkey(0)