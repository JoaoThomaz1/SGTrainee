//Joao Vitor Rodrigues Thomaz
Set Color To N/W+

Clear

SetScoreboard Off
Set Date To British
Set Epoch To 1940

nIdadeUsuario := 0
dAtual        := date()
dNascimento   := CToD("")

@ 05,25 say "Data de Nascimento: "

@ 05,37 get dNascimento valid!Empty(dNascimento) .and. dNascimento <= dAtual
read

nIdadeUsuario 

if nIdadeUsuario > 21
    @ 08,20 say "O usuario tem mais de 21 Anos!"
elseif nIdadeUsuario == 21
    @ 08,20 say "O usuario tem exatamente 21 Anos!"
else
    @ 08,20 say "O usuario tem menos de 21 Anos!"
endif


Inkey(0)