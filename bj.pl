% Rules
% ; = OR
% , = AND

% Este predicado te devuelve el  valor de cada carta
carta(X,S) :-
  cartas(X,S).

% Cuando el jugador no tiene cartas en la mano
manoCartas([],0).

% Suma el valor de cada una de las cartas que tiene el jugador en su mano
manoCartas([X|Y],S):-   
   carta(X,P),
   manoCartas(Y, M),
   S is P + M.

% Devuelve la suma del valor total de la mano de los dos jugadores
jugadores([X|Y], [Z|A]) :-
  manoCartas([X|Y], S),
  manoCartas([Z|A], T),
  write("Jugador uno tiene  = "),
  write(S),
  write("\n"),
  write("Jugador dos tiene  = "),
  write(T).

% Genera cartas aleatorias
random_Cards(Num) :-
  random(0, 10, N),
  cartas(N, Num).

% El jugador al principio solo tendra dos cartas
random_Cards(Num, Nm, S) :-
  random(0, 10, N),
  cartas(N, Num),
  random(0, 10, T),
  cartas(T, Nm),
  S = [Num | Nm ].


% Guarda dos cartas random
% random_Cards(S) :-
%  T = Num,
%  write(T),
%  % C = Num1,
%  % S = [T|C],
%  write(S),
%  !.


% Añadir carta en la mano de un jugador de una en una
pedirCarta([X|Y], Num, P) :-
  manoCartas([X|Y],S),
  P is S + Num.

% Caso pierde si suma mas de 21, si no, sigue jugando
pierde([X|Y]):-
  manoCartas([X|Y],M),
  M > 21,
  M > 21 -> write("Suma más de 21. Has perdido");
  write("Sigue jugando").

% caso gana inmediatamente
ganar([X|Y]) :-
  manoCartas([X|Y],S),
  S < 21 -> write("Felicidades has ganado la ronda").

% caso empate
empate([X|Y], [Z|A]) :-
  sum_list([X|Y], M),
  sum_list([Z|A], P),
  U is  (M - P),
  U =:= 0 -> write("EMPATE!"), 
  write("\n").

% caso gana cuando ninguno de los dos jugadores llega a 21 
ganaJugador([D|E], [F|G]) :-
  sum_list([D|E], M),
  sum_list([F|G], P),
  M > P -> write("Ha ganado el jugador1!"),
  M < P; write('Ha ganado el jugador 2! ').
 



    
% Facts

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