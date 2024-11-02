//Joao Vitor Rodrigues Thomaz

Set Color to N/W

Set Date to British
Set Epoch to 1940

do while .t.
    //Dados Usuario
    cNomeUsuario := Space(30)
    dNascimento  := CToD("")
    //Pictures
    cPictureCaracter := "@!"
    //Datas
    dAtual      := Date()
    nMes        := Month( dNascimento )
    nAno        := Year ( dNascimento )
    nDia        := Day  ( dNascimento )
    nDiaSemana  := DoW  ( dNascimento )
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
    
    do while .t.
        do while .t.        
        enddo    
    enddo
    
enddo

Inkey( 0 )