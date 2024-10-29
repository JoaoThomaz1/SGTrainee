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
dAtual            := Date()
dNascimento       := ctod("")
cCursoEscolhido   := Space(10)
cSerie            := Space(2)
nAnoLetivo        := 0
nValorMensalidade := 0
//Disciplinas
cDisciplina1      := Space(7)
cDisciplina2      := Space(7)
cDisciplina3      := Space(7)
cDisciplina4      := Space(7)
//Notas
nNotaFinal1       := 0
nNotaFinal2       := 0
nNotaFinal3       := 0
nNotaFinal4       := 0
//Faltas
nFaltasDisciplina1:= 0
nFaltasDisciplina2:= 0
nFaltasDisciplina3:= 0
nFaltasDisciplina4:= 0
nColuna1          := 10
nColuna2          := 15
nContagem         := 1
cBolsista         := Space(1)

//Cabecalho
@ 02,02 say cNomeColegio + Space(10) + cEndereco
@ 03,02 say "Nome: "
@ 03,25 say "Nascimento: "
@ 03,52 say "Turma: "
@ 04,02 say "Ano Letivo: "
@ 04,20 say "Curso: "
@ 04,40 say "Mensalidade: "

//Get Cabecalho
@ 03,08 Get cNomeAluno          picture "@!"            valid !Empty ( cNomeAluno )
@ 03,38 Get dNascimento                                 valid dNascimento < dAtual
@ 03,60 Get cSerie              picture "@!"            valid !Empty ( cSerie )
@ 04,15 Get nAnoLetivo          picture "9999"          valid nAnoLetivo > 1950
@ 04,28 Get cCursoEscolhido     picture "@!"            valid !Empty ( cCursoEscolhido )
@ 04,55 Get nValorMensalidade   picture "@E 99,999.99"  valid nValorMensalidade > 0
read

//Bolsista
@ 05,15 say "Bolsista? "
@ 05,28 say "[ I ]Integral  [ P ]Parcial    [ N ]Nao Bolsista"

@ 05,25 get cBolsista picture "@!"valid cBolsista == "I" .or. cBolsista == "P" .or. cBolsista == "N"
read

//Calculo Nova Mensalidade Bolsista
if cBolsista == "I"
    nValorMensalidade :=  nValorMensalidade - ( nValorMensalidade * 0.98 )
elseif cBolsista == "P"
    nValorMensalidade :=  nValorMensalidade - ( nValorMensalidade * 0.50 )
else
    nValorMensalidade :=  nValorMensalidade - ( nValorMensalidade * 0.98 )
endif

@ 04,40 clear to 04,78
@ 04,40 say "Nova Mensalidade: " + AllTrim( Transform( nValorMensalidade, "@E 99,999.99" ) )

//Disciplina
@ 07,02 Get cDisciplina1 picture "@!"  valid !Empty ( cDisciplina1 )
@ 09,02 Get cDisciplina2 picture "@!"  valid !Empty ( cDisciplina2 )
@ 11,02 Get cDisciplina3 picture "@!"  valid !Empty ( cDisciplina3 )
@ 13,02 Get cDisciplina4 picture "@!"  valid !Empty ( cDisciplina4 )
Read

//While Notas e faltas
do while nContagem < 5 
    
    nNota1            := 0
    nNota2            := 0
    nNota3            := 0
    nNota4            := 0
    nFaltas1          := 0
    nFaltas2          := 0
    nFaltas3          := 0
    nFaltas4          := 0

    //Notas e Faltas
    @ 07,nColuna1 Get nNota1       picture "999" valid nNota1    >= 0 .and. nNota1   <= 100 
    @ 07,nColuna2 Get nFaltas1     picture "99"  valid nFaltas1  >= 0 .and. nFaltas1 <= 65
    @ 09,nColuna1 Get nNota2       picture "999" valid nNota2    >= 0 .and. nNota2   <= 100 
    @ 09,nColuna2 Get nFaltas2     picture "99"  valid nFaltas2  >= 0 .and. nFaltas2 <= 65
    @ 11,nColuna1 Get nNota3       picture "999" valid nNota3    >= 0 .and. nNota3   <= 100 
    @ 11,nColuna2 Get nFaltas3     picture "99"  valid nFaltas3  >= 0 .and. nFaltas3 <= 65
    @ 13,nColuna1 Get nNota4       picture "999" valid nNota4    >= 0 .and. nNota4   <= 100 
    @ 13,nColuna2 Get nFaltas4     picture "99"  valid nFaltas4  >= 0 .and. nFaltas4 <= 65
    Read
    
    nNotaFinal1        += nNota1
    nFaltasDisciplina1 += nFaltas1

    nNotaFinal2        += nNota2
    nFaltasDisciplina2 += nFaltas2
    
    nNotaFinal3        += nNota3
    nFaltasDisciplina3 += nFaltas3

    nNotaFinal4        += nNota4
    nFaltasDisciplina4 += nFaltas4

    nColuna1   += 10
    nColuna2   += 10
    nContagem++

enddo

//Calculo de Medias
nNotaFinal1 := nNotaFinal1 / 4
nNotaFinal2 := nNotaFinal2 / 4
nNotaFinal3 := nNotaFinal3 / 4
nNotaFinal4 := nNotaFinal4 / 4

//Situacao Aluno
nDependencias     := 0
cSituacaoMateria1 := "Aprovado!"
cSituacaoMateria2 := "Aprovado!"
cSituacaoMateria3 := "Aprovado!"
cSituacaoMateria4 := "Aprovado!"
cColorMedia1      := "G+/W"
cColorMedia2      := "G+/W"
cColorMedia3      := "G+/W"
cColorMedia4      := "G+/W"

