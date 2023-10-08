#!/bin/bash

# Función para preguntar al usuario si desea modificar valores
function modificarValores() {
    read -p "¿Deseas modificar los valores CSS, HTML, clases y IDs? (S/N): " respuesta
    if [ "$respuesta" == "S" ] || [ "$respuesta" == "s" ]; then
        # Solicitar nuevos valores
        read -p "Nueva fuente para el cuerpo (por ejemplo, 'Arial, sans-serif'): " body_font
        read -p "Nuevo color de borde (por ejemplo, 'red'): " border_color
        read -p "Nuevo color de fondo para el encabezado (por ejemplo, 'lightblue'): " header_background_color
        read -p "Nuevo color de enlaces (por ejemplo, 'green'): " link_color
        read -p "Nuevo tamaño de fuente para el encabezado (por ejemplo, '28px'): " header_font_size
        read -p "Nuevo relleno para la navegación (por ejemplo, '16px'): " nav_padding
        read -p "Nuevo margen para las secciones (por ejemplo, '20px'): " section_margin
        read -p "Nueva altura de línea para los títulos de artículo (por ejemplo, '1.6'): " article_line_height
        read -p "Nuevo color de fondo para el pie de página (por ejemplo, 'lightgray'): " footer_background_color
        read -p "Nuevo valor para la clase del encabezado (por ejemplo, 'miClaseHeader'): " claseheader
        read -p "Nuevo valor para el ID del encabezado (por ejemplo, 'miIDHeader'): " idheader
        read -p "Nuevo valor para el ID del botón (por ejemplo, 'miIDBoton'): " idboton
        read -p "Nuevo valor para el ID del primer número (por ejemplo, 'miIDNumero1'): " idnumero1
        read -p "Nuevo valor para el ID del segundo número (por ejemplo, 'miIDNumero2'): " idnumero2
        echo "Valores modificados con éxito."
    else
        echo "Valores no modificados."
    fi
}

# Llamar a la función para preguntar si se deben modificar los valores
modificarValores

# Variables para estilos CSS
body_font=${body_font:-"Verdana, Geneva, Tahoma, sans-serif"}
border_color=${border_color:-"gray"}
header_background_color=${header_background_color:-"lightgray"}
link_color=${link_color:-"blue"}
header_font_size=${header_font_size:-"24px"}
nav_padding=${nav_padding:-"12px"}
section_margin=${section_margin:-"10px"}
article_line_height=${article_line_height:-"1.5"}
footer_background_color=${footer_background_color:-"lightblue"}
button_background_color=${button_background_color:-"lightgreen"}
button_text_color=${button_text_color:-"white"}

# Variables para etiquetas HTML
header_text="Mi web/blog para trastear con el DOM"
nav_links=("LINK 1" "LINK 2" "LINK 3")
section_title="Titulo de la seccion"
article_title="Titulo del articulo h3"
article_content="Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor assumenda expedita tenetur omnis maiores reiciendis nulla quia, ad obcaecati, ea delectus eum aliquam vero aperiam nisi, sapiente itaque corporis exercitationem."
footer_text="2022 Desarrollo útil"

# Variables para etiquetas class e IDs
claseheader=${claseheader:-"claseheader"}
idheader=${idheader:-"idheader"}
idboton=${idboton:-"idboton"}
idnumero1=${idnumero1:-"idnumero1"}
idnumero2=${idnumero2:-"idnumero2"}

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

        #main button {
            background-color: $button_background_color;
            color: $button_text_color;
        }
    </style>

    <script src="$js_file" defer></script>

    <title>Dom</title>
</head>
<body>
    <header id="$idheader" class="$claseheader" name="cabecera">
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
    <button id="$idboton">Haz clic aquí</button>
</body>
</html>
EOF
)

# Crear el archivo HTML
echo "$html_content" > "$output_file"

echo "Archivo HTML generado: $output_file"


# El script proporcionado es un script de Bash que genera un archivo HTML con estilos CSS y contenido HTML predefinido. Explicaré los pasos y las funciones del script a continuación:
# La función modificarValores se utiliza para solicitar al usuario si desea modificar los valores de los estilos CSS, las clases y los IDs. Si el usuario responde "S" o "s", se le solicitarán los nuevos valores y se almacenarán en variables.
# Después de llamar a la función modificarValores, se definen las variables para los estilos CSS y las etiquetas HTML con valores predeterminados. Estos valores pueden ser modificados por el usuario si así lo desea.
# A continuación, se define el nombre del archivo de salida HTML en la variable output_file y el nombre del archivo JavaScript en la variable js_file.
# El contenido HTML se genera utilizando una cadena de texto con formato de aquí-documento y se almacena en la variable html_content. Los estilos CSS y las etiquetas HTML se concatenan a esta variable para formar el contenido completo del archivo HTML.
# Se utiliza el comando echo para escribir el contenido HTML en el archivo de salida especificado en la variable output_file.
# Por último, se muestra un mensaje en la consola indicando que el archivo HTML ha sido generado correctamente.
# Para utilizar este script, simplemente ejecuta el archivo Bash en un terminal y sigue las instrucciones para modificar los valores CSS, las clases y los IDs si así lo deseas. El archivo HTML resultante se guardará en el directorio actual con el nombre especificado en la variable output_file.