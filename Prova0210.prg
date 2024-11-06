//Joao Vitor Rodrigues Thomaz

Set Color to N/W+

Clear

Set Date to British
Set Epoch to 1940

//Dados Vendedor
cNomeVendedor   := Space(30)
dCotacao        := CToD("")
//Dados Cliente
cNomeCliente    := Space(30)
nIdadeCliente   := 0
cSexoCliente    := Space(1)
nAnoPrimeiraCnh := 0
//Dados Veiculo
cMarcaVeiculo   := Space(20)
nAnoFabricacao  := 0
cTipoVeiculo    := Space(1)
nMotorVeiculo   := 0
nValorFipe      := 0
cUsoDestinado   := Space(1)
//Dados Seguradora A
cNomeSeguradoraA := "SEGURADORA NAS MAOS DE DEUS"
nValorBaseSegA   := 0
//Dados Seguradora B
cNomeSeguradoraB := "SEGURADORA RACING MOTORS"
nValorBaseSegB   := 0
//Pictures
cPictureIdade   := "999"
cPictureCaracter:= "@!"
cPictureAno     := "9999"
cPictureMotor   := "9.9"
cPictureValorFip:= "@E 9,999,999.99"
//Validadores
dAtual          := date()
nAnoAtual       := Year (dAtual)
cMesExtenso     := ""
cValidSexoClient:= "MF"
cValidTipVeiculo:= "PEL"
cValidUsoVeiculo:= "PO"
nValidacaoAnoCnh:= 0
//Cores
cCorPadrao      := "N/W+"


//Moldura Dados Vendedor
@ 00,00 to 02,79

//Cabecalho Dados Vendedor
@ 00,03 say " SG - COTACOES DE SEGUROS "
@ 01,01 say "Vendedor: " + Space(42) + "Data da Cotacao: "

//Get Dados Vendedor
@ 01,11 get cNomeVendedor picture cPictureCaracter valid !Empty( cNomeVendedor ) color ( cCorPadrao )
@ 01,70 get dCotacao                               valid dCotacao >= dAtual      color ( cCorPadrao )
read

//Define o Mes
nMesCotacao := Month(dCotacao)

If nMesCotacao     == 1
    cMesExtenso := "Janeiro"
Elseif nMesCotacao == 2
    cMesExtenso := "Fevereiro"
Elseif nMesCotacao == 3
    cMesExtenso := "Marco"
Elseif nMesCotacao == 4
    cMesExtenso := "Abril"
Elseif nMesCotacao == 5
    cMesExtenso := "Maio"
Elseif nMesCotacao == 6
    cMesExtenso := "Junho"
Elseif nMesCotacao == 7
    cMesExtenso := "Julho"
Elseif nMesCotacao == 8
    cMesExtenso := "Agosto"
Elseif nMesCotacao == 9
    cMesExtenso := "Setembro"
Elseif nMesCotacao == 10
    cMesExtenso := "Outubro"
Elseif nMesCotacao == 11
    cMesExtenso := "Novembro"
Elseif nMesCotacao == 12
    cMesExtenso := "Dezembro"
Endif

//Moldura Dados Cliente
@ 04,00 to 08,79

//Cabecalho Dados Cliente
@ 04,31 say " DADOS PESSOAIS "
@ 05,01 say "Nome..............: " + Space(34) + "Idade: "
@ 06,01 say "Sexo..............:    [M]asculino [F]eminino" 
@ 07,01 say "Ano Primeira CNH..: "

//Get Dados Cliente
@ 05,21 get cNomeCliente    picture cPictureCaracter valid !Empty( cNomeCliente )         color ( cCorPadrao ) 
@ 05,63 get nIdadeCliente   picture cPictureIdade    valid nIdadeCliente >= 18            color ( cCorPadrao ) 
@ 06,21 get cSexoCliente    picture cPictureCaracter valid cSexoCliente $cValidSexoClient color ( cCorPadrao ) 
read

nValidacaoAnoCnh := ( nAnoAtual - nIdadeCliente ) + 18

