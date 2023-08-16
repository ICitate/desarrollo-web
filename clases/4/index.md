---
title: Clase 4 - Desarrollo web
description-meta: Clase 4
author-meta: Desarrollo web
---

# 1. Links 

El Elemento HTML `<a>` junto con su atributo `href`, 
crea un enlace a otras páginas, archivos o ubicaciones 
dentro de la misma página, direcciones de correo, etc.
Posee la siguiente sintaxis:

```html 
<a href="url" target="_self" >
    texto del link
</a>
```

## 1.1 Atributo href
El atributo `href` especifica la direccion del hipervinculo,
lo que transforma al tag `<a>` en un link. 
Este atributo se usa para: 

* Crear hipervinculos a otras paginas.
* Crear hipervinculos a localizaciones especificas de una pagina.
* Descargar archivos.
* Enviar un email a una direccion especifica.

```html
<a href="https://unnoba.edu.ar">
    Pagina UNNOBA
</a>
<a href="https://unnoba.edu.ar">
    <img 
        src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Chain_link_icon_slanted.png/800px-Chain_link_icon_slanted.png"
    />
    Este link contiene una imagen
</a>
<a href="#links">
    Seccion links de esta pagina
</a>
<a href="https://es.wikipedia.org/wiki/HTML#Elementos">
    Wikipedia: HTML, seccion "Elementos"
</a>
<a href="mailto:memoyano@unnoba.edu.ar">
    Enviar mail
</a>
```

Resultado:
<div style="display: flex; flex-direction: column; gap: 0.25em; border-bottom: solid 1px #d4d4d4; padding: 0.25em 0;">
    <a href="https://unnoba.edu.ar">
        Pagina UNNOBA
    </a>
    <a href="https://unnoba.edu.ar">
        <img 
            src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Chain_link_icon_slanted.png/800px-Chain_link_icon_slanted.png"
            style="width: 1em;"
        />
        Este link contiene una imagen
    </a>
    <a href="#links">
        Seccion links de esta pagina
    </a>
    <a href="https://es.wikipedia.org/wiki/HTML#Elementos">
        Wikipedia: HTML, seccion "Elementos"
    </a>
    <a href="mailto:memoyano@unnoba.edu.ar">
        Enviar mail
    </a>
</div>

## 1.2 Atributo target 
Por defecto, la página o archivo linkeado será mostrado en la ventana actual en la que nos encontramos. Para cambiarlo, utilizaremos el atributo target

Los valores permitidos por este atributo son:

`_self`: Valor por defecto. 
Carga la URL en la misma ventana/tab de navegación actual.

`_blank`: Carga la URL en un nuevo contexto de navegación. 
Usualmente es una pestaña nueva, pero los usuarios pueden configurar 
sus navegadores para que en vez de una pestaña, se abra una ventana.

`_parent`: Carga la URL en el contexto de navegación padre del actual. 
Si no existe el padre, se comporta igual que el modo `_self`.

`_top`: Carga la URL en el contexto en el contexto más alto de 
navegación (el cual es un ancestro del actual, y no tiene padre). 
Si no existe el padre, se comporta igual que el modo `_self`.

# 2. Listas
Las listas sirven para representar una secuencia de datos.
HTML tiene diferentes tipos de listas, ordenadas y sin orden. 

## 2.1 Listas sin orden
El elemento `<ul>` es el elemento padre para las listas desordenadas. Los 
hijos de un `<ul>` son uno o mas elementos `<li>`. 
Por ejemplo, creemos una lista de artistas musicales, 
ya que no importa el orden, usemos la lista `<ul>`.

```html 
<ul>
  <li>Foo Fighters</li>
  <li>Arctic Monkeys</li>
  <li>Red Hot Chili Peppers</li>
</ul>
```
Resultado:
<ul>
  <li>Foo Fighters</li>
  <li>Arctic Monkeys</li>
  <li>Red Hot Chili Peppers</li>
</ul>

## 2.2 Listas ordenadas
El elemento `<ol>` es el elemento padrea para las listas ordenadas. Los hijos de 
un `<ol>` son uno o mas elementos `<li>` (igual que para las listas sin orden). 
Los simbolos de la lista son la secuencia de numeros que le corresponde a cada 
uno (1, 2, 3, ...).
Esto se puede modificar con CSS utilizando la propiedad `list-style-type` o 
el atributo HTML `type`.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="poQBayy" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/poQBayy">
  Listas ordenadas</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

El elemento `<ol>` tiene tres atributos especificos: `type`, `reversed`, y `start`.

