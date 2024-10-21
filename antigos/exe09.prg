Clear

Set epoch to 1930
Set date British

cLetra   := Space(1)
dData    := ctod("")
nInteiro := 0
nDecimal := 0
cString  := Space(9)

@ 02,02  to 11,30

@ 03,10 say "Formulario"
@ 05,03 say "Sexo: "
@ 06,03 say "Data de nascimento: "
@ 07,03 say "Idade: "
@ 08,03 say "Altura: "
@ 09,03 say "Primeiro nome: "

@ 05,10 get cLetra   picture "@!"      valid !Empty(cLetra) .and. cLetra $'MF'
@ 06,22 get dData                      valid !Empty(dData)
@ 07,09 get nInteiro picture "999"     valid !Empty(nInteiro)
@ 08,10 get nDecimal picture "@E 9.99" valid nDecimal > 0
@ 09,17 get cString  picture "@!"      valid !Empty(cString)
Read

Inkey(2)
Clear

@ 10,22 say "AGUARDE ENQUANTO REALIZAMOS A LEITURA...."

Inkey(2)
Clear

@ 02,02  to 11,30

@ 03,10 say "FORMULARIO"
@ 05,03 say "* Letra Digitada: " + Alltrim(cLetra)
@ 06,03 say "* Data Digitada: " + dToc(dData)
@ 07,03 say "* Idade Digitada: " + Alltrim(Transform(nInteiro, '999'))
@ 08,03 say "* Altura Digitada: " + Alltrim(Transform(nDecimal, '@E 9.99'))
@ 09,03 say "* Nome Digitado: " + Alltrim(cString)

Inkey(0)

