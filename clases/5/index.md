---
title: Clase 5 - Desarrollo web
description-meta: Clase 5
author-meta: Desarrollo web
---

# 1. Formularios 

El elemento HTML `<form>` se utiliza para tomar entradas (inputs) de usuario, para 
luego ser procesadas por un servidor.

> HTML tiene muchas posibilidades de interaccion con el navegador sin necesidad 
de utilizar JavaScript. Muchas veces es mejor realizar la maxima interaccion 
solo con HTML y emplear JavaScript cuando sea indispensable.

Los atributos HTML pueden definir criterios especificos a cumplir sobre los 
datos ingresados. Cuando un usuario trata de enviar (submit) el formulario, todos 
sus datos pasaran por una validacion del lado del cliente y evitaran que se 
envien datos que no cumplan con dichos criterios; todo sin utilizar JavaScript.

Un ejemplo sencillo es un formulario de Login. Donde los usuarios escriben 
su email y su contraseña. 

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="MWZKbRr" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/MWZKbRr">
  Untitled</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Por defecto, al enviar un formulario se realiza una solicitud HTTP de tipo `POST` a 
la URL actual. El metodo puede modificarse utilizando el atributo `method`. Por ejemplo, 
podemos realizar un `GET` en lugar de un `POST`.
Tambien se puede cambiar la URL utilizando el atributo `action`.

## 1.1 Inputs

El elemento `<input>` es el elemento mas utilizado dentro del elemento form.
Un `<input>` puede mostrarse de varias formas, dependiendo de su atributo `type`.

Algunos ejemplos son:

| Type | Descripcion |
|---|---|
| &lt;input type="text"&gt; 	| Entrada de texto de una unica linea |
| &lt;input type="email"&gt; 	| Entrada de texto de una unica linea para emails (valida que el dato tenga formato de email) |
| &lt;input type="radio"&gt; 	| Radio button (permite seleccionar una de varias opciones) |
| &lt;input type="checkbox"&gt; | Checkbox (permite seleccionar cero o mas de varias opciones) |
| &lt;input type="submit"&gt; | Boton de submit (para enviar formularios) |
| &lt;input type="button"&gt; | Boton (un boton comun) |

Para ver mas, recomendamos esta [referencia de todos los tipos de inputs](https://www.w3schools.com/html/html_form_input_types.asp#).

## 1.2 Select

El elemento `<select>` sirve para seleccionar un valor de una lista. 
Si es utilizado dentro de un form, funciona como un input. 

```html
<label for="cars">Choose a car:</label>
<select name="cars" id="cars">
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="mercedes">Mercedes</option>
  <option value="audi">Audi</option>
</select>
```

El tag `<label>` sirve para agregar una descripcion a un input, el atributo 
`for` especifica a que elemento esta describiendo, referenciandolo por `id` (al 
presionar el texto del `<label>` se nos pondra el cursor en el input referenciado)

El atributo `name` se necesita para referenciar a los datos del formulario. En el 
ejemplo, hacer un submit con el `value=audi` seleccionado resultara en 
`cars=audi`.

## 1.3 Submit 

Los formularios son enviados una vez que el usuario activa el boton de 
submit que se encuentra dentro del elemento `<form>`. Este boton se representa 
de la siguiente forma: 

```html
<input type="submit" value="Submit Form">
<button type="submit">Submit Form</button>
```

## 1.4 Validacion

HTML tiene validacion integrada sin necesidad de usar JavaScript.

Algunos ejemplos de validacion con HTML son los atributos:

`required`: especifica que un campo debe ser completado obligatoriamente.

`min`: especifica una cantidad minima para `input` con `type="number"`

`max`: especifica una cantidad minima para `input` con `type="number"`

`minlength`: especifica una longitud minima de caracteres para un `input` de texto.

`maxlength`: especifica una longitud maxima de caracteres para un `input` de texto.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="html,result" data-slug-hash="PoXZWWW" data-editable="true" data-user="Ignacio-Martin-Citate-G-mez" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/Ignacio-Martin-Citate-G-mez/pen/PoXZWWW">
  Ejemplo form validation</a> by Ignacio Martin Citate Gómez (<a href="https://codepen.io/Ignacio-Martin-Citate-G-mez">@Ignacio-Martin-Citate-G-mez</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>
