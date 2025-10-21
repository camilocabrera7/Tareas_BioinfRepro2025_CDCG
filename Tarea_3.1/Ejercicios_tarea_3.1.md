# Tarea Unidad 3 -Sesión 1
**Camilo Cabrera** 
**20.10.2025**
-----------------------
Realizar las siguientes tareas tanto para las secuencias crudas y podadas. Además de generar los informes de calidades deben realizar una comparación de los 
resultados. Recuerden que la ubicación de las secuencias crudas 
es en el directorio: 181004_curso_calidad_datos_NGS/fastq_raw/ y las secuencias ya podadas se encuentran en 181004_curso_calidad_datos_NGS/fastq_filter

#### 1. Usando comandos Unix:
   
   * Contar el número de lecturas (reads) en un archivo fastq
   * Previsualizar las primeras 40 líneas del mismo archivo fastq
   * Ubicar la lectura 3 e identificar la información disponible. Describir en detalle la información entregada. ¿Donde se entrega la calidad del read?, ¿Cuál es el ID (identificador) del read? Etc. Utilice fechas y etiquetas para identificar cada parte.
   * Traducir el código de calidad para las primeras 10 bases del tercer read a valores numéricos (Q) usando la codificación entregada en clase.



#### 2. Genere un informe de calidad con FastQC para una muestra (cada estudiante una muestra distinta), para R1 y R2.



#### 3. Baje los archivos HTML a su computados mediante sftp (puede usar cualquier cliente o la línea de comandos. Por ejemplo, ejecutando desde su computador local:
   `scp  bioinfo1@genoma.med.uchile.cl:ricardo/S3_R1_fastqc* .  `
   
   Nota: el punto al final es importante, porque dice que los archivos deben copiarse en el directorio actual (en el computador local).
   Nota 2: el asterisco significa cualquier caracter(es) y permite hacer match con múltiples archivos.



#### 4. Analice el informe de calidad creado con fastqc para las lecturas R1 y R2.



#### 5. Compare los valores calculados en el punto 1 con lo entregado en el informe de calidad obtenido con FastQC



#### 6. Seleccione las 4 figuras más importantes a su criterio para analizar la calidad de la corrida, cópielas a un archivo Markdown en su repositorio y agregue su interpretación de cada figura.
   Recuerde hacer la comparación de R1 y R2 para las secuencias crudas y las secuencias podadas.