El atributo `type` sirve para elegir el tipo de numeracion, por defecto se utiliza 
`1` para numeros, pero tambien se pueden usar letras empezando desde la `A`, o 
numeros romanos `I`, `II`, `III`, etc.

El atributo booleano `reversed` invierte el orden de los numeros.

El atributo `start` elige desde que valor empieza la lista, por defecto es `1`.

## 2.3 Listas de descripcion
Una lista de descripcion (description list `<dl>`) es un elemento que contiene 
cero o mas "terminos de descripcion" (description terms `<dt>`) y sus "detalles 
de descripcion" (description details `<dd>`). 

```html
<dl>
    <dt>Foo Fighters</dt>
    <dd>
        Foo Fighters es un grupo de rock estadounidense formada en la ciudad de Seattle en 1994 por el exbaterista de Nirvana, Dave Grohl.
    </dd>
    <dt>Arctic Monkeys</dt>
    <dd>Arctic Monkeys es una banda británica de rock, formada en Sheffield, Reino Unido</dd>
</dl>
```
Resultado:
<div style="display: flex; flex-direction: column; gap: 0.25em; border-bottom: solid 1px #d4d4d4; padding: 0.25em 0;">
    <dl>
        <dt>Foo Fighters</dt>
        <dd style="margin-left: 0.5em;">
            Foo Fighters es un grupo de rock estadounidense formada en la ciudad de Seattle en 1994 por el exbaterista de Nirvana, Dave Grohl.
        </dd>
        <dt>Arctic Monkeys</dt>
        <dd style="margin-left: 0.5em;">
            Arctic Monkeys es una banda británica de rock, formada en Sheffield, Reino Unido
        </dd>
    </dl>
</div>

# 3. Imagenes
Las imagenes decorativas, como los gradientes de fondo en los botones o las 
imagenes de fondo en las paginas, son solo para presentacion (estilo) y 
deberian ser aplicados con CSS.
Por el contrario, cuando una imagen aporta algo al contexto del documento,
esta debe ser embebida en el HTML.

El metodo principal para incluir imagenes es el tag `<img>` con el atributo 
`src` que referencia la URL de la imagen, y el atributo `alt` que describe 
su contenido.

```html
<img src="https://thisis-images.scdn.co/37i9dQZF1DZ06evO4BaAkp-default.jpg" 
    alt="Portada de Arctic Monkeys en Spotify"
/>
```
Resultado:

<div>
    <img src="https://thisis-images.scdn.co/37i9dQZF1DZ06evO4BaAkp-default.jpg" 
        alt="Portada de Arctic Monkeys en Spotify" 
        style="width: 15em;"
    />
</div>

El atributo `alt` sirve como texto alternativo para la imagen, dando una 
descripcion de la misma para aquellos que no puedan ver la pantalla (por ejemplo
motores de busqueda como Google, y tecnologias de asistencia como Alexa, Siri, y 
Google Assistant). Tambien sirve para los emails HTML, ya que muchos usuarios 
bloquean las imagenes en sus apps de correo.

# 4. Navegacion
Ya vimos como crear links con el tag `<a>` y como crear listas con `<ul>` y `<ol>`.
En esta seccion, agruparemos listas de links para crear elementos de navegacion.

La navegacion no deja de ser mas que una lista de links que llevan a otras paginas 
o a partes de la misma pagina.
Por ejemplo, el indice de contenidos de esta pagina forma parte de su navegacion.  

Lo recomendable es que los usuarios puedan navegar cualquier pagina del sitio
con la menor cantidad de clicks posbiles, de esta forma la navegacion se vuelve 
intutiva en lugar de agobiante.

Utilizando links es posible saltar a otros elementos en la pagina con un cierto `id`.
Por ejemplo, para ir a la seccion navegacion de esta pagina, se puede utilizar este
codigo.:

```html
<a href="#navegacion">4. Navegacion</a>
```

Esto movera el foco de la pagina al elemento con `id="navegacion"`, en nuestro 
caso es:

```html
<h1 id="navegacion">4. Navegacion</h1>
```

En general, todos los componentes de navegacion que creemos tendran la 
siguiente forma:

```html
<nav>
    <a href="/alguna-pagina">
        Link 1
    </a>
    <a href="/alguna-otra-pagina">
        Link 2
    </a>
    <a href="/otra-pagina">
        Link 3
    </a>
</nav>
```

La diferencia reecae en el CSS utilizado para darle estilo y que se 
presente de distintas maneras.

## 4.1 Tabla de contenidos
La tabla de contenidos es un ejemplo de navegacion local, nos permite saltar 
a diferentes partes de (usualmente) la misma pagina.

