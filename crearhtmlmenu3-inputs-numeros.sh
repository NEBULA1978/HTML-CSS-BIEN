#!/bin/bash

# Función para preguntar al usuario si desea modificar valores
function modificarValores() {
    read -p "¿Deseas modificar los valores CSS y HTML? (S/N): " respuesta
    if [ "$respuesta" == "S" ] || [ "$respuesta" == "s" ]; then
        mostrarOpciones
        while true; do
            read -p "Selecciona el número de la opción que deseas modificar (0 para finalizar): " opcion
            if [ "$opcion" -eq 0 ]; then
                break
            elif [ "$opcion" -eq 1 ]; then
                read -p "Nueva fuente para el cuerpo (por ejemplo, 'Arial, sans-serif'): " body_font
            elif [ "$opcion" -eq 2 ]; then
                read -p "Nuevo color de borde (por ejemplo, 'red'): " border_color
            elif [ "$opcion" -eq 3 ]; then
                read -p "Nuevo color de fondo para el encabezado (por ejemplo, 'lightblue'): " header_background_color
            elif [ "$opcion" -eq 4 ]; then
                read -p "Nuevo color de enlaces (por ejemplo, 'green'): " link_color
            elif [ "$opcion" -eq 5 ]; then
                read -p "Nuevo tamaño de fuente para el encabezado (por ejemplo, '28px'): " header_font_size
            elif [ "$opcion" -eq 6 ]; then
                read -p "Nuevo relleno para la navegación (por ejemplo, '16px'): " nav_padding
            elif [ "$opcion" -eq 7 ]; then
                read -p "Nuevo margen para las secciones (por ejemplo, '20px'): " section_margin
            elif [ "$opcion" -eq 8 ]; then
                read -p "Nueva altura de línea para los títulos de artículo (por ejemplo, '1.6'): " article_line_height
            elif [ "$opcion" -eq 9 ]; then
                read -p "Nuevo color de fondo para el pie de página (por ejemplo, 'lightgray'): " footer_background_color
            fi
        done
        echo "Valores modificados con éxito."
    else
        echo "Valores no modificados."
    fi
}

# Función para mostrar las opciones disponibles
function mostrarOpciones() {
    echo "Opciones disponibles:"
    echo "1. Nueva fuente para el cuerpo"
    echo "2. Nuevo color de borde"
    echo "3. Nuevo color de fondo para el encabezado"
    echo "4. Nuevo color de enlaces"
    echo "5. Nuevo tamaño de fuente para el encabezado"
    echo "6. Nuevo relleno para la navegación"
    echo "7. Nuevo margen para las secciones"
    echo "8. Nueva altura de línea para los títulos de artículo"
    echo "9. Nuevo color de fondo para el pie de página"
    echo "0. Finalizar y aplicar cambios"
}

# Llamar a la función para preguntar si se deben modificar los valores
modificarValores

# Resto del script...
# Variables para etiquetas HTML
header_text="Mi web/blog para trastear con el DOM"
nav_links=("LINK 1" "LINK 2" "LINK 3")
section_title="Titulo de la seccion"
article_title="Titulo del articulo h3"
article_content="Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor assumenda expedita tenetur omnis maiores reiciendis nulla quia, ad obcaecati, ea delectus eum aliquam vero aperiam nisi, sapiente itaque corporis exercitationem."
footer_text="2022 Desarrollo útil"

# Variables para etiquetas class
claseheader="claseheader"

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
    <header id="header" class="$claseheader" name="cabecera">
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
