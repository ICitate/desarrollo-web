---
title: Clase 8 - Desarrollo web
description-meta: Clase 8
author-meta: Desarrollo web
---

# 1. DOM (Document Object Model)

El DOM es una interfaz de programacion para documentos web. Sirve para representar 
la pagina de modo que los programas puedan modificar su estructura, estilo y 
contenido. El DOM representa el documento como nodos y objetos. De esta forma, 
los lenguajes de programacion (como JavaScript) pueden interactuar con la pagina.

Por ejemplo, el DOM especifica que el metodo `querySelectorAll` en este codigo 
debe retornar una lista de todos los elementos `<p>` del documento.

```js
const parrafos = document.querySelectorAll("p");
// parrafos[0] es el primer elemento <p>
// parrafos[1] es el segundo elemento <p>, etc.
console.log(parrafos[0].nodeName)
```

Todas las propiedades, metodos y eventos disponibles para manipular en una 
pagina web se organizan en objetos. Por ejemplo, el objeto `document` representa 
al documento en si mismo.

Los objetos principales a manipular en el DOM son los objetos `document` y `window`.
El objeto `window` representa al navegador, y el objeto `document` representa a la 
raiz (root) del documento. 

A continuacion se listan las interfaces mas comunmente utilizadas en paginas web.

* document.querySelector()
* document.querySelectorAll()
* document.createElement()
* Element.innerHTML
* Element.setAttribute()
* Element.getAttribute()
* EventTarget.addEventListener()
* HTMLElement.style
* Node.appendChild()
* window.onload
* window.scrollTo()

## 1.1 Ejemplos

### 1.1.1 Cambiando el contenido de texto

Este ejemplo usa un `<div>` que contiene un `<textarea>` y dos `<button>`. Cuando 
el usuario clickea en el primer boton agregamos un texto en el `<textarea>`, y 
si clickeamos el otro boton borramos el texto. Vamos a utilizar: 

* Document.querySelector() para acceder al elemento `<textarea>` y el boton.
* EventTarget.addEventListener() para "escuchar" los clicks al boton.
* Node.textContent para agregar y quitar el texto.

```html
<div class="container">
  <textarea class="texto"></textarea>
  <button id="set-text" type="button">Agregar texto</button>
  <button id="clear-text" type="button">Quitar texto</button>
</div>
```

```css
.container {
  display: flex;
  gap: 0.5rem;
  flex-direction: column;
}

button {
  width: 200px;
}
```

```js
const story = document.body.querySelector(".texto");

const setText = document.body.querySelector("#set-text");
setText.addEventListener("click", () => {
  story.textContent = "Este es un texto de ejemplo que se agrega con JS";
});

const clearText = document.body.querySelector("#clear-text");
clearText.addEventListener("click", () => {
  story.textContent = "";
});
```

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="zYyWGMv" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/zYyWGMv">
  DOM text manipulation</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>


### 1.1.2 Agregando un elemento hijo 

Este ejemplo usa un `<div>` que contiene otro `<div>` y dos `<button>`. Cuando 
el usuario clickea en el primer boton creamos un nuevo elemento y lo agregamos 
como hijo del `<div>`. Cuando el usuario clickea el segundo boton borramos el 
elemento hijo. Vamos a usar:

* Document.querySelector para acceder a los elementos div y button.
* EventTarget.addEventListener() para escuchar los clicks de los botones.
* Document.createElement para crear un elemento.
* Node.appendChild() para agregar al hijo.
* Node.removeChild() para borrar al hijo.

**HTML**

```html
<div class="container">
  <div class="parent">parent</div>
  <button id="add-child" type="button">agregar un hijo</button>
  <button id="remove-child" type="button">borrar el hijo</button>
</div>
```

**CSS**

```css
.container {
  display: flex;
  gap: 0.5rem;
  flex-direction: column;
}

button {
  width: 100px;
}

div.parent {
  border: 1px solid black;
  padding: 5px;
  width: 100px;
  height: 100px;
}

div.child {
  border: 1px solid red;
  margin: 10px;
  padding: 5px;
  width: 80px;
  height: 60px;
  box-sizing: border-box;
}
```

**JS**

