% Rules
% ; = OR
% , = AND

carta(X,Y) :-
    cartas(X,Y).

sumaCarta(X,Y) :-
    cartas(X,T),
    cartas(Y,G),    
    S is T + G,
    write(S).
    
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


