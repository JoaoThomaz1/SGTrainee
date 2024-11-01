// Joao Vitor Rodrigues Thomaz

Set color to BG/N

Clear

Setmode(25,80)
Set Scoreboard Off
Set date to british
Set epoch to 1930
Set Century on

cNomeEmpresa   := "Academia - Cadastro de Novo Cliente"
aOpcoesArray   := { "Sim", "Nao" }
cMensagemAlert := "Deseja Sair do Programa?"

do while .t.
    cNome 		 := Space(20)
    nIdade		 := 0
    nPeso 		 := 0
    nOpcoesAlert := 0
    cCorPadrao   := "BG/N"

    @ 02,10 to 18,60 double
    
    @ 04,18 Say cNomeEmpresa
    
    //AVANÇADO
        
    @ 10,25 Say "Nome..: "
    @ 11,25 Say "Idade.: "
    @ 12,25 Say "Peso..: "
    
    @ 10,34 get cNome  picture "@!"  valid !Empty(cNome ) Color ( cCorPadrao )                 //para poder capturar coisas digitadas pelo user
    @ 11,34 get nIdade picture "999" valid !Empty(nIdade) Color ( cCorPadrao )  
    @ 12,34 get nPeso  picture "999" valid !Empty(nPeso ) Color ( cCorPadrao )  
    read	//sempre finalizar com read para que armazene o que foi digitado
    
    if LastKey()==27
        nOpcoesAlert = Alert( cMensagemAlert, aOpcoesArray, "N/W" )
        if nOpcoesAlert = 1
            exit
        endif
    endif
enddo


//PADRÃO

/*
cNome 		 := "Joao Vitor Rodrigues Thomaz"
nIdade		 := 24
nPeso 		 := 117

@ 10,20 Say "Nome: "  + cNome
@ 11,20 Say "Idade: " + Str(nIdade)  //STR utilizado para concatenar variavel numerica com texto
@ 12,20 Say "Peso: "  + Str(nPeso)
*/

//MÉDIO

/*						
@ 10,20 Say "Nome: "  + cNome
@ 11,20 Say "Idade: " + alltrim(str(nIdade)) //Alltrim no começo serve para tirar espaços extras que teriam
@ 12,20 Say "Peso: "  + alltrim(str(nPeso))
*/


Inkey(0)