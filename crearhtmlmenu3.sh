#!/bin/bash

# Variables para estilos CSS
body_font="Verdana, Geneva, Tahoma, sans-serif"
border_color="gray"
header_background_color="lightgray"
link_color="blue"
header_font_size="24px"
nav_padding="12px"
section_margin="10px"
article_line_height="1.5"
footer_background_color="lightblue"

# Variables para etiquetas HTML
header_text="Mi web/blog para trastear con el DOM"
nav_links=("LINK 1" "LINK 2" "LINK 3")
section_title="Titulo de la seccion"
article_title="Titulo del articulo h3"
article_content="Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor assumenda expedita tenetur omnis maiores reiciendis nulla quia, ad obcaecati, ea delectus eum aliquam vero aperiam nisi, sapiente itaque corporis exercitationem."
footer_text="2022 Desarrollo útil"

# Nombre del archivo HTML de salida
output_file="mi_pagina.html"

# Nombre del archivo JavaScript
js_file="ejemplo.js"

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
            font-family: "$body_font";
        }

        header {
            background-color: $header_background_color;
            font-size: $header_font_size;
        }

        header,
        nav,
        section,
        article,
        footer {
            border: 1px solid $border_color;
            margin: $section_margin;
            padding: $nav_padding;
        }

        .border-grey {
            border: 1px solid $border_color;
        }

        nav ul {
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline;
        }

        nav a {
            color: $link_color;
        }

        h1,
        h2,
        h3 {
            margin-left: 5px;
        }

        article h3 {
            line-height: $article_line_height;
        }

        footer {
            background-color: $footer_background_color;
        }
    </style>

    <script src="$js_file" defer></script>

    <title>Dom</title>
</head>
<body>
    <header id="header" class="border-grey" name="cabecera">
        <h1>$header_text</h1>
    </header>
    <nav class="border-grey">
        <ul>
EOF
)

# Agregar los enlaces de navegación
for link_text in "${nav_links[@]}"; do
    html_content+="            <li><a href=\"#\">$link_text</a></li>"$'\n'
done

# Continuar con el contenido HTML
html_content+=$(cat <<EOF
        </ul>
    </nav>

    <main id="main">
        <!-- beforebegin -->
        <section id="section" class="border-grey" nombre="meloinvento">
            <!-- afterbegin -->
            <h2>$section_title</h2>
            <article class="border-grey">
                <h3>$article_title</h3>
                <p>$article_content</p>
            </article>
            <!-- beforeend -->
        </section>
        <!-- afterend -->
    </main>
    <footer class="border-grey">
        <p>$footer_text</p>
    </footer>
</body>
</html>
EOF
)

# Crear el archivo HTML
echo "$html_content" > "$output_file"

echo "Archivo HTML generado: $output_file"
