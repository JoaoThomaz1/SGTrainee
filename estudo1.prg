Set Color to W+/N

clear

SetMode(25,80)
Set Scoreboard Off
Set Date to British
Set Epoch to 1930
Set Century on

cNomeEmpresa := "Academia - Cadastro de Novo Cliente"
cNome := Space(20)
nIdade:= 0
nPeso := 0

@ 02,02 to 24,64 double

@ 04,15 Say cNomeEmpresa

@ 10,20 Say "Nome: "
@ 11,20 Say "Idade: "
@ 12,20 Say "Peso: "

@ 10,27 Get cNome   picture "@!"        valid !Empty (cNome)
@ 11,27 Get nIdade  picture "999"       valid !Empty (nIdade)
@ 12,27 Get nPeso   picture "999"       valid !Empty (nPeso)
Read

@ 10,27 clear to 12,50

@ 10,27 Say Alltrim(Transform(cNome,  "@!" ))
@ 11,27 Say Alltrim(Transform(nIdade, "999")) //Transform utilizado para poder concatenar valores a partir da entrada do user
@ 12,27 Say Alltrim(Transform(nPeso,  "999"))


inkey(0)