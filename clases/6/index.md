---
title: Clase 6 - Desarrollo web
description-meta: Clase 6
author-meta: Desarrollo web
---

# 1. Introduccion a CSS 

CSS es un lenguaje que sirve para especificar como se deben presentar los 
documentos, es decir, como se les da estilo.

CSS puede ser utilizado para cambiar desde el color y el tamaño de los textos 
hasta incluso crear elementos como sidebars, animaciones, sombras, entre otros.

Hasta ahora hemos visto como se realiza la estructura basica de una pagina 
web utilizando solo HTML. Aunque no utilicemos estilos CSS el navegador 
tiene estilos por defecto, que se aplican sin necesidad de tener un archivo 
CSS.

Con CSS vamos a poder controlar como queremos que se vea nuestro sitio exactamente.

# 2. Sintaxis

CSS es un lenguaje basado en reglas. Las reglas se definen especificando grupos
de estilos que deben aplicarse a elementos (o grupos de elementos) de la pagina web.

Veamos el siguiente codigo CSS:

```css
h1 {
  color: red;
  font-size: 5em;
}
```

Esto significa: a todos los elementos `h1` se le aplicara lo siguiente:

* color: la propiedad `color` dice que color de texto debe tener, en este caso rojo.
* font-size: la propiedad `font-size` define el tamaño del texto, en este caso son 
5em, que es una unidad que veremos mas en profundidad.

Esto es un ejemplo de una regla CSS: 

Una regla CSS comienza con un 'selector', que selecciona los elementos HTML a 
los cuales se le aplicaran los estilos. En este ejemplo son los elementos `h1`.

Luego entre llaves `{ }` se escriben una o mas **declaraciones**, que toman 
la forma de **propiedades** y **valores**. Una propiedad por ejemplo es `color` 
y el valor es `red`.

