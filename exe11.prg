//Joao Vitor Rodrigues Thomaz


Clear

//Variaveis
cNomeNadador  := Space(10)
nIdadeNadador := 0
cCategoria    := ""

@ 05,25 say "Nome: "
@ 06,25 say "Idade: "

@ 05,35 get cNomeNadador  picture "@!" valid !Empty(cNomeNadador)
@ 06,35 get nIdadeNadador picture "99" valid !Empty(nIdadeNadador)
read

if nIdadeNadador >= 5 .and. nIdadeNadador <= 7
   cCategoria := "Infantil A"
elseif nIdadeNadador >= 8 .and. nIdadeNadador <= 10
   cCategoria := "Infantil B"
elseif nIdadeNadador >= 11 .and. nIdadeNadador <= 13
	cCategoria := "Juvenil A"
elseif nIdadeNadador >= 14 .and. nIdadeNadador <= 17
	cCategoria := "Juvenil B"
else
	cCategoria := "Senior"
endif

@ 08,20 say "O Nadador esta na Categoria " + cCategoria + "!"

Inkey(0)