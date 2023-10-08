#!/bin/bash

# Archivo para almacenar las preguntas
archivo_preguntas="preguntas.txt"

while true; do
    # Mostrar las preguntas anteriores
    if [ -e "$archivo_preguntas" ]; then
        echo "Preguntas anteriores:"
        cat "$archivo_preguntas"
        echo "------------------------"
    fi

    # Leer una nueva pregunta
    read -p "Haz una pregunta o escribe 'salir' para terminar: " pregunta

    # Salir del bucle si se ingresa "salir"
    if [ "$pregunta" == "salir" ]; then
        break
    fi

    # Guardar la pregunta en el archivo
    echo "$pregunta" >> "$archivo_preguntas"

    # Responder a la pregunta (puedes personalizar esta parte)
    echo "Respondiendo a la pregunta: '$pregunta'"
done

echo "Adiós"
