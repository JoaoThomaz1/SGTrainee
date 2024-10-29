//Joao Vitor Rodrigues Thomaz

Set Color to N+/W

Clear

Set Date to British
Set epoch to 1940

//Variaveis de Dados, Instituicao e Aluno
cNomeFaculdade      := "FACULDADE SG SISTEMAS"
cEnderecoFaculdade  := "RUA SAO JOAO, 1759, MARINGA - PR"
cNomeAluno          := Space(15)
cCursoEscolhido     := Space(10)
dNascimento         := CToD("")
nSerieAtual         := 0
cSexoGenero         := Space(1)
nMensalidade        := 0
nNovaMensalidade    := 0

//Dados das Materias, Nomes, Notas e Faltas
cNomeMateria1       := Space(8)
cNomeMateria2       := Space(8)
cNomeMateria3       := Space(8)
nNota1Materia       := 0
nNota2Materia       := 0
nNota3Materia       := 0
nNota4Materia       := 0
nFalta1Materia      := 0
nFalta2Materia      := 0
nFalta3Materia      := 0
nFalta4Materia      := 0
nMediaMateria1      := 0
nMediaMateria2      := 0
nMediaMateria3      := 0
nFaltaTotalMateria1 := 0
nFaltaTotalMateria2 := 0
nFaltaTotalMateria3 := 0
nDependencias       := 0

//Variaveis para Linha e Colunas, possibilitando uma rapida edicao/manutencao
nLinhaMateria1      := 09
nColunaMateria1     := 02
nLinhaDadosAluno    := 04
nLinhaDadosCurso    := 05

//Variavel para os pictures e comparativos
cPictureCaracter    := "@!"
cPictureNotaFalta   := "999"
cPictureMensalidade := "@E 9,999.99"
nMaximoSerie        := 8
nMinimoSerie        := 1
nMaximoNota         := 100
nMinimoNotaFalta    := 0
nMaximoFalta        := 65
nMaximoDependencias := 2
cSituacaoAluno      := "REPROVADO!"
nMediaMinima        := 70
nFaltaMaxima        := 8
cDependeciaMateria1 := "N"
cDependeciaMateria2 := "N"
cDependeciaMateria3 := "N"
lReprovadoFalta     := .f.

//Variavel para coloracao, letras e espacos
cColorPadrao        := "N+/W"
cCorReprovado       := "R/W"
cCorMedia           := "G/W"

//Datas
dAtual              := date()
nMes                := Month(dAtual)
nAno                := Year (dAtual)
nDia                := Day  (dAtual)
nDiaSemana          := DoW  (dAtual)
cMesExtenso         := ""
cSemanaExt          := ""

//Define o Mes
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

//Define o dia da Semana
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

@ 00,09 say "Maringa, " + Transform( nDia, "99" ) + " de " + cMesExtenso + " de " + Transform( nAno, "9999" ) + Space(3) + " ( " + cSemanaExt + " )"

//Molduras e Divisoes dos dados
@ 01,00 to 24,79 double
@ 03,01 to 03,78
@ 06,01 to 06,78
@ 08,01 to 08,78
@ 12,01 to 12,78
@ 09,13 to 11,13
@ 09,21 to 11,21
@ 09,29 to 11,29
@ 09,37 to 11,37
@ 09,45 to 11,45
@ 09,62 to 11,62
@ 09,70 to 11,70

//Cabecalho do boletim
@ 02,04 say cNomeFaculdade + Space(5) + cEnderecoFaculdade + Space(8) + DToC( dAtual )
@ nLinhaDadosAluno,02 say "ALUNO: " + Space(15) + "SEXO: " + Space(20) + "DATA DE NASCIMENTO: "
@ 05,02 say "CURSO: " + Space(25) + "SERIE: " + Space(16) + "MENSALIDADE: "
@ 06,14 say " BIM 1" + Space(3) + "BIM 2" + Space(3) + "BIM 3" + Space(3) + "BIM 4"
@ 07,01 say " DISCIPLINA | N | F | N | F | N | F | N | F |" + Space(16) + "| MEDIA |" + " FALTAS "

