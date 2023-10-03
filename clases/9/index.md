---
title: Clase 9 - Desarrollo web
description-meta: Clase 9
author-meta: Desarrollo web
---

# 1. JavaScript asincrónico

La programación asincrónica es una técnica que permite a los programas inicializar
una potencial tarea de larga duración y poder seguir respondiendo a otros eventos mientras la 
tarea se está ejecutando, en vez de tener que esperar a que esta finalice su ejecución. 
Una vez finalizada la ejecución de la tarea, el programa muestra los resultados.

Muchas funciones que proporciona el navegador pueden tomar mucho tiempo en ejecutarse, y
por ello, son asincrónicas.

Por ejemplo, realizar un petición HTTP `(HTTP requests)` utilizando `fetch()`.

## 1.1 Programación sincrónica

En este tipo de programación, el navegador ejecutará secuencialmente el código, línea por línea,
en el orden que nosotros lo hayamos escrito. El navegador esperará que la línea
anterior haya terminado su ejecución para continuar con la siguiente.
Tiene que hacer esto porque cada línea depende del trabajo realizado en las líneas precedentes.

> Aunque utilicemos funciones auxiliares, la programación sigue siendo síncrona.

Por ejemplo:

```js
function hello(nombre){
  return `Hola, mi nombre es ${nombre}!`;
}

const nombre = "Emilia";
const saludar = hello(nombre);
console.log(saludar);
// "Hola, mi nombre es Emilia"

```

### 1.1.1 Función sincrónica de larga duración

Cuando tenemos una función que tarda mucho tiempo en terminar su ejecución, vamos a 
a ver que nuestro programa no responde en lo absoluto.

Para poder solucionar este problema, necesitamos buscar una forma de que nuestro programa:

1. Inicie una operación de larga duración llamando a una función.
2. Haga que esa función inicie la operación y regrese inmediatamente, de manera que nuestro programa pueda seguir respondiendo a otros eventos.
3. Notifique el resultado de la operación cuando se complete.

Eso es precisamente lo que pueden hacer las funciones asíncronas.


# 2. Event Handlers (Manejadores de eventos)

Los Event Handlers son una forma de programación asincrónica. Proporciona una función que será 
llamada cuando ocurra un evento. 

La API  [XMLHttpRequest](https://developer.mozilla.org/es/docs/Web/API/XMLHttpRequest) 
permite hacer peticiones HTTP a un servidor remoto utilizando JavaScript. Como este proceso
pueden llevar mucho tiempo, esta es una API asíncrona, y obtiene una notificación
sobre el prograso y eventual finalización del request adjuntando event listeners al objeto 
`XMLHttpRequest`

# 3. CallBacks (devoluciones de llamda)

Un callback es una función que se pasa hacia otra función, con la expectativa de que el
callback sea llamado en el momento apropiado.

El código basado en callbacks puede volverse complicado de entender cuando el propio
callback debe llamar a otra funciones que aceptan un callback.Esta es una situación común 
si necesitas realizar alguna operación que se descompone en una serie de funciones asíncronas. 

> Un event handler es un tipo particular de callback.

La mayoría de las APIs asíncronas modernas no utilizan callbacks. En su lugar,
la base de este tipo de programación en JavaScript es la Promise.

# 4. Promises (promesas)

Una Promise es un objeto retornado por una función asincrónica, y representa el estado
actual de la operación. En el momento que la Promise es retornada al caller (llamador), 
la operación generalmente aún no ha finalizado, pero el objeto Promise proporciona 
métodos para manejar el eventual éxito o fracaso de la operación.

Con una API basada en Promises, la función asincrónica inicia la operación y devuelve
un objeto Promise. Podemos agregarle manejadores (handlers) a este objeto, los cuales
se ejecutarán cuando la operación haya tenido éxito o haya fallado.

## 4.1 fetch API

En una HTTP request, enviamos un mensaje de solicitud a un servidor remoto, y este 
nos devuelve una respuesta.
En este caso, le haremos un request al servidor para poder obtener un 
archivo JSON. [API con datos sobre las universidades de Argentina]("http://universities.hipolabs.com/search?country=Argentina").

```js
async function fetchUniversidades() { 
    return await fetch("http://universities.hipolabs.com/search?country=Argentina");
}

const response = await fetchUniversidades();
const universidades = await response.json();

console.log("Universidades en Argentina:");
console.log(universidades);
```

> Notese que la request HTTP por defecto que usa fetch es un GET.

Lo que hacemos en este ejemplo de codigo es lo siguiente:

Definimos la funcion fetchUniversidades y decimos que es asincrona con la palabra clave 
`async`. Esta funcion se encarga de hacer la solicitud HTTP GET a la URL mencionada anteriormente.

La palabra clave `await` indica que espera la respuesta de una funcion asincrona. (`fetch` es una 
funcion asincrona).

Luego llamamos a esta funcion y la guardamos en la variable `response`.
Una vez hecho esto llamamos al metodo `json()` de la response (que tambien es asincrono por lo cual se 
hace un `await`), este metodo se encarga de convertir el JSON retornado por la API en un objeto JS.
Finalmente, imprimimos este objeto en la consola.
