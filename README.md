# Bash Shell Test
Construir un aplicativo shell que despliegue un menú con varias opciones, así:

## Menú Principal
1. Copiar/Mover archivos
2. Reporte archivo
3. Buscar una palabra en archivos
4. Salir

El menú siempre estará activo, es decir, el programa no terminará hasta que el usuario seleccione la
opción de 4. Salir (y luego confirme que desea salir). Esto significa que si el usuario elige otra opción,
después de que acabe lo que sea en esa otra opción, debe regresar al menú principal.

## Opciones
### Opción 1: Copiar/Mover archivos
El programa preguntará (leerá) si desea Copiar o Mover, y luego solicitará (leerá) el origen (ruta y
archivo) y el destino (ruta y archivo).

### Opción 2: Reporte archivo
El programa preguntará (leerá) el archivo (incluyendo ruta). Validará si existe o no (en cuyo caso
desplegará el error), pero si existe, entonces hará un reporte de varias características propias del archivo
como: nombre, ruta, tamaño (bytes), permisos (Ej: drwxr-xr-x), fechas del archivo, cantidad de líneas y
cantidad de palabras.

### Opción 3: Buscar una palabra en archivos
El programa capturará (leerá) la palabra a buscar y la ruta base a partir de la cual buscará de forma
recursiva, y guardará en un archivo el resultado de la búsqueda. El archivo tendrá el nombre
results_YYYYMMDD_HH24MISS.txt, donde YYYYMMDD corresponde a la fecha del sistema y
HH24MISS corresponde a la hora formato 24 (con minutos y segundos) del sistema, al momento de
ejecutar la búsqueda.

### Opción 4: Salir
El programa preguntará si el usuario desea salir (Y/N), capturará (leerá) la respuesta del usuario, si
decide salir, el programa termina. Si no decide salir, el programa regresa al menú principal.

### IMPORTANTE:
Al ejecutar este aplicativo (con bash) se recibirá un parámetro que indica el idioma del
menú, opciones y mensajes así: (EN para inglés, ES para español, cualquier otro valor para inglés).