@ 07,21 get nAnoPrimeiraCnh picture cPictureAno valid nAnoPrimeiraCnh >= nValidacaoAnoCnh color ( cCorPadrao ) 
read

//Moldura Dados Veiculo
@ 10,00 to 17,79

//Cabecalho Dados Veiculo
@ 10,30 say " DADOS DO VEICULO "
@ 11,01 say "Marca.............: "
@ 12,01 say "Ano de Fabricacao.: " 
@ 13,01 say "Tipo..............:    [P]asseio [E]sportivo [L]uxo"
@ 14,01 say "Motor.............: "
@ 15,01 say "Valor (Fipe)......: "
@ 16,01 say "Uso...............:    [P]articular pr[O]fissional"

//Get Dados Veiculo
@ 11,21 get cMarcaVeiculo   picture cPictureCaracter valid !Empty( cMarcaVeiculo )                        color ( cCorPadrao ) 
@ 12,21 get nAnoFabricacao  picture cPictureAno      valid nAnoFabricacao <= nAnoAtual + 1                color ( cCorPadrao ) 
@ 13,21 get cTipoVeiculo    picture cPictureCaracter valid cTipoVeiculo $cValidTipVeiculo                 color ( cCorPadrao ) 
@ 14,21 get nMotorVeiculo   picture cPictureMotor    valid nMotorVeiculo > 0.0 .and. nMotorVeiculo < 13.0 color ( cCorPadrao ) 
@ 15,21 get nValorFipe      picture cPictureValorFip valid nValorFipe > 0                                 color ( cCorPadrao ) 
@ 16,21 get cUsoDestinado   picture cPictureCaracter valid cUsoDestinado $cValidUsoVeiculo                color ( cCorPadrao ) 
read

//Validacao do Mes
nMesCotacao       := Month(dCotacao)
nAnosDeFabricacao := nAnoAtual - nAnoFabricacao

//Cotacao do Seguro A
nValorBaseSegA            := nValorFipe * 0.06
nValorBaseSegB            := nValorFipe * 0.07
nNovoValorSeguroA         := nValorBaseSegA
nNovoValorSeguroB         := nValorBaseSegB
nValidacaoPorcentagemAnoA := 0
nValidacaoPorcentagemAnoB := 0

//Validacao porcentagem por idade
if nIdadeCliente < 25 .or. nIdadeCliente > 65
    nNovoValorSeguroA += nValorBaseSegA * 0.1
    if nIdadeCliente < 23 .or. nIdadeCliente > 60
        nNovoValorSeguroB += nValorBaseSegB * 0.15
    elseif nIdadeCliente >= 30 .and. nIdadeCliente <= 50
        nNovoValorSeguroB -= nValorBaseSegB * 0.08     
    endif     
endif

//Validacao porcentagem por Sexo
if cSexoCliente == "M"
    nNovoValorSeguroA += nValorBaseSegA * 0.1
    if cSexoCliente == "M"
    nNovoValorSeguroB -= nValorBaseSegB * 0.06
    else
        nNovoValorSeguroB += nValorBaseSegB * 0.12
    endif
else
    nNovoValorSeguroA -= nValorBaseSegA * 0.05
endif

//Validacao porcentagem por Anos Habilitado
if nAnoPrimeiraCnh > nAnoAtual - 3
    nNovoValorSeguroA += nValorBaseSegA * 0.15
    if nAnoPrimeiraCnh > nAnoAtual - 2
        nNovoValorSeguroB += nValorBaseSegB * 0.20
    else
        nNovoValorSeguroB -= nValorBaseSegB * 0.08
    endif
else
    nNovoValorSeguroA -= nValorBaseSegA * 0.1
endif

//Validacao porcentagem por Tipo de Veiculo
if cTipoVeiculo == "E"
    nNovoValorSeguroA += nValorBaseSegA * 0.1
    nNovoValorSeguroB += nValorBaseSegB * 0.15
elseif cTipoVeiculo == "L" 
    nNovoValorSeguroA += nValorBaseSegA * 0.2
    nNovoValorSeguroB += nValorBaseSegB * 0.18
