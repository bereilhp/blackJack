%Rules
% ; = OR
% , = AND

:- discontiguous manoCartas/2.
use_module(library(random)).


% Comenzar el juego 
iniciarJuego() :-
write("Bienvenido al juego BlackJack para empezar el juego tiene que escribir "),
format("\"ok\"", []),
write(". en caso contrario escriba cualquier cosa"),
nl,
read(S),
correcto(S) -> write("Para seguir jugando ejecute el comando mano1(X,Y,S) y te mostrará tu primera mano");
  write("Ha finalizado el juego").

% Este predicado te devuelve el  valor de cada carta
carta(X,S) :-
  cartas(X,S).

% Cuando el jugador no tiene cartas en la mano te devuelve un 0
manoCartas([],0).

% Genera una carta aleatoria y te muestra el valor
random_Cards(Num) :-
  random(1, 10, N),
  cartas(N, Num).

% Genera una carta aleatoria y te muestra el valor
carta1(Num) :-
  random(1, 10, N),
  cartas(N, Num).

% Genera una carta aleatoria y te muestra el valor
carta2(Num) :-
  random(1, 10, N),
  cartas(N, Num).

% Genera la primera mano. Esta mano consta de dos cartas y te muestra el valor de las mismas y los puntos totales. 
mano1(Num, Nm, S) :-
  carta1(N),
  cartas(N, Num),
  carta2(T),
  cartas(T, Nm),
  Resu is Num + Nm,
  atomics_to_string(["Tiene las siguientes cartas en la mano: ", Num," y ", Nm, " y su total es ", Resu, ". Para pedir otra carta y seguir jugando inserte el comando pedirCarta([Carta1, Carta2])"], S).
 
% Genera la primera mano. Esta mano consta de dos cartas y te muestra el valor de las mismas y los puntos totales. 
mano2(Num, Nm, S) :-
  carta1(N),
  cartas(N, Num),
  carta2(T),
  cartas(T, Nm),
  Resu is Num + Nm,
  atomics_to_string(["Tiene las siguientes cartas en la mano: ", Num," y ", Nm, " y su total es ", Resu, ". Para seguir jugando inserte el comando pedirCarta([Carta1, Carta2])"], S).


% Suma cada una de las cartas que tiene el jugador en su mano y te muestra el valor total que generan. 
manoCartas([X|Y],S):-   
   carta(X,P),
   manoCartas(Y, M),
   S is P + M.

% Agrega en la lista una nueva carta
agregar(X, L, Lnueva):- append([X], L, Lnueva).

% Cuando tienes la primera mano, es decir, solo dos cartas este predicado inserta una nueva carta a la mano y 
% te devueve las cartas que tiene el jugador en la mano y el total de puntos que esta genera.
pedirCarta([X|Y]) :-
  length([X|Y], Long), 
  Long == 2,
  random(1,10,Num),
  manoCartas([X|Y],S),
  O is S + Num, 
  write("Te ha salido la carta = "),
  write(Num),
  nl, 
  atomic_list_concat(Y, C),
  atomics_to_string(["Tiene las siguientes cartas ", X, ", ", C, " y ", Num, " y su suma es ", O, "." ], B),
  write(B),
  nl,
  resultado(O),
  !.

% Este predicado se ejecuta cuando la mano del jugador tiene 3 o mas cartas y te muestra las cartas que tiene el jugador en la mano 
% y el total de puntos que esta genera.
pedirCarta([X|Y]) :-
  length([X|Y], Long),
  Long =\= 2,
  random(1,10,Num),
  manoCartas([X|Y],S),
  O is S + Num, 
  resultado(O),
  nl,
  atomics_to_string(["La nueva carta tras pedir es " , Num , ". El nuevo total de sus caras es ", O, "."], P),
  write(P). 


% Este predicado comprueba que tras obtener una nueva carta, el valor total de la mano del jugador supera los 21 puntos, 
% en ese caso el jugador ha perdido inmediatamente o si el valor de su mano es 21 ha realizado BlackJack y por lo tanto ha ganado la partida.
resultado(M):-
  M >= 21,
  M > 21 -> write("Suma más de 21. HAS PERDIDO!");
  M == 21 -> write("BLACKJACK");
  write("Para plantarse use el comando plantar(SumCartas).").


