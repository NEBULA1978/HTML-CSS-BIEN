#!/bin/bash

# Nombre del archivo HTML de salida
output_file="mi_pagina.html"

# Contenido del archivo HTML
html_content=$(cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }

        header,
        nav,
        section,
        article,
        footer {
            border: 1px solid gray;
            margin: 5px;
            padding: 8px;
        }

        .border-grey {
            border: 1px solid gray;
        }

        nav ul {
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline;
        }

        h1,
        h2,
        h3 {
            margin-left: 5px;
        }
    </style>

    <!-- <script defer src="ejemplo.js"></script> -->
    <!-- <script src="ejemplo.js" async></script> -->
    <script src="ejemplo.js" defer></script>

    <title>Dom</title>
</head>
<body>
    <header id="header" class="border-grey" name="cabecera">
        <h1>Mi web/blog para trastear con el DOM</h1>
    </header>
    <nav class="border-grey">
        <ul>
            <li><a href="#">LINK 1</a></li>
            <li><a href="#">LINK 2</a></li>
            <li><a href="#">LINK 3</a></li>
        </ul>
    </nav>

    <main id="main">
        <!-- beforebegin -->
        <section id="section" class="border-grey" nombre="meloinvento">
            <!-- afterbegin -->
            <h2>Titulo de la seccion</h2>
            <article class="border-grey">
                <h3>Titulo del articulo h3</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor assumenda expedita tenetur omnis maiores reiciendis nulla quia, ad obcaecati, ea delectus eum aliquam vero aperiam nisi, sapiente itaque corporis exercitationem.</p>
            </article>
            <!-- beforeend -->
        </section>
        <!-- afterend -->
    </main>
    <footer class="border-grey">
        <p>2022 Desarrollo útil</p>
    </footer>
</body>
</html>
EOF
)

# Crear el archivo HTML
echo "$html_content" > "$output_file"

echo "Archivo HTML generado: $output_file"
