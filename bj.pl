% Rules
% ; = OR
% , = AND

 carta(X,S) :-
    cartas(X,S).


sumaCarta(X,Y, S) :-
   cartas(X,T),
   cartas(Y,G),   
    S is T + G.

manoCartas([],0).

manoCartas([X|Y],S):-   
   carta(X,P),
   manoCartas(Y, M),
   S is P + M.



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


