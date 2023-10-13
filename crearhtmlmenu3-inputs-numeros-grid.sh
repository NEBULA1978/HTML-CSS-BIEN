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
                read -p "Display (grid, inline-grid, subgrid): " display
            elif [ "$opcion" -eq 2 ]; then
                read -p "Grid Template Columns (ejemplo: '12px 12px 12px'): " grid_template_columns
            elif [ "$opcion" -eq 3 ]; then
                read -p "Grid Template Rows (ejemplo: '12px 12px 12px'): " grid_template_rows
            elif [ "$opcion" -eq 4 ]; then
                read -p "Grid Gap (ejemplo: '1px 9px'): " grid_gap
            elif [ "$opcion" -eq 5 ]; then
                read -p "Justify Items (start, end, center, stretch): " justify_items
            elif [ "$opcion" -eq 6 ]; then
                read -p "Align Items (start, end, center, stretch): " align_items
            elif [ "$opcion" -eq 7 ]; then
                read -p "Justify Content (start, end, center, stretch, space-around, space-between, space-evenly): " justify_content
            elif [ "$opcion" -eq 8 ]; then
                read -p "Align Content (start, end, center, stretch, space-around, space-between, space-evenly): " align_content
            elif [ "$opcion" -eq 9 ]; then
                read -p "Grid Auto Flow (row, column, dense): " grid_auto_flow
            elif [ "$opcion" -eq 10 ]; then
                read -p "Grid Column (ejemplo: '2 / span 2'): " grid_column
            elif [ "$opcion" -eq 11 ]; then
                read -p "Grid Row (ejemplo: '1 / span 3'): " grid_row
            elif [ "$opcion" -eq 12 ]; then
                read -p "Justify Self (start, end, center, stretch): " justify_self
            elif [ "$opcion" -eq 13 ]; then
                read -p "Align Self (start, end, center, stretch): " align_self
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
    echo "1. Display (grid, inline-grid, subgrid)"
    echo "2. Grid Template Columns (ejemplo: '12px 12px 12px')"
    echo "3. Grid Template Rows (ejemplo: '12px 12px 12px')"
    echo "4. Grid Gap (ejemplo: '1px 9px')"
    echo "5. Justify Items (start, end, center, stretch)"
    echo "6. Align Items (start, end, center, stretch)"
    echo "7. Justify Content (start, end, center, stretch, space-around, space-between, space-evenly)"
    echo "8. Align Content (start, end, center, stretch, space-around, space-between, space-evenly)"
    echo "9. Grid Auto Flow (row, column, dense)"
    echo "10. Grid Column (ejemplo: '2 / span 2')"
    echo "11. Grid Row (ejemplo: '1 / span 3')"
    echo "12. Justify Self (start, end, center, stretch)"
    echo "13. Align Self (start, end, center, stretch)"
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

# Variables CSS
display="grid"
grid_template_columns="1fr 1fr 1fr"
grid_template_rows="1fr 1fr 1fr"
grid_gap="10px"
justify_items="center"
align_items="center"
justify_content="center"
align_content="center"
grid_auto_flow="row"
grid_column="1 / span 2"
grid_row="1 / span 3"
justify_self="center"
align_self="center"

# Variables CSS para fuentes
body_font="Arial, sans-serif"
header_font_size="28px"
nav_padding="16px"
section_margin="20px"
article_line_height="1.6"
footer_background_color="lightgray"
border_color="red"
link_color="green"

# Contenido del archivo HTML
html_content=$(cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE,edge">
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
            display: $display; /* Agregamos el valor de display aquí */
            grid-template-columns: $grid_template_columns; /* Agregamos el valor de grid-template-columns aquí */
            grid-template-rows: $grid_template_rows; /* Agregamos el valor de grid-template-rows aquí */
            grid-gap: $grid_gap; /* Agregamos el valor de grid-gap aquí */
            justify-items: $justify_items; /* Agregamos el valor de justify-items aquí */
            align-items: $align_items; /* Agregamos el valor de align-items aquí */
            justify-content: $justify_content; /* Agregamos el valor de justify-content aquí */
            align-content: $align_content; /* Agregamos el valor de align-content aquí */
            grid-auto-flow: $grid_auto_flow; /* Agregamos el valor de grid-auto-flow aquí */
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

# Agregar los enlaces de navegación
for link_text in "${nav_links[@]}"; do
    html_content+="            <li><a href=\"#\">$link_text</a></li"$'\n'
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

echo "$html_content" > "$output_file"

echo "Archivo HTML generado: $output_file"