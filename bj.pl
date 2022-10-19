%Rules
% ; = OR
% , = AND

% saber el valor de cada carta ya que tenemos cartas que tienen figura 
carta(X,S) :-
  cartas(X,S).

% pedir cartas
manoCartas([],0).

% Cartas que tiene el jugador en su mano
manoCartas([X|Y],S):-   
   carta(X,P),
   manoCartas(Y, M),
   S is P + M.

% Comparar dos jugadores
jugadores([X|Y], [Z|A]) :-
  manoCartas([X|Y], S),
  manoCartas([Z|A], T),
  write("Jugador uno tiene  = "),
  write(S),
  write("\n"),
  write("Jugador dos tiene  = "),
  write(T).

% Repartir cartas random

random_Cards(Num) :-
  random(0, 10, N),
  cartas(N, Num).

random_Cards(A) :-
  random_Cards(A),
  !.

% Añadir carta en la mano del jugarod de una en una
pedirCarta([X|Y], Num, P) :-
  manoCartas([X|Y],S),
  P is S + Num.

% Caso pierde si suma mas de 21 si no es el caso seguir jugando
pierde([X|Y]):-
  manoCartas([X|Y],M),
  M > 21,
  M > 21 -> write("Suma más de 21. Has perdido");
  write("Sigue jugando").

% caso gana
ganar([X|Y]) :-
  manoCartas([X|Y],S),
  S < 21,
  write("Felicidades has ganado la ronda").

<<<<<<< HEAD
 
%Facts
agregar_inicio(E,L1,[E|L1]).
cartas(1,1). % Es la carta A
=======
  empate([X|Y], [Z|A]) :-
  sum_list([X|Y], M),
  sum_list([Z|A], P),
  U is  (M - P),
  U =:= 0 -> write("EMPATE!"), 
  write("\n").

ganaJugador([X|Y], [Z|A]) :-
  sum_list([X|Y], M),
  sum_list([Z|A], P),
  M > P -> write("Ha ganado el jugador1!"),
  M < P, write('Ha ganado el jugador 2! ').

    
% Facts

animal(perro).
animal(gato).
cartas(1,1). % Carta y su valor
>>>>>>> a1e6487b2687d2d9d92028f4e6a369a17ef3be4c
cartas(2,2).
cartas(3,3).
cartas(4,4).
cartas(5,5).
cartas(6,6).
cartas(7,7).
cartas(8,8).
cartas(9,9).
cartas(10,10). % dentro contiene J, Q, K