//Get do Cabecalho 
@ nLinhaDadosAluno,09 get cNomeAluno        picture cPictureCaracter    valid !Empty( cNomeAluno )
@ nLinhaDadosAluno,30 get cSexoGenero       picture cPictureCaracter    valid cSexoGenero = "M" .or. cSexoGenero = "F"
@ nLinhaDadosAluno,70 get dNascimento                                   valid !Empty( dNascimento ) .and. dNascimento < dAtual
@ nLinhaDadosCurso,09 get cCursoEscolhido   picture cPictureCaracter    valid !Empty( cCursoEscolhido )
@ nLinhaDadosCurso,43 get nSerieAtual       picture "9"                 valid nSerieAtual >= nMinimoSerie .and. nSerieAtual <= nMaximoSerie
@ nLinhaDadosCurso,70 get nMensalidade      picture cPictureMensalidade valid !Empty( nMensalidade ) .and. nMensalidade >= 0
read

//If para verificar Media minima e o MAximo de faltas permitida
if nSerieAtual <= 4
    nMediaMinima := 60
    if nSerieAtual < 4
        nFaltaMaxima := 6
    endif 
endif

//Get Materia 1, notas e Faltas
@ nLinhaMateria1,nColunaMateria1 get cNomeMateria1  picture cPictureCaracter  valid !Empty( cNomeMateria1 )                                                 color ( cColorPadrao )
@ nLinhaMateria1,14              get nNota1Materia  picture cPictureNotaFalta valid nNota1Materia  >= nMinimoNotaFalta .and. nNota1Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,18              get nFalta1Materia picture cPictureNotaFalta valid nFalta1Materia >= nMinimoNotaFalta .and. nFalta1Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,22              get nNota2Materia  picture cPictureNotaFalta valid nNota2Materia  >= nMinimoNotaFalta .and. nNota2Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,26              get nFalta2Materia picture cPictureNotaFalta valid nFalta2Materia >= nMinimoNotaFalta .and. nFalta2Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,30              get nNota3Materia  picture cPictureNotaFalta valid nNota3Materia  >= nMinimoNotaFalta .and. nNota3Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,34              get nFalta3Materia picture cPictureNotaFalta valid nFalta3Materia >= nMinimoNotaFalta .and. nFalta3Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,38              get nNota4Materia  picture cPictureNotaFalta valid nNota4Materia  >= nMinimoNotaFalta .and. nNota4Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,42              get nFalta4Materia picture cPictureNotaFalta valid nFalta4Materia >= nMinimoNotaFalta .and. nFalta4Materia <= nMaximoFalta color ( cColorPadrao )
read

if nFalta1Materia > nFaltaMaxima .or. nFalta2Materia > nFaltaMaxima .or. nFalta3Materia > nFaltaMaxima .or. nFalta4Materia > nFaltaMaxima
    lReprovadoFalta := .t.
endif


//Media Materia1
nMediaMateria1      := ( nNota1Materia + nNota2Materia + nNota3Materia + nNota4Materia ) / 4
nFaltaTotalMateria1 := nFalta1Materia + nFalta2Materia + nFalta3Materia + nFalta4Materia

//if para definir a cor da media e Dependencia
if nMediaMateria1 < nMediaMinima .or. lReprovadoFalta
    nDependencias++
    cDependeciaMateria1 := "S"
    if nMediaMateria1 < nMediaMinima
        cCorMedia := cCorReprovado 
    endif
endif

//Declaracao da media
@ nLinhaMateria1,64 say Alltrim( Transform( nMediaMateria1, cPictureNotaFalta ) ) color ( cCorMedia )
@ nLinhaMateria1,72 say Alltrim( Transform( nFaltaTotalMateria1, cPictureNotaFalta ) )

