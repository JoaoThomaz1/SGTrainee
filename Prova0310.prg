//Joao Vitor Rodrigues Thomaz

Set Color to N/W

Clear

Set Date to British
Set Epoch to 1940


do while .t.
    //Dados Empresa
    cNomeEmpresa      := " RECEITA FEDERAL - INSS "
    nNumeroEmpregados := 0
    dAtual            := Date()
    //Valores
    nNovoSalario      := 0
    nValorTotalInss   := 0
    nValorAdicional   := 0.6
    nValorReducao     := 0.2
    nTotalInssHomens  := 0
    nTotalInssMulheres:= 0
    //Pictures
    cPictureCaracter  := "@!"
    cPictureSalario   := "@E 99,999.99"
    cPicturePorcent   := "999"
    cPictureNumColabor:= "99999"
    cPictureTotalInss := "@E 9,999,999.99"
    //Cores
    cCorPadrao        := "N/W"
    //Validadores
    nContagemHomens   := 0
    nContagemMulheres := 0
    nMulheresAcima    := 0  //Acima de 85 anos
    nHomensAdmitoAntes:= 0  //Admitidos antes de 2006
    nTotalAposentados := 0
    nAdicionalHomens  := 0
    nReducaoMulheres  := 0
    nContagemLoop     := 0
    
    //Moldura e Divisoes
    @ 00,00 to 24,79
    @ 02,01 to 02,78
    
    //Cabecalho Inicial
    @ 00,25 say cNomeEmpresa
    @ 01,01 say "Numero de Colaboradores a Serem analisados: " + Space(20) + "Data: " + DToC(dAtual)
    
    //Get Cabecalho Inicial    
    @ 01,46 get nNumeroEmpregados picture cPictureNumColabor valid nNumeroEmpregados > 0
    read
    
    //Alert para sair se quiser
    if LastKey() == 27
        nAlertSairPrograma := Alert( "Deseja Sair?", { "Sim", "Nao" }, "R/W" )
        if nAlertSairPrograma = 1
            Exit
        Elseif nAlertSairPrograma = 2
            Loop
        endif
    endif
    
    do while nContagemLoop < nNumeroEmpregados
        //Dados do Colaborador
        cNomeColaborador  := Space(30)
        cOrientacaoSexual := Space(1)
        dNascimento       := CToD("")
        nIdade            := 0
        //Dados Empregaticios
        dAdmissao         := CToD("")
        dDemissao         := CToD("")
        nSalarioBase      := 0
        nAnosTrabalhados  := 0
        //Adicionais
        nAdicionalNoturno := 0
        nAdicionalInsalub := 0
        //Alertes
        nAlertSairPrograma:= 0
        
        @ 04,01 to 04,78
        @ 10,01 to 10,78
        
        //Cabecalho Dados Colaborador
        @ 05,01 say "Colaborador...........: " + Space(37) + "Sexo..: " + Space(3) + "[M][F]"
        @ 06,01 say "Data Nascimento.......: "
        @ 07,01 say "Data Admissao.........: " + Space(15) + "Data Demissao...............: "
        @ 08,01 say "Ultimo Salario........: R$"
        @ 09,01 say "(%)Adicional Noturno..: " + Space(15) + "(%)Adicional Insalubridade..: "
        
        //Get Dados Colaborador( Nome, Datas e Salaraios )
        @ 05,26 get cNomeColaborador  picture cPictureCaracter   valid !Empty( cNomeColaborador )
        @ 05,71 get cOrientacaoSexual picture cPictureCaracter   valid cOrientacaoSexual $"MF"
        @ 06,26 get dNascimento                                  valid !Empty(   dNascimento    )
        @ 07,26 get dAdmissao                                    valid dAdmissao > dNascimento
        @ 07,71 get dDemissao                                    valid dDemissao > dAdmissao
        @ 08,28 get nSalarioBase      picture cPictureSalario    valid nSalarioBase > 0 
        @ 09,26 get nAdicionalNoturno picture cPicturePorcent    valid nAdicionalNoturno >= 0 .and. nAdicionalNoturno <= 100
        @ 09,71 get nAdicionalInsalub picture cPicturePorcent    valid nAdicionalInsalub >= 0 .and. nAdicionalInsalub <= 100
        read
        
        //Alert para sair se quiser
        if LastKey() == 27
            nAlertSairPrograma := Alert( "O que deseja?", { "Cancelar", "Retornar", "Processar" }, "R/W" )
            if nAlertSairPrograma = 1
                Exit
            Elseif nAlertSairPrograma = 2
                Loop
            Elseif nAlertSairPrograma = 3
                Exit
            endif
        endif
        
        //Calculo dos adicionais 
        nNovoSalario := nSalarioBase
        nNovoSalario += nSalarioBase * ( nAdicionalNoturno / 100 )
        nNovoSalario += nSalarioBase * ( nAdicionalInsalub / 100 )
        
        //Calculo de Idade
        nAnoNascimento := Year( dNascimento )
        nAnoAtual      := Year(   dAtual    )
        nIdade := nAnoAtual - nAnoNascimento
        
        //Calculo Anos Trabalhados
        nAnoAdmissao := Year( dAdmissao )
        nAnoDemissao := Year( dDemissao )
        nAnosTrabalhados := nAnoDemissao - nAnoAdmissao
        
        
        //Adicionais e Reducoes
        if ( nAnoAdmissao = 2010 .or. nAnoAdmissao = 2010 ) .and. ( nAnoDemissao = 2015 .or. nAnoDemissao = 2015 ) 
            nNovoSalario += nSalarioBase * nValorAdicional
            if cOrientacaoSexual == "M"
                nAdicionalHomens++
            endif
        endif
        
        if nAnoAdmissao >= 2012 .and. nAnoDemissao <= 2020
            nNovoSalario -= nSalarioBase * nValorReducao
            if cOrientacaoSexual == "F"
                nReducaoMulheres++
            endif
        endif

        //Se apto a aposentadoria
        if cOrientacaoSexual == "M" .and. nIdade >= 59 .and. nAnosTrabalhados >= 27
            nContagemHomens++
            nTotalInssHomens += nNovoSalario
            //Homens admitidos antes de 2006
            if nAnoAdmissao < 2006
                nHomensAdmitoAntes++
            Endif
        Elseif cOrientacaoSexual == "F" .and. nIdade >= 55 .and. nAnosTrabalhados >= 22
            nContagemMulheres++
            nTotalInssMulheres += nNovoSalario
            //Idade acima de 85 anos se for mulher 
            if nIdade > 85
                nMulheresAcima++
            Endif
        else
            Loop
        endif
        
        nContagemLoop++
        nTotalAposentados++
        nValorTotalInss += nNovoSalario 
    enddo
    //Alert para sair se quiser
    if nAlertSairPrograma = 1
        Loop
    endif

    //Calculo de POrcentagem de Homens e Mulheres sobre Total de Aposentados
    nPorcentagemAposentados := nContagemHomens + nContagemMulheres 
    nPorcentagemMulheres    := 100 * ( nContagemMulheres / nPorcentagemAposentados )
    nPorcentagemHomens      := 100 * ( nContagemHomens   / nPorcentagemAposentados )


    //Declaracao das porcentagens e Quantidades sobre os aposentados
    @ 14,01 to 15,78

    @ 16,01 say "Homens Aposentados(%)....: " + Transform( nPorcentagemHomens,   cPicturePorcent ) + Space(10) + "Valor INSS: R$" + Transform( nTotalInssHomens,   cPictureTotalInss )
    @ 17,01 say "Mulheres Aposentadas(%)..: " + Transform( nPorcentagemMulheres, cPicturePorcent ) + Space(10) + "Valor INSS: R$" + Transform( nTotalInssMulheres, cPictureTotalInss )
    @ 18,41 say "Total INSS: R$" + Transform( nValorTotalInss, cPictureTotalInss )
    @ 19,01 say "Mulheres com Idade Superior a 85 Anos: " + Transform( nMulheresAcima,     cPictureNumColabor )
    @ 20,01 say "Homens Admitidos antes do Ano de 2006: " + Transform( nHomensAdmitoAntes, cPictureNumColabor )
    @ 21,01 say "Homens com Adicional no INSS.........: " + Transform( nAdicionalHomens,   cPictureNumColabor )
    @ 22,01 say "Mulheres com Reducao no INSS.........: " + Transform( nReducaoMulheres,   cPictureNumColabor )
enddo

Inkey( 0 )