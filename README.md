# Documentación juego BlackJack con prolog

Hecho por: María Calvo Torres y Pedro Bereilh

## Prerequisitos 
- Tener instalado swipl en nuestro caso es la version 8.4.3. Se puede comprobar utilizando el siguiente comando:

```
swipl --version
```

## Abrir el fichero de prolog 
- Clonar este repositorio
- Abrir el directorio donde esta el fichero bj.pl
- Para ejecutar el juego usar el siguiente comando: 
```
swipl bj.pl
```

# ¿Qué es BlackJack?

- El Blackjack, también llamado veintiuno, es un juego de cartas, propio de los casinos con una o más barajas inglesas de 52 cartas sin los comodines, que consiste en sumar un valor lo más próximo a 21 pero sin pasarse.

[Más información sobre BlackJack](http://www.ete.enp.unam.mx/como_jugar_Blackjack.pdf)

## Reglas 

- Se utiliza una baraja inglesa. 
- El As vale 1, las figuras (J,Q,K) valen 10 y el resto de cartas valen su propio valor.
- Se empieza con dos cartas aleatoria.
- Se pueden pedir al dealer más cartas.
- Cuando te acercas al 21 te puedes plantar.
- Puede realizar un BlackJack y ganar automaticamente que consiste en sumar 21. 
- Si te pasas de 21 pierdes. 
- Si al plantarte no tienes 21 se compara con la mano del dealer y del otro jugador si lo hay. 
- Puede darse el caso de empate si la suma de un jugador es la misma que la del dealer.


# Un jugador contra el Dealer

## Para ejecutar el juego necesitamos ejecutar los siguientes comandos:

- Para inicializar el juego ejecutaremos el siguiente comando:
```
iniciarJuego().
```
- Cuando se ejecute este comando te pedirá por consola que escribas "ok" (importante escribirlo con comillas y en minúscula y con punto incluido). para empezar el juego. Si escribes algo diferente se parará el juego. 

Ejemplo 

![plot](./imagenes/IniciarJuego.png)

## Recibir primera mano
- Inicialmente se parte con dos cartas. Para obtener las dos cartas tiene que ejecutar el comando 
````
mano1(X,Y,S).
````  
- X es la primera carta 
- Y es la segunda carta 
- S es conjunto de cartas y su total.

Ejemplo 

![plot](./imagenes/Mano1.png)
 

## Pedir carta usando la primera mano 

- Para pedir una carta e insertarla en nuestra mano tenemos que ejecutar el siguiente comando: 
```
pedirCarta([Carta1, Carta2]).
```
- Este predicado te devolverá la nueva carta aleatoria y se sumará con el resto de cartas que tienes en la mano. 

Ejemplo

![plot](./imagenes/PedirCarta2.png)

## Pedir carta cuando tienes tres cartas o más

- Si quieres arriesgarta y pedir otra carta para acercarte lo máximo posible a 21 tienes que ejecutar el comando anterior pero añadiendo todas tus cartas actuales.

```
pedirCarta([Carta1, Carta2, Carta 3]).
```

Ejemplo

![plot](./imagenes/PedirCarta3.png)

- Si pides muchas cartas puedes llegar a 21 y esto significa que has hecho BlackJack y por lo tanto has ganado automaticamente. 

![plot](./imagenes/PedirCartaBJ.png)

- Cuando el jugador pide cartas y el valor de su mano supera los 21, inmediatamente pierde el juego contra el dealer. 

![plot](./imagenes/PedirCartaPerder.png)

## Plantarse contra el dealer 

- Si estas satisfecho con tus cartas y crees que puedes ganar al dealer entonces utiliza el comando:
```
plantar(15).
```

- Hay tres resultados posibles que son: empate, perder y ganar. 
- Cuando el jugador y el dealer tienen la misma suma de cartas, se denomina empate. 

![plot](./imagenes/PlantarEmpate.png)

- Cuando el jugador tiene una suma de cartas mayor que el dealer, significa que le jugador le ha gando. 

![plot](./imagenes/PlantarGanar.png)

- Por último, si el dealer tiene una suma de cartas mayor que el jugador, significa que el dealer ha ganado 

![plot](./imagenes/PlantarDealer1G.png)

# Dos jugadores contra el Dealer

## Para ejecutar el juego necesitamos ejecutar los siguientes comandos:

- Para inicializar el juego ejecutaremos el siguiente comando:
```
iniciarJuego().
```
- Cuando se ejecute este comando te pedirá por consola que escribas "ok" (importante escribirlo con comillas y en minúscula y con punto incluido). para empezar el juego. Si escribes algo diferente se parará el juego. 

Ejemplo 

![plot](./imagenes/IniciarJuego.png)

## Recibir primera mano para cada jugador.
- Inicialmente cada jugador partirá con dos cartas. Para obtener las dos cartas tienen que ejecutar los siguientes comandos:
````
mano1(X,Y,S).
````  
````
mano2(X,Y,S).
`````

- X es la primera carta 
- Y es la segunda carta 
- S es conjunto de cartas y su total.

Ejemplo 

![plot](./imagenes/Mano1Mano2.png)

## Pedir carta usando la primera mano 

- Para pedir una carta e insertarla en nuestra mano tenemos que ejecutar el siguiente comando: 
```
pedirCarta([Carta1, Carta2]).
```
- Este predicado te devolverá la nueva carta aleatoria y se sumará con el resto de cartas que tienes en la mano. 

- Como podemos observar a continuación, tenemos que pedir cartas para cada jugador ya qu etienen manos diferentes y son independientes. 

- Como es el mismo predicado aplican las mismas reglas que en el caso anterior. 

Ejemplo

![plot](./imagenes/pedirMano1y2.png)

## Plantarse contra el dealer siendo dos jugadores

- Si estas satisfecho con tus cartas y crees que puedes ganar al dealer entonces utiliza el comando:
```
plantar(18,15).
```

- Hay tres resultados posibles que son: empate, perder y ganar. 
- Cuando un jugador y el dealer tienen la misma suma de cartas, se denomina empate. 

Ejemplo

![plot](./imagenes/EmpateDealerJugador2.png)

![plot](./imagenes/EmpateJugador1Dealer.png)


- Cuando el jugador tiene una suma de cartas mayor que el dealer, significa que el jugador ha gando esa ronda.

Ejemplo

![plot](./imagenes/Jugador2GanaDealer.png)

- Por último, si el dealer tiene una suma de cartas mayor que los jugadores, significa que el dealer ha ganado 

Ejemplo

![plot](./imagenes/plantar2GanaDealer.png)