//Para limpar as variaveis
nNota1Materia       := 0
nNota2Materia       := 0
nNota3Materia       := 0
nNota4Materia       := 0
nFalta1Materia      := 0
nFalta2Materia      := 0
nFalta3Materia      := 0
nFalta4Materia      := 0
lReprovadoFalta     := .f.
cCorMedia           := "G/W"
nLinhaMateria1++

//Get Materia 2, notas e Faltas
@ nLinhaMateria1,nColunaMateria1 get cNomeMateria2  picture cPictureCaracter  valid !Empty( cNomeMateria2 )                                                 color ( cColorPadrao )
@ nLinhaMateria1,14              get nNota1Materia  picture cPictureNotaFalta valid nNota1Materia  >= nMinimoNotaFalta .and. nNota1Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,18              get nFalta1Materia picture cPictureNotaFalta valid nFalta1Materia >= nMinimoNotaFalta .and. nFalta1Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,22              get nNota2Materia  picture cPictureNotaFalta valid nNota2Materia  >= nMinimoNotaFalta .and. nNota2Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,26              get nFalta2Materia picture cPictureNotaFalta valid nFalta2Materia >= nMinimoNotaFalta .and. nFalta2Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,30              get nNota3Materia  picture cPictureNotaFalta valid nNota3Materia  >= nMinimoNotaFalta .and. nNota3Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,34              get nFalta3Materia picture cPictureNotaFalta valid nFalta3Materia >= nMinimoNotaFalta .and. nFalta3Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,38              get nNota4Materia  picture cPictureNotaFalta valid nNota4Materia  >= nMinimoNotaFalta .and. nNota4Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,42              get nFalta4Materia picture cPictureNotaFalta valid nFalta4Materia >= nMinimoNotaFalta .and. nFalta4Materia <= nMaximoFalta color ( cColorPadrao )
read

if nFalta1Materia > nFaltaMaxima .or. nFalta2Materia > nFaltaMaxima .or. nFalta3Materia > nFaltaMaxima .or. nFalta4Materia > nFaltaMaxima
    lReprovadoFalta := .t.
endif

//Media Materia 2
nMediaMateria2      := ( nNota1Materia + nNota2Materia + nNota3Materia + nNota4Materia ) / 4
nFaltaTotalMateria2 := nFalta1Materia + nFalta2Materia + nFalta3Materia + nFalta4Materia

//if para definir a cor da media e Dependencia
if nMediaMateria2 < nMediaMinima .or. lReprovadoFalta
    nDependencias++
    cDependeciaMateria2 := "S"
    if nMediaMateria2 < nMediaMinima
        cCorMedia := cCorReprovado 
    endif
endif

//Declaracao da media
@ nLinhaMateria1,64 say Alltrim( Transform( nMediaMateria2, cPictureNotaFalta ) ) color ( cCorMedia )
@ nLinhaMateria1,72 say Alltrim( Transform( nFaltaTotalMateria2, cPictureNotaFalta ) )

//Para limpar as variaveis
nNota1Materia       := 0
nNota2Materia       := 0
nNota3Materia       := 0
nNota4Materia       := 0
nFalta1Materia      := 0
nFalta2Materia      := 0
nFalta3Materia      := 0
nFalta4Materia      := 0
lReprovadoFalta     := .f.
cCorMedia           := "G/W"
nLinhaMateria1++

