//Joao Vitor Rodrigues Thomaz

set color to N/BG //setando a cor do programa, no caso letra branca (W+) e fundo azul (B)

Clear // limpar o prompt de comando

Setmode(25,80)      //comando para setar o tamanho da janela do CMD
set scoreboard off  //comando para retira a barra de rolagem da janela
set date to british // comando para setar a data em DD/MM/AAAA
set epoch to 1930   //Comando para que limite o ano, anos de 00 ate 29 serao 2000 e de 30 a 99 serao de 1900 
set century on      //Comando para garantir que seja utilizado 4 dias para o ano e nao somente 2

@ 10,30 to 12,47 double //comando para fazer moldura; //caso queira 1 linha apenas, só retirar o double;

@ 11,33 say "Hello World!"

inkey(0)