```js
const parent = document.body.querySelector(".parent");

const addChild = document.body.querySelector("#add-child");
addChild.addEventListener("click", () => {
  // Solo agregamos al hijo si no tenemos uno
  if (parent.childNodes.length > 1) {
    return;
  }
  const child = document.createElement("div");
  child.classList.add("child");
  child.textContent = "child";
  parent.appendChild(child);
});

const removeChild = document.body.querySelector("#remove-child");
removeChild.addEventListener("click", () => {
  const child = document.body.querySelector(".child");
  parent.removeChild(child);
});
```

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="abPYOPN" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/abPYOPN">
  DOM Manipulation 2</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### 1.1.3 Cambiando una pagina entre modo claro y oscuro

Este ejemplo muestra una pagina simple, donde los elementos ademas de sus 
clases de estilo normal, tienen dos clases llamadas `.light` y `.dark`, estas 
clases poseen los estilos correspondientes al modo claro y oscuro.

La estrategia es obtener todos los elementos con clase light y cambiarlas a dark 
cuando se presione el boton de cambio de modo, y viceversa. Vamos a usar:

* document.getElementById para seleccionar el button que cambia de modo.
* Document.querySelectorAll para buscar a todos los elementos con clase .light 
o .dark respectivamente
* EventTarget.addEventListener() para escuchar los clicks de los botones.
* Node.textContent para cambiar el contenido del texto 
* classList para obtener la lista de clases CSS de cada elemento 
* classList.replace() para reemplazar una clase por otra

```html
<div id="container" class="light">
  <h1>
    Ejemplo
  </h1>
  <p>
  Una pagina que 
  cambia entre modo 
  claro y oscuro
  </p>
  <button id="mode-btn" class="btn light">
    Modo oscuro
  </button>
</div>
```

```css
body {
  font-family: sans-serif;
  padding: 0;
  margin: 0;
}

#container {
  width: 100%;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.light {
  background: white;
  color: #262626;
}

.dark {
  background: #262626;
  color: #fafafa;
}

.btn {
  padding: 1em;
  border-radius: 0.5em;
}
```

```js
const button = document.getElementById("mode-btn");

button.addEventListener("click", () => {
    // todos los elementos con clase .light
    const light = document.querySelectorAll(".light");
    if (light.length > 0) {
        // cambiamos a todos los que tengan clase light a dark
        for (let i = 0; i < light.length; i++) {
            light[i].classList.replace("light", "dark");
        }
        // cambiamos el texto del boton
        button.textContent = "Modo claro";
    } else {
        // lo mismo pero de dark a light
        const dark = document.querySelectorAll(".dark");
        for (let i = 0; i < dark.length; i++) {
            dark[i].classList.replace("dark", "light");
        }
        button.textContent = "Modo oscuro";
    }
});
```

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="rNodVPV" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/rNodVPV">
  Untitled</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

> Hay mas formas de lograr este efecto de cambio de modo oscuro y claro entre 
las paginas. Esta es una solucion posible, pero invitamos al lector a 
explorar distintas alternativas.

# 2. Eventos

Los eventos son cosas que suceden en el sistema que estás programando. 
El sistema se encarga de producir una señal de cierto tipo cuando un 
evento ocurre, y proporciona un mecanismo para que una acción se lleve a cabo 
(ejecutar código) de forma automática cuando el evento ocurra. 
Los eventos se lanzan dentro de la ventana del navegador y 
usualmente están asociados a un elemento en específico dentro de dicha ventana.
Esto puede ser un solo elemento, un grupo de elementos, el documento HTML 
cargado la pestaña actual, o la ventana del navegador en su totalidad. 
Existen distintos tipos de eventos que pueden ocurrir.

Por ejemplo:

*    El usuario selecciona, hace clic o pasa el ratón por encima de cierto elemento.
*    El usuario presiona una tecla del teclado.
*    El usuario redimensiona o cierra la ventana del navegador.
*    Una página web terminó de cargarse.
*    Un formulario fue enviado.
*    Un vídeo se reproduce, se pausa o termina.
*    Ocurrió un error.

