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

% Cuando el jugador no tiene cartas en la mano
manoCartas([],0).

% Genera cartas aleatorias
random_Cards(Num) :-
  random(1, 10, N),
  cartas(N, Num).

% Carta1 
carta1(Num) :-
  random(1, 10, N),
  cartas(N, Num).

% Carta2 
carta2(Num) :-
  random(1, 10, N),
  cartas(N, Num).

% El jugador al principio solo tendra dos cartas
mano1(Num, Nm, S) :-
  carta1(N),
  cartas(N, Num),
  carta2(T),
  cartas(T, Nm),
  Resu is Num + Nm,
  atomics_to_string(["Tiene las siguientes cartas en la mano: ", Num," y ", Nm, " y su total es ", Resu, ". Para pedir otra carta y seguir jugando inserte el comando pedirCarta([Carta1, Carta2])"], S).
 

mano2(Num, Nm, S) :-
  carta1(N),
  cartas(N, Num),
  carta2(T),
  cartas(T, Nm),
  Resu is Num + Nm,
  atomics_to_string(["Tiene las siguientes cartas en la mano: ", Num," y ", Nm, " y su total es ", Resu, ". Para seguir jugando inserte el comando pedirCarta([Carta1, Carta2])"], S).


% Suma el valor de cada una de las cartas que tiene el jugador en su mano
manoCartas([X|Y],S):-   
   carta(X,P),
   manoCartas(Y, M),
   S is P + M.

agregar(X, L, Lnueva):- append([X], L, Lnueva).

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


% Caso resulatdo trás pedir una carta
resultado(M):-
  M >= 21,
  M > 21 -> write("Suma más de 21. HAS PERDIDO!");
  M == 21 -> write("BLACKJACK");
  write("Para plantarse use el comando plantar(SumCartas).").


% Comprobar si uno de los dos numeros es un 21
comprabarNumero(X,Y,Random) :-
  empateJugador1(X, Random),
  nl,
  empateJugador2(Y, Random),
  nl,
  write("El dealer tiene "),
  write(Random).

plantar(Carta1, Carta2) :-
  random(18,21, Num),
  plantar2(Carta1, Carta2, Num).

% caso empate
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

empateJugador1(X, Y) :-
  X < Y -> write("Jugador 2 ha perdido");
  write("Jugador 2 ha ganado!").

empateJugador2(X, Y) :-
  X < Y -> write("Jugador 1 ha perdido");
  write("Jugador 1 ha ganado!").

ganadorSegunPuntosDealer1(X, Dealer) :-
  X > Dealer -> write("Jugador 1 han ganado.");
  write("El dealer ha ganado al jugador 1.").

ganadorSegunPuntosDealer2(X, Dealer) :-
  X > Dealer -> write("Jugador 2 han ganado.");
  write("El dealer ha ganado al jugador 2.").

plantar(Carta) :-
  random(16,21, Num),
  plantar1(Carta, Num).

plantar1(Carta, Num) :-
 U is (Carta - Num),
 U =:= 0 -> write("Empate entre el dealer y jugador con cartas = "),
 write(Carta);
comprabarDealerJugador(Carta, Num).

comprabarDealerJugador(X,Y) :-
  X =:= 21 -> write("Has conseguido BLACKJACK");
  Y =:= 21 -> write("El Dealer ha conseguido BLACKJACK");
  ganadorPuntosDealerJugador(X,Y).

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
