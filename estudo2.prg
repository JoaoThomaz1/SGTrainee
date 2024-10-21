set color to W+/B //setando a cor do programa, no caso letra branca (W+) e fundo azul (B)

Clear // limpar o prompt de comando

Setmode(25,80)
set scoreboard off
set date to british
set epoch to 1930
set century on


@ 02,02 to 14,57 double //comando para fazer moldura; //caso queira 1 linha apena, só retirar o double;

@ 03,03 say replicate ("*", 54) //comando para repetir uma string várias vezes;
@ 04,03 say "*                   SUPER SISTEMA                    *"
@ 05,03 say "*************(A P R E S E N T A C A O)****************"
@ 06,03 say "*                                                    *"
@ 07,03 say "*        Sistema desenvolvido pelos alunos do        *"
@ 08,03 say "* Curso de Programacao da SG Sistemas-Proj.SGTrainee *"
@ 09,03 say "*                                                    *"
@ 10,03 say "* Aluno: Joao Vitor Rodrigues Thomaz                 *"
@ 11,03 say "* Linguagem de Programacao: Harbour                  *"
@ 12,03 say "* 16/10/2024                                         *"
@ 13,03 say "******************************************************"

Inkey(0) //comando para que o programa prossiga após pressionado alguma tecla