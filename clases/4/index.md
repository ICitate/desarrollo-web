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
Messi
