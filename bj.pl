% Rules
% ; = OR
% , = AND

:- discontiguous manoCartas/2.
use_module(library(random)).



% Comenzar el juego 
comenzar() :-
write("Bienvenido al juego BlackJack para empezar el juego tiene que escribir OK. en caso contrario escriba cualquier cosa"),
nl,
read(S),
correcto(S) -> write("Para seguir jugando ejecute el comando manoCartasInicialJugador1(X,Y,S) o manoCartasInicialJugador2(X,Y,S)y te mostrará tu primera mano");
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
manoCartasInicialJugador1(Num, Nm, S) :-
  carta1(N),
  cartas(N, Num),
  carta2(T),
  cartas(T, Nm),
  atomics_to_string(["Tiene las siguientes cartas en la mano: ", Num," y ", Nm, ". Para seguir jugando inserte el comando pedirCarta([cartas], P)"], S).

manoCartasInicialJugador2(Num, Nm, S) :-
  carta1(N),
  cartas(N, Num),
  carta2(T),
  cartas(T, Nm),
  atomics_to_string(["Tiene las siguientes cartas en la mano: ", Num," y ", Nm, ". Para seguir jugando inserte el comando pedirCarta([Cartas], P)"], S).


% Suma el valor de cada una de las cartas que tiene el jugador en su mano
manoCartas([X|Y],S):-   
   carta(X,P),
   manoCartas(Y, M),
   S is P + M.

agregar(X, L, Lnueva):- append([X], L, Lnueva).

pedirCarta([X|Y], P) :-
  length([X|Y], Long), 
  Long == 2,
  random(1,10,Num),
  manoCartas([X|Y],S),
  O is S + Num, 
  resultado(O),
  atomic_list_concat(Y, C),
  atomics_to_string(["Tiene las siguientes cartas ", X, ", ", C, " y ", Num], P).

pedirCarta([X|Y], P) :-
  length([X|Y], Long),
  Long =\= 2,
  random(1,10,Num),
  manoCartas([X|Y],S),
  O is S + Num, 
  resultado(O),
  agregar(Num, [X|Y], Lnew),
  atomic_list_concat(Lnew, C),
  atomics_to_string(["Tiene la siguientes cartas: ", C], P). 

% Devuelve la suma del valor total de la mano de los dos jugadores
% jugadores([X|Y], [Z|A]) :-
%  manoCartas([X|Y], S),
%  manoCartas([Z|A], T),
%  write("Jugador uno tiene  = "),
%  write(S),
%  write("\n"),
%  write("Jugador dos tiene  = "),
%  write(T).



% declararGanador(Cartas, Res) :-
% Res < Cartas,
% write("Felicidades has ganado la ronda con "),
% write(Cartas),
% write("\n"), 
% write("El dealer tenia: "),
% write(Res),
% write("\n").

% declararGanador(Cartas, Res) :-
% Res >= Cartas,
% write("El dealer ha ganado con: "), 
% write("\n"),
% write(Res),
% write("\n"), 
% write("El jugador tenia: "),
% write(Cartas),
% write("\n").


% Caso resulatdo trás pedir una carta
resultado(M):-
  M >= 21,
  M > 21 -> write("Suma más de 21. HAS PERDIDO!");
  M == 21 -> write("BLACKJACK");
  write("Para seguir jugando introduce el comando pedirCarta([Cartas],P) o plantate con el comando plantar([CartasJugador1], [CartasJugador2]).").

% caso empate
plantar([X|Y], [Z|A]) :-
  manoCartas([X|Y], Sol1),
  manoCartas([Z|A], Sol2),
  U is  (Sol1 - Sol2), 
  U =:= 0 -> write("EMPATE!");
  resultadoPuntos([X|Y], [Z|A]).

% caso gana cuando ninguno de los dos jugadores llega a 21 
 resultadoPuntos([D|E], [F|G]) :-
  manoCartas([D|E], M),
  manoCartas([F|G], P),
  M > P -> write("Ha ganado el jugador1!");
  write('Ha ganado el jugador 2! ').

    
% Facts

correcto("OK").
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