Para ver todos los eventos que existen recomendamos la [referencia de MDN](https://developer.mozilla.org/es/docs/Web/Events).


Para reaccionar a un evento, podes asociarle un manejador de eventos. 
Esto es un bloque de código (normalmente una función de JavaScript que como 
programador creas) que se ejecuta cuando el evento ocurre. 
Cuando uno de estos bloques de código se configura para ejecutarse 
en respuesta de un evento, decimos que estamos registrando un manejador de eventos.

## 2.1 Manejando un evento de click

En el siguiente ejemplo, tenemos un único elemento `<button>` en la página:

```html
<button>Cambiar el color</button>
```

Ahora tenemos algo de JavaScript. 
Veremos esto más a detalle en la siguiente sección pero, 
por ahora, nos basta decir que: agrega un manejador de evento al evento 
"click" del botón, y el manejador reacciona al evento estableciendo un color 
de fondo aleatorio en la página:

```js
const btn = document.querySelector("button");

function random(number) {
  return Math.floor(Math.random() * (number + 1));
}

btn.addEventListener("click", () => {
  const rndCol = `rgb(${random(255)}, ${random(255)}, ${random(255)})`;
  document.body.style.backgroundColor = rndCol;
});
```

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="OJrvVKo" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/OJrvVKo">
  colores random</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

## 2.2 Propiedades extra en los objetos evento

La mayoría de objetos eventos tienen un conjunto estándar de propiedades y 
métodos disponibles en el objeto evento; visita la referencia del objeto 
Event para una lista completa.

Algunos objetos evento agregan propiedades extra que son relevantes para un 
tipo de evento en particular. Por ejemplo, el evento keydown se lanza cuando el 
usuario presiona una tecla. Su objeto evento es un KeyboardEvent, 
el cual es un objeto Event especializado con una propiedad key 
que nos indica la tecla que fue presionada.

```html
<input id="textBox" type="text" />
<div id="output"></div>
```

```js
const textBox = document.querySelector("#textBox");
const output = document.querySelector("#output");
textBox.addEventListener(
  "keydown",
  (event) => (output.textContent = `Presionaste "${event.key}".`),
);
```

Intenta escribir en la caja de texto y mira el resultado:

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="zYyWvOB" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/zYyWvOB">
  Untitled</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

## 2.3 Evitando el comportamiento por defecto

 En algunas ocasiones, te encontrarás en una situación donde quieres evitar que 
 un evento realice su acción por defecto. 
 El escenario más común es el de un formulario web, por ejemplo, 
 un formulario personalizado para un registro. Cuando llenas todos los campos 
 y haces clic en el botón para enviar, el comportamiento normal es que la 
 información sea enviada a un servidor para que sea procesada, 
 mientras que el navegador se redirecciona a una página donde se muestra un 
 mensaje de "envío exitoso" (o a la misma página si no se especifica otra).

El problema viene cuando el usuario no ha introducido sus datos correctamente. 
Como desarrollador, quieres evitar que la información sea enviada al servidor y, 
en su lugar, mostrar un mensaje de error que señale cuáles son los problemas 
y qué se necesita para corregirlos. Algunos navegadores tienen soporte 
para características de validación automática de formularios, 
pero tomando en cuenta que muchos otros no, se te recomienda que no confies 
en estos mecanismos e implementes tus propias pruebas de validación.
Veamos un ejemplo.

Primero, un formulario HTML simple que requiere que introduzcas tu nombre y apellido:

```html
<form>
  <div>
    <label for="fname">Nombre: </label>
    <input id="fname" type="text" />
  </div>
  <div>
    <label for="lname">Apellido: </label>
    <input id="lname" type="text" />
  </div>
  <div>
    <input id="submit" type="submit" />
  </div>
</form>
<p></p>
```

Ahora un poco de JavaScript. Aquí vamos a implementar una simple prueba dentro 
del manejador del evento submit (el evento submit es lanzado en un 
formulario cuando este se envía) que determina si los campos de texto están 
vacíos o no. En caso de que lo estén, llamamos al método preventDefault()
del objeto evento, el cual detiene el envío del formulario y muestra un 
mensaje de error en el párrafo debajo de nuestro formulario para hacerle saber 
al usuario cuál es el problema:

```js
const form = document.querySelector("form");
const fname = document.getElementById("fname");
const lname = document.getElementById("lname");
const para = document.querySelector("p");

form.addEventListener("submit", (e) => {
  if (fname.value === "" || lname.value === "") {
    e.preventDefault();
    para.textContent = "¡Necesitas completar ambos campos!";
  }
});
```

Obviamente esta es una validación bastante débil, esto no detendría al usuario de,
por ejemplo, llenar los campos del formulario con espacios en blanco o números, 
pero, es suficiente para los propósitos de nuestro ejemplo. 
El resultado es el siguiente:

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="NWeYGKJ" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/NWeYGKJ">
  Validacion basica</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

> Cabe aclarar que para asegurarnos de que un usuario no deje un campo vacio es 
mejor utilizar el atributo de HTML required en lugar de validarlo por JS, pero 
a efectos de ejemplificar utilizamos este caso.
