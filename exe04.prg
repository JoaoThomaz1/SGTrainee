//Joao Vitor Rodrigues Thomaz

set color to W+/BG //setando a cor do programa, no caso letra branca (W+) e fundo azul (B)

Clear // limpar o prompt de comando

Setmode(25,80)      //comando para setar o tamanho da janela do CMD
set scoreboard off  //comando para retira a barra de rolagem da janela
set date to british // comando para setar a data em DD/MM/AAAA
set epoch to 1930   //Comando para que limite o ano, anos de 00 ate 29 serao 2000 e de 30 a 99 serao de 1900 
set century on      //Comando para garantir que seja utilizado 4 dias para o ano e nao somente 2


@ 05,12 to 17,67 double //comando para fazer moldura; //caso queira 1 linha apenas, só retirar o double;

@ 06,13 say replicate ("*", 54) //comando para repetir uma string várias vezes;
@ 07,13 say "*                   SUPER SISTEMA                    *"
@ 08,13 say "*************(A P R E S E N T A C A O)****************"
@ 09,13 say "*" + Space(52) + "*" //space(X) fornece um espaço em branco pra a quantidade descrita entre parenteses
@ 10,13 say "*        Sistema desenvolvido pelos alunos do        *"
@ 11,13 say "* Curso de Programacao da SG Sistemas-Proj.SGTrainee *"
@ 12,13 say "*                                                    *"
@ 13,13 say "* Aluno: Joao Vitor Rodrigues Thomaz                 *"
@ 14,13 say "* Linguagem de Programacao: Harbour                  *"
@ 15,13 say "* 16/10/2024                                         *"
@ 16,13 say "******************************************************"

Inkey(0) //comando para que o programa prossiga após pressionado alguma tecla