//Get Materia 3, notas e Faltas
@ nLinhaMateria1,nColunaMateria1 get cNomeMateria3  picture cPictureCaracter  valid !Empty( cNomeMateria3 )                                                 color ( cColorPadrao )
@ nLinhaMateria1,14              get nNota1Materia  picture cPictureNotaFalta valid nNota1Materia  >= nMinimoNotaFalta .and. nNota1Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,18              get nFalta1Materia picture cPictureNotaFalta valid nFalta1Materia >= nMinimoNotaFalta .and. nFalta1Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,22              get nNota2Materia  picture cPictureNotaFalta valid nNota2Materia  >= nMinimoNotaFalta .and. nNota2Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,26              get nFalta2Materia picture cPictureNotaFalta valid nFalta2Materia >= nMinimoNotaFalta .and. nFalta2Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,30              get nNota3Materia  picture cPictureNotaFalta valid nNota3Materia  >= nMinimoNotaFalta .and. nNota3Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,34              get nFalta3Materia picture cPictureNotaFalta valid nFalta3Materia >= nMinimoNotaFalta .and. nFalta3Materia <= nMaximoFalta color ( cColorPadrao )
@ nLinhaMateria1,38              get nNota4Materia  picture cPictureNotaFalta valid nNota4Materia  >= nMinimoNotaFalta .and. nNota4Materia  <= nMaximoNota  color ( cColorPadrao )
@ nLinhaMateria1,42              get nFalta4Materia picture cPictureNotaFalta valid nFalta4Materia >= nMinimoNotaFalta .and. nFalta4Materia <= nMaximoFalta color ( cColorPadrao )
read

if nFalta1Materia > nFaltaMaxima .or. nFalta2Materia > nFaltaMaxima .or. nFalta3Materia > nFaltaMaxima .or. nFalta4Materia > nFaltaMaxima
    lReprovadoFalta := .t.
endif

//Media Materia 3
nMediaMateria3      := ( nNota1Materia + nNota2Materia + nNota3Materia + nNota4Materia ) / 4
nFaltaTotalMateria3 := nFalta1Materia + nFalta2Materia + nFalta3Materia + nFalta4Materia

//if para definir a cor da media e Dependencia
if nMediaMateria3 < nMediaMinima .or. lReprovadoFalta
    nDependencias++
    cDependeciaMateria3 := "S"
    if nMediaMateria3 < nMediaMinima
        cCorMedia := cCorReprovado 
    endif
endif

//Declaracao da media
@ nLinhaMateria1,64 say Alltrim( Transform( nMediaMateria3, cPictureNotaFalta ) ) color ( cCorMedia )
@ nLinhaMateria1,72 say Alltrim( Transform( nFaltaTotalMateria3, cPictureNotaFalta ) )

//Situacao do aluno
If nDependencias <= nMaximoDependencias
    cSituacaoAluno := "APROVADO!"
    cCorMedia := "G/W"
else
    cCorMedia := cCorReprovado
endif

//Calculo da nova Mensalidade
nNovaMensalidade := nMensalidade + ( nMensalidade * ( nDependencias * 0.20 ) )

//Declaracao de situacao do aluno
@ 13,01 to 18,50

@ 14,02 say "SITUACAO ALUNO: "
@ 14,19 say cSituacaoAluno  color ( cCorMedia )
@ 14,30 say " COM " + Alltrim( Str( nDependencias ) ) + " DEPENDENCIAS." color ( cColorPadrao )

//Detalhe das materias
@ 15,14 say cNomeMateria1 + " MEDIA " + Alltrim( Transform( nMediaMateria1, cPictureNotaFalta ) ) + " DEPENDENCIA? " + cDependeciaMateria1 color ( cColorPadrao )
@ 16,14 say cNomeMateria2 + " MEDIA " + Alltrim( Transform( nMediaMateria2, cPictureNotaFalta ) ) + " DEPENDENCIA? " + cDependeciaMateria2 color ( cColorPadrao )
@ 17,14 say cNomeMateria3 + " MEDIA " + Alltrim( Transform( nMediaMateria3, cPictureNotaFalta ) ) + " DEPENDENCIA? " + cDependeciaMateria3 color ( cColorPadrao )

//Declaracao nova mensalidade
@ 20,18 to 22,55 double

@ 21,20 say "NOVO VALOR DA MENSALIDADE: " + Alltrim( Transform( nNovaMensalidade, cPictureMensalidade ) ) color ( cColorPadrao )

Inkey(0)