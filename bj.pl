% Rules
% ; = OR
% , = AND

:- discontiguous manoCartas/2.

% Comenzar el juego 
comenzar() :-
write("Bienvenido al juego BlackJack para empezar el juego tiene que escribir OK. en caso contrario escriba cualquier cosa"),
nl,
read(S),
correcto(S) -> write("Para seguir jugando ejecute el comando manoCartasInicial(X,Y,S) y te mostrará tu primera mano");
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
manoCartasInicial(Num, Nm, S) :-
  carta1(N),
  cartas(N, Num),
  carta2(T),
  cartas(T, Nm),
  S = [Num | Nm ].

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



% Añadir carta en la mano de un jugador de una en una
pedirCarta([X|Y], P) :-
  random(1,10,Num),
  write("La carta que te ha salido es: "),
  write(Num),
  write("\n"),
  manoCartas([X|Y],S),
  P is S + Num, 
  resultado(P).

% Plantarte y jugar con el dealer para ver quien a ganado

plantar(Cartas) :-
 random(1,21, Res), 
 declararGanador(Cartas, Res).

declararGanador(Cartas, Res) :-
 Res < Cartas,
 write("Felicidades has ganado la ronda con "),
 write(Cartas),
 write("\n"), 
 write("El dealer tenia: "),
 write(Res),
 write("\n").

declararGanador(Cartas, Res) :-
 Res >= Cartas,
 write("El dealer ha ganado con: "), 
 write("\n"),
 write(Res),
 write("\n"), 
 write("El jugador tenia: "),
 write(Cartas),
 write("\n").


% Caso resulatdo trás pedir una carta
resultado(M):-
  M >= 21,
  M > 21 -> write("Suma más de 21. Has perdido");
  M == 21 -> write("BlackJack");
  write("Para seguir jugando introduce el comando pedirCarta().").
  

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