% En el caso de jugar dos jugadores contra el dealer, este predicado comprueba si hay algun empate. 
comprabarNumero(X,Y,Random) :-
  empateJugador1(X, Random),
  nl,
  empateJugador2(Y, Random),
  nl,
  write("El dealer tiene "),
  write(Random).

% En el caso de jugar dos jugadores contra el dealer, este predicado comprueba si hay un empate entre uno de los jugadores con el dealer. 
% y te muestra si el jugador que no ha quedado empate gana o pierde. 
plantar(Carta1, Carta2) :-
  random(18,21, Num),
  plantar2(Carta1, Carta2, Num).

% Comprueba si el dealer empata con alguno de los dos jugadores y comprueba si ha ganado o perdido el jugador restante. 
plantar2(Sol1, Sol2, Num) :-
  U is  (Sol1 - Num),
  U =:= 0 -> write("Empate entre jugador 1 y Dealer con "),
  write(Num),
  nl,
  empateJugador1(Sol2, Sol1),
  nl,
  write("Jugador 2 tenía "),
  write(Sol2); 
  (Sol2 - Num) =:= 0 -> write("Empate entre jugador 2 y Dealer con suma "),
  write(Num),
  nl,
  empateJugador2(Sol1, Sol2),
  nl,
  write("Jugador 1 tenía "),
  write(Sol1);
  comprabarNumero(Sol1, Sol2, Num).

% Comprueba si el jugador 2 ha ganado o no respecto al jugador 1. 
empateJugador1(X, Y) :-
  X < Y -> write("Jugador 2 ha perdido");
  write("Jugador 2 ha ganado!").

% Comprueba si el jugador 1 ha ganado o no respecto al jugador 2. 
empateJugador2(X, Y) :-
  X < Y -> write("Jugador 1 ha perdido");
  write("Jugador 1 ha ganado!").
 
% Este predicado te muestra el ganador del juego. Juega el jugador contra el dealer.
ganadorSegunPuntosDealer1(X, Dealer) :-
  X > Dealer -> write("Jugador 1 han ganado.");
  write("El dealer ha ganado al jugador 1.").

% Este predicado te muestra el ganador del juego. Juega el jugador contra el dealer.
ganadorSegunPuntosDealer2(X, Dealer) :-
  X > Dealer -> write("Jugador 2 han ganado.");
  write("El dealer ha ganado al jugador 2.").


% ------------------------------------------------------------------- Solo un jugador -------------------------------------------------------------


% Este predicado genera el valor de la mano del dealer.  
plantar(Carta) :-
  random(16,21, Num),
  plantar1(Carta, Num).

% Este predicado te muestra si hay un empate entre el jugador y el dealer.
plantar1(Carta, Num) :-
 U is (Carta - Num),
 U =:= 0 -> write("Empate entre el dealer y jugador con cartas = "),
 write(Carta);
comprabarDealerJugador(Carta, Num).

% Este predicado comprueba, si tanto el dealer, como el jugador hacen BlackJack. 
comprabarDealerJugador(X,Y) :-
  X =:= 21 -> write("Has conseguido BLACKJACK");
  Y =:= 21 -> write("El Dealer ha conseguido BLACKJACK");
  ganadorPuntosDealerJugador(X,Y).

% Este predicado te muestra quien ha ganado el juego y los valores de la mano del dealer y el jugador. 
ganadorPuntosDealerJugador(M, P) :-
  M > P -> write("Has ganado! "), 
  nl,
  atomics_to_string(["El jugador tenía ", M, ", y el dealer ", P, "."], B), 
  write(B);
  write('Ha ganado el Dealer! '),
  nl,
  atomics_to_string(["El jugador tenía ", M, ", y el dealer ", P, "."], T), 
  write(T).

%Facts

correcto("ok").
cartas(1,1). % Carta y su valor
cartas(2,2).
cartas(3,3).
cartas(4,4).
cartas(5,5).
cartas(6,6).
cartas(7,7).
cartas(8,8).
cartas(9,9).
cartas(10,10).
cartas(j,10).
cartas(q,10).
cartas(k,10).
cartas(a,1).