endif

//Validacao porcentagem por Motor do Veiculo
if nMotorVeiculo >= 2.0
    nNovoValorSeguroA += nValorBaseSegA * 0.15
    if nMotorVeiculo >= 1.5
        nNovoValorSeguroB += nValorBaseSegB * 0.1
    endif
endif

//Validacao porcentagem por Ano da fabricacao
if nAnosDeFabricacao > 0
    nValidacaoPorcentagemAnoA := nValorBaseSegA * ( nAnosDeFabricacao * 0.005 )
    nValidacaoPorcentagemAnoB := nValorBaseSegB * ( nAnosDeFabricacao * 0.008 )
    if nValidacaoPorcentagemAnoA > 0.1
        nNovoValorSeguroA += nValorBaseSegA * 0.1
    endif
    if nValidacaoPorcentagemAnoB > 0.08
        nNovoValorSeguroB += nValorBaseSegB * 0.08
    endif
endif

//Validacao porcentagem por Uso Destinado
if cUsoDestinado == "O"
    nNovoValorSeguroA += nValorBaseSegA * 0.1
    nNovoValorSeguroB += nValorBaseSegB * 0.12  
endif

//Validacao porcentagem pelo Desconto do Mes de Marco/Setembro
if nMesCotacao == 3
    nNovoValorSeguroA += nValorBaseSegA * 0.1
ElseIf nMesCotacao == 9 
    nNovoValorSeguroB += nValorBaseSegB * 0.08 
endif

nNovoValorSeguroMensalA     := nNovoValorSeguroA / 12
nNovoValorSeguroTrimestralA := nNovoValorSeguroA / 4
nNovoValorSeguroMensalB     := nNovoValorSeguroB / 12
nNovoValorSeguroTrimestralB := nNovoValorSeguroA / 4

cCorSeguroA := "W/G"
cCorSeguroB := "W/R"

if nNovoValorSeguroA > nNovoValorSeguroB
    cCorSeguroA := "W/R"
    cCorSeguroB := "W/G"
endif

//Cotacao Seguradora A e B
@ 03,00 clear to 24,79

@ 04,00 to 10,40
@ 04,41 to 10,79

Set Color To ( cCorSeguroA ) 

@ 05,01 clear to 09,39

@ 06,01 to 06,39

//Cabecalho Seguradora A
@ 05,01 say cNomeSeguradoraA                                                            
@ 08,01 say "Trimestral.: " + Transform( nNovoValorSeguroMensalA,     cPictureValorFip) 
@ 07,01 say "Mensal.....: " + Transform( nNovoValorSeguroTrimestralA, cPictureValorFip) 
@ 09,01 say "Anual......: " + Transform( nNovoValorSeguroA,           cPictureValorFip) 

//Cabecalho Seguradora B
Set Color To ( cCorSeguroB )

@ 05,43 clear to 09,78

@ 06,42 to 06,78

@ 05,42 say cNomeSeguradoraB                                                            
@ 07,42 say "Mensal.....: " + Transform( nNovoValorSeguroMensalB,     cPictureValorFip) 
@ 08,42 say "Trimestral.: " + Transform( nNovoValorSeguroTrimestralB, cPictureValorFip) 
@ 09,42 say "Anual......: " + Transform( nNovoValorSeguroB,           cPictureValorFip) 

nMesCotacao := Month( dCotacao ) + 1
if nMesCotacao = 13
    nMesCotacao = 01
endif
cDataCotacao:= "01/" + Transform( ( dCotacao ), "99" ) + "/" + Transform( year( dCotacao ), cPictureAno )
dCotacaoDia := ctod( cDataCotacao )
nDiaFinalMes:= Day( dCotacaoDia - 1 )

@ 12,02 say "Cotacao valida ate " + Transform( nDiaFinalMes, "99" ) + " de " + cMesExtenso + " de " + Transform( nAnoCotacao, cPictureAno ) color ( cCorPadrao )

Inkey(0)