La tabla de contenidos de esta pagina tiene la siguiente estructura:

```html
<nav id="TOC" role="doc-toc">
  <h2 id="toc-title">&rsaquo; Indice de contenidos</h2>
  <ul>
    <li>
      <a href="#links">1. Links</a>
      <ul>
        <li>
          <a href="#atributo-href">1.1 Atributo href</a>
        </li>
        <li>
          <a href="#atributo-target">1.2 Atributo target</a>
        </li>
      </ul>
    </li>
    <li>
      <a href="#listas">2. Listas</a>
      <ul>
        <li>
          <a href="#listas-sin-orden">2.1 Listas sin orden</a>
        </li>
        <li>
          <a href="#listas-ordenadas">2.2 Listas ordenadas</a>
        </li>
        <li>
          <a href="#listas-de-descripcion">2.3 Listas de descripcion</a>
        </li>
      </ul>
    </li>
    <li>
      <a href="#imagenes">3. Imagenes</a>
    </li>
    <li>
      <a href="#navegacion">4. Navegacion</a>
    </li>
  </ul>
</nav>
```

Notese que el elemento `<nav>` encierra toda la tabla de contenidos, esto 
semanticamente significa que dentro del `<nav>` se encuentran elementos 
que permiten la navegacion.

## 4.2 Sidebar 
Un Sidebar se trata de una barra de navegacion que se encuentra en un lateral 
de la pagina. Sigue el mismo principio, se trata de una lista de links,
tambien puede tener imagenes dentro de los `<a>` por cuestiones esteticas.

Por ejemplo, la barra de navegacion de Instagram (en su version web). 

<img src="images/insta-sidebar.png"
    height="400"
    style="height: 30em;"
    alt="Instagram Sidebar"
/>

## 4.3 Topbar 
Un Topbar se trata de una barra de navegacion superior, que suele linkear a 
distintas paginas relacionadas, dentro de la misma aplicacion.

Por ejemplo, el topbar de Netflix (en su version web).

<img src="images/netflix-topbar.png"
    style="width: 100%;"
    alt="Netflix Topbar"
/>

# 5. Tablas

Las tablas HTML se usan para mostrar datos tabulares con filas y columnas.

> La decision para usar una `<table>` debe basarse en el contenido que se 
presenta a las necesidades de los usuarios en relacion al mismo. Si 
los datos presentados tambien necesitan ser comparados, ordenados, calculados 
y referenciados entre si, entonces una `<table>` probablemente sea la opcion 
correcta. En cambio, si solamente se necesitan mostrar datos de forma 
no-tabular, como un grupo de imagenes (estilo thumbnail de YouTube), las tablas 
no son la opcion apropiada: en lugar de eso, crea una lista `<ul>` con imagenes
y dale estilo con CSS.

Un ejemplo de una tabla simple es:

```html
<table>
  <tr>
    <th>Artista</th>
    <th>Genero</th>
    <th>Cancion</th>
  </tr>
  <tr>
    <td>Foo Fighters</td>
    <td>Rock</td>
    <td>Under you</td>
  </tr>
  <tr>
    <td>Tame Impala</td>
    <td>Indie</td>
    <td>Let it happen</td>
  </tr>
  <tr>
    <td>Sex Pistols</td>
    <td>Punk</td>
    <td>EMI</td>
  </tr>
  <tr>
    <td>Megadeth</td>
    <td>Metal</td>
    <td>Trust</td>
  </tr>
</table> 
```

<table>
  <tr>
    <th>Artista</th>
    <th>Genero</th>
    <th>Cancion</th>
  </tr>
  <tr>
    <td>Foo Fighters</td>
    <td>Rock</td>
    <td>Under you</td>
  </tr>
  <tr>
    <td>Tame Impala</td>
    <td>Indie</td>
    <td>Let it happen</td>
  </tr>
  <tr>
    <td>Sex Pistols</td>
    <td>Punk</td>
    <td>EMI</td>
  </tr>
  <tr>
    <td>Megadeth</td>
    <td>Metal</td>
    <td>Trust</td>
  </tr>
</table> 

El elemento `<table>` es el que posee el contenido de la tabla. 

Cada fila de la tabla comienza con un `<tr>` (table row) y termina 
con un `</tr>`.

El elemento `<th>` (table header) define una cabecera, que es opcional. En 
nuestro ejemplo representa una descripcion de cada columna.

Cada celda de la tabla se define con el tag `<td>` (table data).

> Una celda puede contener cualquier tipo de elementos HTML. 

Para aprender mas sobre tablas HTML, dejamos [esta referencia](https://www.w3schools.com/html/html_tables.asp).
