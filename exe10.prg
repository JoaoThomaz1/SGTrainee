//Joao Vitor Rodrigues Thomaz


Clear

nIdadeUsuario := 0

@ 05,25 say "Idade: "

@ 05,37 get nIdadeUsuario picture "999" valid!Empty(nIdadeUsuario)
read

if nIdadeUsuario > 21
    @ 08,20 say "O usuario tem mais de 21 Anos!"
elseif nIdadeUsuario == 21
    @ 08,20 say "O usuario tem exatamente 21 Anos!"
else
    @ 08,20 say "O usuario tem menos de 21 Anos!"
endif


Inkey(0)