# Compiladores

El proyecto consiste en un analizador lexico, el cual tiene como funcion identificar tokens y errores en los caracteres que nos se encuentren identificados en un archivo flex. El proyecto esta bastante automatizado todas las rutas y direcciones se buscan por medio de un boton el cual despliega todos los directorios, esto hace que el proyecto sea facil de utilizar. Cuando se presiona el boton "analizar" este verifica los archivos leidos y primero llama una funcion en donde se compila el lexer donde estan definidos todos los tokens y luego empezara a analizar el archivo encontrando todos los tokens definidos. El lexer tiene definidos palabras reservadas, simbolos, constantes, identificadores y se hicieron pruebas con una buena cantidad de ejemplos, los comentarios funcionana bien y desplega error cuando este no se cierra, ademas de truncar los identificadores que sobrepasan los 31 caracteres. Cuando se termina de analizar el archivo esta genera un archivo de salido con todos los tokens y errores mostrando la fila, columna y el token.