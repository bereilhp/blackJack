% Rules
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


manoCartasJ2([Cabeza1|J], [Cabeza2|G], SumCartasJugador1, SumCartasJugador2) :-
  carta(Cabeza1, X),
  write(X),
  write(" "),
  carta(Cabeza2, Y),
  write(Y),
  write(" "),
  write(J),
  manoCartas(J, M),
  write(M),
  write(" "),
  write(G),
  carta([G], Pe),
  write(Pe),
  write(" "),
  SumCartasJugador1 is X + suma1,

  SumCartasJugador2 is Y + suma2.



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



    
% Facts

animal(perro).
animal(gato).
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


