# Documentación para BlackJack usando prolog

## Prerequisitos 
- Tener instalado swipl en nuestro caso es la version 8.4.3. Se puede comprobar utilizando el siguiente comando:

```
swipl --version
```

## Abrir el fichero de prolog 
- Abrir el directorio donde esta el fichero bj.pl

- Para ejecutar el juego usar el siguiente comando: 
```
swipl bj.pl
```

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
- Este predicado te devolverá la nueva carta aleatoria y su suma con el resto de cartas que tienes en la mano. 

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

- Por último, si el dealer tiene un asuma de cartas mayor que el jugador, significa que el dealer ha ganado 

![plot](./imagenes/PlantarDealer1G.png)








