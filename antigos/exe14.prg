Set color to G+/N

Clear

Do while .t.

   cCodCli := Space(6)

   @ 10,08 to 14,49 double

   @ 12,10 say "Informe o Codigo do cliente:"

   @ 12,40 get cCodCli pict "999999"
   Read

   If lastkey() == 27

      Loop

   Endif

   Exit

Enddo

Inkey (0)

