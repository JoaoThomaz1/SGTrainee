// Joao Vitor Rodrigues Thomaz

Set color to N/BG

Clear

Setmode(25,80)
Set Scoreboard Off
Set date to british
Set epoch to 1930
Set Century on

cNomeEmpresa := "Academia - Cadastro de Novo Cliente"
cNome 		 := Space(15)
nIdade		 := 0
nPeso 		 := 0

@ 02,10 to 18,60 double

@ 04,18 Say cNomeEmpresa

//AVANÇADO
	
@ 10,25 Say "Nome: "
@ 11,25 Say "Idade: "
@ 12,25 Say "Peso: "

@ 10,32 get cNome  picture "@!"  valid !Empty(cNome ) Color ("N/BG")                 //para poder capturar coisas digitadas pelo user
@ 11,31 get nIdade picture "999" valid !Empty(nIdade) Color ("N/BG")  
@ 12,32 get nPeso  picture "999" valid !Empty(nPeso ) Color ("N/BG")  
read	//sempre finalizar com read para que armazene o que foi digitado


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