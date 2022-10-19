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

% Añadir carta en la mano del jugarod de una en una
pedirCarta([X|Y], Num, P) :-
  manoCartas([X|Y],S),
  P is S + Num.

% Caso pierde si suma mas de 21 si no es el caso seguir jugando
pierde([X|Y],S):-
  manoCartas([X|Y],M),
  M > 21,
  M > 21 -> write("Suma más de 21. Has perdido");
  write("Sigue jugando").

% caso gana 






pierde(X, Y, Z) :-
    sumaCarta(X,Y,Z), 
    Z > 11.

read_animal(X) :-
  write('please type animal name:'),
  nl,
  read(X).


    
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


