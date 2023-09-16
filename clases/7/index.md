---
title: Clase 7 - Desarrollo web
description-meta: Clase 7
author-meta: Desarrollo web
---

# 1. Introduccion a JavaScript

JavaScript es un lenguaje de programacion que permite implementar funcionalidades 
complejas en paginas web. Permite agregar interactividad al sitio.

Es la tercera capa de las tecnologias web estandar.

[](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_is_JavaScript/cake.png)

Como todo lenguaje de programacion, se ejecutaran una serie de instrucciones 
que se describen en el mismo lenguaje. Como si se tratara de una receta de cocina, 
los pasos se ejecutan en orden y uno a la vez.

> Aclaracion sobre JavaScript y Java: a pesar de su similaridad en los 
nombres, Java y Javascript no tienen mucho en comun como lenguajes de 
programacion.

## 1.1 Como ejecutar JavaScript 

El encargado de ejecutar JavaScript es el navegador, de la misma forma que se 
encarga de mostrar la pagina renderizando el HTML. 
Una forma de hacerlo es incluir nuestro JavaScript en un tag `<script>` dentro 
del HTML. Este tag se debe incluir justo antes de cerrar el tag `<body>` es decir, 
en la linea antes del `</body>`.

```html
<script>
    // aca va nuestro codigo
</script>
```

> Deberan abrir la consola del navegador para ver los resultados de los ejemplos 
que se veran a lo largo de esta clase. F12 para abrir la consola.

# 2. Variables

Una variable es un contenedor para un valor, como un numero que utilizaremos 
para hacer una suma o un string (cadena de caracteres) que usaremos como parte 
de una oracion.

## 2.1 Declaracion

Para utilizar una variable primero hay que declararla. Esto significa, darle 
un nombre a la misma.

```js
let miNombre;
```

> En JS cada instruccion termina con ;

Esto declara la variable `miNombre`, que luego contendra un valor string.

Tal como esta ahora, no contiene ningun valor, es decir que si queremos 
utilizarla, tendremos un valor nulo (`null` o `undefined`).

## 2.2 Inicializacion

Una vez declarada, se puede inicializar con un valor, utilizando el signo 
`=`.

```js 
miNombre = "Emi";
```

Comunmente, las variables se inicializan en el mismo momento que se declaran.
Esto se puede hacer de la siguiente manera:

```js
let miNombre = "Emi";
```

Para imprimir los valores de las variables en la consola. Utilizamos la funcion 
`console.log`.

```js
let miNombre = "Emi";
console.log(miNombre);
```

## 2.3 Actualizacion

Una vez que una variable se inicializa con un valor dado, es posible actualizarlo
dandole otro valor.

```js
let miNombre = "Emi";
console.log(miNombre);

miNombre = "Nacho"
console.log(miNombre);
```

# 3. Condicionales

Es probable que en algun momento necesitamos tomar decisiones basadas en una 
condicion. Para esto necesitamos las sentencia `if-else`.

```js
if (condicion) {
  /* codigo que se ejecuta si es verdadero */
} else {
  /* codigo que se ejecuta si es falso */
}
```

Tambien se puede omitir el `else` y simplemente preguntar si la condicion 
es verdadera.

```js
if (condicion) {
  /* codigo que se ejecuta si es verdadero */
} 

/* codigo que se va a ejecutar en cualquier caso */
```

Veamos un ejemplo sencillo:


```js
let imprimirEmi = true;

if (imprimirEmi == true) {
    console.log("Emi");
} else {
    console.log("Nacho");
}
```

# 4. Operaciones basicas

Como cualquier lenguaje de programacion se pueden hacer varias operaciones 
aritmeticas (suma, resta, multiplicacion, division) y logicas (AND, OR, NOT).

```js
let x = 10;
let y = 2;

console.log(x + y)
console.log(x - y)
console.log(x * y)
console.log(x / y)
```

Algunas operaciones logicas:
```js
// and
console.log(true && false);
// or
console.log(true || false);
// not
console.log(!true);
// es distinto?
console.log(1 != 2);
// es igual? 
console.log(1 == 2);
// 2 + 0 es igual que 3 - 1?
console.log(2+0 == 3-1);
// el string juan es igual al string juan?
console.log("juan" == "jorge")
// juan es igual a juan?
console.log("juan" == "juan")
```

# 5. Loops (bucles)

A veces tenemos colecciones de elementos (listas) para las que queremos 
realizar determinada accion en cada elemento.

Un tipo de coleccion es el `Array` de JavaScript. Pero tambien existen otras 
como `Set` y `Map`.

## 5.1 For..Of 

En JavaScript es posible iterar en una lista utilizando un tipo de loop llamado 
`for..of`. 

```js
let colores = ["Azul", "Negro", "Verde", "Rojo", "Violeta", "Rosa", "Amarillo"];

for (const color of colores) {
    console.log(color);
}
```

## 5.2 For tradicional

Tambien podemos iterar de la forma tradicional.

```js
let colores = ["Azul", "Negro", "Verde", "Rojo", "Violeta", "Rosa", "Amarillo"];

for (let i = 0; i < colores.length; i++) {
    let color = colores[i];
    console.log(color);
}
```

# 6. Funciones

Las funciones son una forma de reutilizar nuestro codigo, y luego poder 'invocarlo'
donde lo necesitemos.

Ejemplo de definicion de una funcion:

```js
function saludar() {
    console.log("Hola!");
}
```

Como se ejecuta:

```js
saludar();
```

Es importante declarar la funcion antes de llamarla:

```js
function saludar() {
    console.log("hola!");
}

saludar();
```

## 6.1 Parametros

Tambien podemos definir funciones que utilicen parametros (es decir, valores 
necesarios para su ejecucion).

```js
function saludarA(nombre) {
    console.log("Hola " + nombre + "!");
}

saludarA("Chino");
```

## 6.2 Funciones por defecto y metodos

Muchas de las funciones que vamos a utilizar ya estan definidas en JS.

Por ejemplo, algunas que manipulen strings o interactuen con el DOM (que veremos en la 
proxima clase).

```js
const myText = "Esto es color azul";
const newString = myText.replace("azul", "verde");
console.log(newString);
```

> Podemos utilizar const en lugar de let, para declarar variables que no van 
a cambiar de valor.

# 7. Ejemplo integrador

Cuantas veces podremos sacar 'cara' si tiramos una moneda 10 veces?

```js 
let cantCara = 0;

for (let i = 0; i < 10; i++) {
    const randomNumber = Math.random(); // numero aleatorio entre 0 y 1

    console.log(`intento ${i+1}...`);

    if (randomNumber > 0.5) {
        console.log("cara");
        cantCara += 1;
    } else {
        console.log("cruz");
    }
}

console.log(`Sacaste cara ${cantCara} veces.`);
``` 

> Ejecuta el codigo varias veces haciendo F5 a tu pagina para ver como cambian
los valores.