Cada propiedad CSS tiene diferentes valores posibles. La propiedad `color`, 
puede tomar distintos [valores de color](https://developer.mozilla.org/es/docs/Learn/CSS/Building_blocks/Values_and_units#color), 
mientras que la propiedad `font-size` puede tomar distintas [unidades de longitud](https://developer.mozilla.org/es/docs/Learn/CSS/Building_blocks/Values_and_units#n%C3%BAmeros_longitudes_y_porcentajes).

# 3. Primeros pasos con CSS

## 3.1 Linkear HTML con CSS

Empecemos con lo conocido, es decir nuestro documento HTML. Supongamos que 
tenemos un archivo `index.html` con el siguiente contenido:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Ejemplo con CSS</title>
  </head>

  <body>
    <h1>Una pagina sencilla</h1>

    <p>
      Este es un parrafo con algo de texto de 
      ejemplo. En este texto hay un 
      <span>element span</span> y tambien 
      un <a href="https://unnoba.edu.ar">link</a>.
    </p>

    <p>
      Este es el segundo parrafo que contiene texto en <em>italica</em>.
    </p>

    <ul>
      <li>Item <span>uno</span></li>
      <li>Item dos</li>
      <li>Item <em>tres</em></li>
    </ul>
  </body>
</html>
```

El primer paso es crear un archivo CSS, en este ejemplo lo llamaremos 
`styles.css` y contendra todos nuestros estilos.

Para que el HTML pueda "encontrar" este archivo tenemos que linkearlo. Esto 
se hace agregando lo siguiente al elemento `<head>` del documento HTML.

```html
<link rel="stylesheet" href="styles.css" />
```

El elemento `<link>` le dice al navegador que tenemos una hoja de estilos (`rel="stylesheet"`),
y que su ubicacion esta dada por `href="styles.css"`.

Ahora estamos en condiciones de editar nuestra pagina con estilos CSS.

## 3.2 Agregando una clase

Hasta ahora vimos como podemos seleccionar elementos HTML para cambiarles el 
estilo referenciandolos por su nombre, por ejemplo `h1`. Pero esto no siempre 
es conveniente, por ejemplo, si queremos que algun elemento del mismo tipo no 
se vea igual al resto. 
Ej: tenemos distintos elementos `button` y queremos tener uno que tenga color 
rojo y otro color azul.

Entonces tenemos que utilizar un atributo HTML llamado `class` (clase). Una 
clase CSS sirve para seleccionar un subconjunto de elementos sin cambiar 
el estilo de otros.

En el ejemplo anterior, vamos a agregarle una clase (llamada 'especial') a uno de los elementos `li` 
para diferenciarlo del resto.

```html
<ul>
  <li>Item <span>uno</span></li>
  <li class="especial">Item dos</li>
  <li>Item <em>tres</em></li>
</ul>
```

En nuestro CSS podemos crear un estilo que sea aplicado a todos los elementos 
que tengan la clase `especial`.

```css
.especial {
    color: #2563eb;
    font-weight: bold;
}
```

> Notese que cuando queremos darle estilo a clases de CSS utilizamos 
un '.' seguido de el nombre de la clase.

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="zYyZzwq" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/zYyZzwq">
  Ejemplo CSS simple</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

# 4. Box model (modelo de caja)

En CSS el termino "box model" se refiere a una "caja" que envuelve a
cada elemento HTML. Esta caja se compone de: margen, borde, padding y el contenido.

![](https://web-dev.imgix.net/image/VbAJIREinuYvovrBzzvEyZOpw5w1/ECuEOJEGnudhXW5JEFih.svg) 

Explicacion de las diferentes partes:

* Content: Es el contenido del elemento, por ejemplo texto o imagenes.
* Padding: Es un "relleno" alrededor del elemento, que sirve para darle mas espacio visualmente.
* Border: Es el borde que encierra el padding y el contenido.
* Margin: Es un area de margen fuera del borde (no es lo mismo que el padding ya que esta por fuera del borde).

Con CSS podemos especificar cuanto padding (relleno) o margin (margen) debe tener un elemento, 
incluso podemos definir el borde, que tan grueso es y que color tiene.

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="BavWZmG" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/BavWZmG">
  Untitled</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

# 5. Unidades

CSS tiene diferentes unidades para expresar la longitud. Muchas propiedades 
CSS toman valor de longitud, como por ejemplo `width`, `margin`, `padding`, 
`font-size`, etc.

Todas las unidades de longitud se componen de un numero seguido de su unidad, 
como `10px`, `2em`, etc.

# 5.1 Unidades absolutas

Las unidades absolutas son fijas, y apareceran en pantalla con el tamaño 
especifico. 

No son recomendables en general porque al variar los tamaños de pantalla se 
vuelve dificil que la pagina se vea bien. Por ejemplo si tenemos una letra 
de 9px quiza se vea bien en una pantalla de celular, pero en una pantalla de 
TV se vera muy chiquita.

| Unidad | Descripcion |
| -------- | ------- |
| cm  | centimetros |
| mm | milimetros |
| in | pies (inches) (1in = 96px = 2.54cm) |
| px | pixeles (1px = 1/96th of 1in) |
| pt | puntos (1pt = 1/72 of 1in) |
| pc | picas (1pc = 12 pt) |

# 5.2 Unidades relativas

Las unidades relativas especifican una longitud relativa a otra propiedad de longitud.
Este tipo de unidades se veran similar entre diferentes tipos de pantalla.

| Unidad | Descripcion |
| -------- | ------- |
| em | Relativo al font-size del elemento (2em significa 2*font-size de la fuente actual)|
| % | Relativo al elemento padre |
| ex | Relativo a la altura-x de la fuente actual (raramente usado) |
| ch | Relativo a el ancho de "0" |
| rem | Relativo al font-size del elemento root (raiz) |
| vw | Relativo al 1% de el ancho del viewport |
| vh | Relativo al 1% del alto del viewport |
| vmin | Relativo al 1% de la dimension mas chica del viewport|
| vmax | Relativo al 1% de la dimension mas grande  del viewport|

* Viewport = tamaño de la ventana del navegador

> Tip: en general las unidades em y rem son practicas para crear una pagina responsive.

# 6. Color

Ya vimos la propiedad `color`, que sirve para cambiar el color del texto en un 
elemento en particular.

Tambien existe la propiedad `background-color` que sirve para cambiar el color 
de fondo a nuestros elementos:

Esta clase CSS pone el color de fondo en azul.

```css
.fondo-azul {
    background-color: blue;
}
```

A continuacion un ejemplo utilizando colores de fondo y colores de texto.

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="YzdZQLe" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/YzdZQLe">
  Untitled</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Los valores de color en CSS se pueden escribir en RGB, HEX o algunas predefinidas 
como `red`, `blue`, `white`. 

Para elegir que color queremos exactamente es recomendable utilizar un selector 
de colores (color picker)[https://htmlcolorcodes.com/] online y copiar el valor hexadecimal para utilizarlo.

En el ejemplo anterior es usan valores hexadecimales.


# 7. Fuentes de texto

Podemos elegir que familia de fuentes de texto usar utilizando `font-family`
En CSS hay 5 familias de fuentes genericas:

1. Serif
2. Sans-serif
3. Monospace
4. Cursive
5. Fantasy

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="yLojraG" data-editable="true" data-user="web-dot-dev" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/web-dot-dev/pen/yLojraG">
  Text | font-family</a> by web.dev (<a href="https://codepen.io/web-dot-dev">@web-dot-dev</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

> Tambien se pueden elegir fuentes de Google Fonts e importarlas en tu CSS 
para personalizar la experiencia aun mas.

Se pueden cambiar los estilos de fuentes utilizando `font-style`:

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="MWvGRjx" data-editable="true" data-user="web-dot-dev" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/web-dot-dev/pen/MWvGRjx">
  Text | font-style</a> by web.dev (<a href="https://codepen.io/web-dot-dev">@web-dot-dev</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Ademas se pueden hacer que las fuentes sean mas "gruesas" o "finas" utilizando 
la propiedad `font-weight`.

Finalmente, podemos cambiar el tamaño de las fuentes utsando la propiedad 
`font-size`.

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="eYEroda" data-editable="true" data-user="web-dot-dev" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/web-dot-dev/pen/eYEroda">
  Text | font-size keywords v2</a> by web.dev (<a href="https://codepen.io/web-dot-dev">@web-dot-dev</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

# 8. Flexbox

## 8.1 La propiedad display
La propiedad `display` sirve para dos cosas.  
Una de ellas es determinar si la caja (box) a la que se aplica actua como inline o como bloque. 

```css
.mi-elemento {
    display: inline;
}
```

Los elementos **inline** se comportan como palabras en una oración. Se ponen uno al lado del otro en la misma linea. Los elementos como `<span>` y `<strong>`, que son tipicamente usados para darle estilo a partes del texto dentro de un elemento padre como un `<p>` (párrafo), son inline por defecto. También preservan los espacios en blanco.

![](https://web-dev.imgix.net/image/VbAJIREinuYvovrBzzvEyZOpw5w1/GezxDZXkJgkMevkKg89M.png?auto=format&w=845)

> No se puede setear un ancho o alto (width, height) explicito a los elementos inline. Cualquier margin o padding que se le agregue va a ser ignorado.

```css
.mi-elemento {
    display: block;
}
```
Los elementos `block` no se ponen uno al lado del otro. Se crean en una nueva línea.  
A menos que se modifique por CSS, un elemento block se va a expandir al ancho de la dimensión inline, es decir, todo el ancho de la página. 

 ```css
.mi-elemento {
    display: flex;
}
```
La propiedad `display` también determina cómo se comportan los elementos hijos del elemento. Por ejemplo, si usamos la `display: flex` la caja se transforma en una caja a nivel de bloque, y sus hijos en items flex. Lo que permite controlar su alineación, orden y flujo.

## 8.2 Flexbox en detalle
Flexbox es un mecanismo de layout para layouts unidimensionales. Es decir, a lo largo de un solo eje, horizontal o vertical. Por defecto, flexbox alinea los elementos hijos uno al lado del otro, en la dirección inline y los estira (stretch) en la dirección block, para que tengan la misma altura.

<p class="codepen" data-height="800" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="GRwbGQY" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/GRwbGQY">
  Untitled</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### 8.2.1 Dirección de los items
Para cambiar la dirección en la que se muestran los elementos hijos de un contenedor con `display: flex;` se utiliza la propiedad `flex-direction`.
Puede tener los siguientes valores:

* row: los items se muestran en fila (horizontal).
* column: los items se muestran en una columna (vertical)
* row-reverse: los items se muestran en fila con el orden inverso.
* column-reverse: los items se muestran en columna con el orden inverso.

<p class="codepen" data-height="800" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="RwqzJBY" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/RwqzJBY">
  Untitled</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### 8.2.2 Alineamiento de los items
Hay dos tipos de propiedades flex para alineamiento, unas orientadas a la distribución del espacio y otras al alineamiento. Las propiedades para distribuir el espacio son:

`justify-content`: distribuye el espacio en el eje principal.
`align-content`: distribuye el espacio en el eje secundario.

Las propiedades para alinear son:
`align-self`: alinea un único elemento en el eje secundario.
`align-items`: alinea todos los items en el eje secundario.

Si estás trabajando en el eje principal las propiedades empiezan con `justify-`. Las del eje secundario empiezan con `align-`

<p class="codepen" data-height="800" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="bGgwLgz" data-editable="true" data-user="web-dot-dev" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/web-dot-dev/pen/bGgwLgz">
  Learn CSS - Flexbox - Justify content</a> by web.dev (<a href="https://codepen.io/web-dot-dev">@web-dot-dev</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

<p class="codepen" data-height="800" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="poREawo" data-editable="true" data-user="web-dot-dev" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/web-dot-dev/pen/poREawo">
  Learn CSS - Flexbox - Align content</a> by web.dev (<a href="https://codepen.io/web-dot-dev">@web-dot-dev</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>
