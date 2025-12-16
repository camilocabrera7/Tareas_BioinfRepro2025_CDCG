# Tarea Unidad 4 - Sesion 1

**Camilo Cabrera 09.12.2025**

---------------------------------

1. Obtener la matriz completa de datos, disponible en el archivo Illum_data.txt. Asegúrese tarmbién usar el archivo de anotaciones MouseRef-8_annot_full.txt que contiene todas las 25697 sondas. Ambos archivos están disponibles en la carpeta del tutorial.
2. Importar la matriz en R, seleccionar aleatoriamente 5000 filas y exportar el subset de datos en un archivo plano separado por tabulaciones.
3. Ejecute este tutorial, pero con algunos cambios:
usando su matriz de datos en vez de la usada en la demostración.
  * En vez de considerar un transcrito presente si la sonda lo detectó en el 50% de las muestras de cualquier grupo experimental, hágalo cuando se detectó en al menos el 25% de las muestras de todos grupos experimentales.
  * En vez de usar 200 permutaciones, use 500.
  * En vez de usar un FDR 0.2, use uno de 0.19.
  * En vez de seleccionar un gen si cualquier sonda asociada al gen está seleccionada, hágalo solo cuando todas las sondas lo están.
4. Genere un reporte usando Markdown o Rmarkdown si usa Rstudio.
5. En este documento se explica cada comando del tutorial pero esto no es necesario en su reporte. Éste, debe estar enfocado al análisis de los datos. Muestre los comandos más importantes y enfóquese en los resultados y en su interpretación correcta.