//Validacao de Aprovado/Reprovado
If nNotaFinal1 < 6 .or. nFaltasDisciplina1 > 48
    //Conselho
    if nFaltasDisciplina1 >= 49 .and. nFaltasDisciplina1 <= 56
        cVotoConselho1  := Space(1)
        cVotoConselho2  := Space(1)
        cVotoConselho3  := Space(1)
        
        @ 07,60 say "Concelho"
        @ 08,60 say "Voto 1: "
        @ 09,60 say "Voto 2: "
        @ 10,60 say "Voto 3: "
        
        @ 08,70 get cVotoConselho1 picture "@!" valid cVotoConselho1 $"SN" 
        @ 09,70 get cVotoConselho2 picture "@!" valid cVotoConselho2 $"SN" 
        @ 10,70 get cVotoConselho3 picture "@!" valid cVotoConselho3 $"SN" 
        read

    else
        nDependencias++
        cSituacaoMateria1 := "Reprovado! Com Dependencia na Materia!"
        cColorMedia1 := "R+/W"            
    endif
endif

If nNotaFinal2 < 6 .or. nFaltasDisciplina2 > 48
    //Conselho
    if nFaltasDisciplina2 >= 49 .and. nFaltasDisciplina2 <= 56
        cVotoConselho1  := Space(1)
        cVotoConselho2  := Space(1)
        cVotoConselho3  := Space(1)

        @ 07,60 say "Concelho"
        @ 08,60 say "Voto 1: "
        @ 09,60 say "Voto 2: "
        @ 10,60 say "Voto 3: "
        
        @ 08,70 get cVotoConselho1 picture "@!" valid cVotoConselho1 $"SN" 
        @ 09,70 get cVotoConselho2 picture "@!" valid cVotoConselho2 $"SN" 
        @ 10,70 get cVotoConselho3 picture "@!" valid cVotoConselho3 $"SN" 
        read

    else
        nDependencias++
        cSituacaoMateria2 := "Reprovado! Com Dependencia na Materia!"
        cColorMedia2 := "R+/W"            
    endif
endif

If nNotaFinal3 < 6 .or. nFaltasDisciplina3 > 48
    //Conselho
    if nFaltasDisciplina3 >= 49 .and. nFaltasDisciplina3 <= 56
        cVotoConselho1  := Space(1)
        cVotoConselho2  := Space(1)
        cVotoConselho3  := Space(1)

        @ 07,60 say "Concelho"
        @ 08,60 say "Voto 1: "
        @ 09,60 say "Voto 2: "
        @ 10,60 say "Voto 3: "
        
        @ 08,70 get cVotoConselho1 picture "@!" valid cVotoConselho1 $"SN" 
        @ 09,70 get cVotoConselho2 picture "@!" valid cVotoConselho2 $"SN" 
        @ 10,70 get cVotoConselho3 picture "@!" valid cVotoConselho3 $"SN"
        read 
    else
        nDependencias++
        cSituacaoMateria3 := "Reprovado! Com Dependencia na Materia!"
        cColorMedia3 := "R+/W"            
    endif
endif

If nNotaFinal4 < 6 .or. nFaltasDisciplina4 > 48
    //Conselho
    if nFaltasDisciplina4 >= 49 .and. nFaltasDisciplina4 <= 56
        cVotoConselho1  := Space(1)
        cVotoConselho2  := Space(1)
        cVotoConselho3  := Space(1)

        @ 07,60 say "Concelho"
        @ 08,60 say "Voto 1: "
        @ 09,60 say "Voto 2: "
        @ 10,60 say "Voto 3: "
        
        @ 08,70 get cVotoConselho1 picture "@!" valid cVotoConselho1 $"SN" 
        @ 09,70 get cVotoConselho2 picture "@!" valid cVotoConselho2 $"SN" 
        @ 10,70 get cVotoConselho3 picture "@!" valid cVotoConselho3 $"SN"
        read 

    else
        nDependencias++
        cSituacaoMateria4 := "Reprovado! Com Dependencia na Materia!"
        cColorMedia4 := "R+/W"            
    endif
endif

//Recalculo Mensalidade
nValorMensalidade := nValorMensalidade + ( nValorMensalidade * nDependencias * 0.15 ) 

//Desmostracao das Notas e Aprovacoes
@ 15,02 say "A nova mensalidade e: " + AllTrim( Transform( nValorMensalidade, "@E 99,999.99" ) )

@ 16,02 say cDisciplina1 + " " + cSituacaoMateria1
@ 16,50 say " Media: "
@ 16,60 say AllTrim( Transform( nNotaFinal1, "999" ) ) color( cColorMedia1 )
@ 17,02 say cDisciplina2 + " " + cSituacaoMateria2
@ 17,50 say " Media: "
@ 17,60 say AllTrim( Transform( nNotaFinal2, "999" ) ) color( cColorMedia2 )
@ 18,02 say cDisciplina3 + " " + cSituacaoMateria3
@ 18,50 say " Media: "
@ 18,60 say AllTrim( Transform( nNotaFinal3, "999" ) ) color( cColorMedia3 )
@ 19,02 say cDisciplina4 + " " + cSituacaoMateria4
@ 19,50 say " Media: "
@ 19,60 say AllTrim( Transform( nNotaFinal4, "999" ) ) color( cColorMedia4 )

//Calculo Dependencias
if cBolsista == "I" .and. nDependencias = 0
    @ 22,10 say "Aluno foi Aprovado!"
elseif cBolsista == "P" .and. nDependencias <= 1
    @ 22,10 say "Aluno foi Aprovado!"
elseif cBolsista == "N" .and. nDependencias <= 2
    @ 22,10 say "Aluno foi Aprovado!"
else
    @ 22,10 say "Aluno nao foi aprovado de ano, reprovou por excesso de Dependecias!"
endif

Inkey(0)