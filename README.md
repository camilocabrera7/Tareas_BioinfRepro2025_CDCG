# Tareas_BioinfRepro2025_CDCG
_________________________________

El siguiente repositorio de mi autoría Camilo Cabrera García, estudiante del curso de postgrado Bioinformática e Investigación para Análisis Reproducibles contiene los ejercicios y tareas de la asignatura.

## **Tarea 2**
---------
1. Realiza los ejercicios indicados en cada sección del tutorial de la Sesión 2 de la Unidad 2.
2. Pon tus resultados en tu repositorio personal en GiHub, siguiendo las instrucciones del tutorial
3. Organiza tu repositorio según los lineamientos del tutorial. Cada avance semanal debe tener su propia página en Markdown donde se indiquen cuáles eran los ejercicios a realizar y los resultados obtenidos.
4. Para los ejercicios que son de la partes sobre Markdown, mostrar capturas de pantalla tanto de el código como del resultado formateado.
5. Las figuras deben tener sus respectivas leyendas explicativas, un número de figura y debe estar citada en el texto.

### **Ejercicios:**
------------ 
1. Abre el editor de Markdown de tu preferencia y escribe un texto en formato Markdown de manera que quede igual que los tres primeros puntos de [Preparing the environment, cleaning the data for Stacks](http://catchenlab.life.illinois.edu/stacks/manual/#procrad) (incluyendo ese subtítulo). No es necesario poner los colores, pero si quieres, cool.
   * El archivo preparado es el **[siguiente](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Preparing%20%20the%20environment.md).** Y se ve así en MarkText: ![PTE formateado](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Preparing%20the%20environment%20formateado.png)
   * Y se ve el código igualmente de la siguiente **[forma](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Preparing%20the%20environment%20codigo.png): ![PTE codigo](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Preparing%20the%20environment%20codigo.png)
    
2. Clona el repositorio de la clase y actualízalo que vez que sea necesario. NOTAS IMPORTANTES PARA ESTE EJERCICIO:
  * Clonalo en un lugar distinto de dónde habías bajado la carpeta del repo las clases anteriores, o cámbiale el nombre a esa carpeta vieja, o símil
  * Como mi repo tiene más de una rama, necesitarás agregar a tu git clone lo siguiente: --branch master --single-branch.
  * Modifica la página de esta sesion en tu copia local, inclyebdo tus datos (nombre y fecha de modificacón).
  * Realiza un comit de tus cambios.
  * Toma un pantallazo de la página modificada (en un editor de Markdown) y del teminar luego de ejecuta $ git status incluye esos pantallazos con respectivas explicaciones de qué muestran en la página de las tadea para la Sesión en tu respositorio personal.
  * La pagina modificada es la **[siguiente](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Pantallazo%20editor%20Markdown%20formateado.png),** se observa así: ![EditMarkDown](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Pantallazo%20editor%20Markdown%20formateado.png)
  * En el caso de la versión de código se ve **[así:](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/P%C3%A4ntallazo%20editor%20Markdown%20codigo.png)** ![EditMarkDownCod](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/P%C3%A4ntallazo%20editor%20Markdown%20codigo.png)
  * Y el pantallazo del commit es **[este:](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Pantallazo%20commit%20changes.png).** ![Commit](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Pantallazo%20commit%20changes.png)
  * Donde se observan los cambios realizados en la copia local del directorio de la pagina y un archivo agregado.

3. Genera un repositorio dentro de tu cuenta de Github que se llame "Tareas_BioinfRepro2025_TusIniciales". Agregame a mi como colaborador en el repositorio de tareas del curso que creaste en tu cuenta de Github. Mi nobre de usaiurio es "ravuch"
  * El repositorio es el que se encuentra leyendo **[actualmente](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/tree/main)**.

4. Mira el siguiente script ([tomado del manual de Stacks](http://catchenlab.life.illinois.edu/stacks/manual/#phand)) y contesta lo siguiente:
```
#!/bin/bash 

src=$HOME/research/project 

files=”sample_01 
sample_02 
sample_03” 

#
# Align with GSnap and convert to BAM
# 
for file in $files
do
    gsnap -t 36 -n 1 -m 5 -i 2 --min-coverage=0.90 \
            -A sam -d gac_gen_broads1_e64 \
            -D ~/research/gsnap/gac_gen_broads1_e64 \
            $src/samples/${file}.fq > $src/aligned/${file}.sam
    samtools view -b -S -o $src/aligned/${file}.bam $src/aligned/${file}.sam 
    rm $src/aligned/${file}.sam 
done

#
# Run Stacks on the gsnap data; the i variable will be our ID for each sample we process.
# 
i=1 
for file in $files 
do 
    pstacks -p 36 -t bam -m 3 -i $i \
              -f $src/aligned/${file}.bam \
              -o $src/stacks/ 
    let "i+=1"; 
done 

# 
# Use a loop to create a list of files to supply to cstacks.
# 
samp="" 
for file in $files 
do 
    samp+="-s $src/stacks/$file "; 
done 

# 
# Build the catalog; the "&>>" will capture all output and append it to the Log file.
# 
cstacks -g -p 36 -b 1 -n 1 -o $src/stacks $samp &>> $src/stacks/Log 

for file in $files 
do 
    sstacks -g -p 36 -b 1 -c $src/stacks/batch_1 \
             -s $src/stacks/${file} \ 
             -o $src/stacks/ &>> $src/stacks/Log 
done 

#
# Calculate population statistics and export several output files.
# 
populations -t 36 -b 1 -P $src/stacks/ -M $src/popmap \
              -p 9 -f p_value -k -r 0.75 -s --structure --phylip --genepop
```
  * ¿Cuántos pasos tiene este script? **Respuesta**: Tiene 5 pasos el script
  * ¿Si quisieras correr este script y que funcionara en tu propio equipo, qué línea deberías cambiar y a qué?
```
src=$HOME/research/project # Es el directorio de trabajo donde corría el script inicialmente
src=/root/BioInfCDCG/proyecto # Directorio de mi computador donde correría el script si quisiera que funcionase en mi equipo
```
  * ¿A qué equivale `$HOME`? **Respuesta**: Se trata de una variable entorno que representa el directorio de inicio del usuario en Unix (Linux)
  * ¿Qué paso del análisis hace el programa `gsnap`? **Respuesta**: GSNAP realiza el alineamiento (mapeo) de las lecturas de secuenciación (archivos .fq) contra un genoma de referencia, produciendo archivos en formato SAM.
  * ¿Qué hace en términos generales cada uno de los loops?
     * *Primer loop*: Para cada muestra, ejecuta GSNAP (alineamiento) y samtools (conversión SAM→BAM)
     * *Segundo loop*: Ejecuta pstacks para cada archivo BAM (detección de loci)
     * *Tercer loop*: Construye parámetros para cstacks concatenando rutas de muestras
     * *Cuarto loop*: Ejecuta sstacks para comparar cada muestra contra el catálogo
    
5. Retoma el ejercicio anterior y divídelo en un subscript para cada paso y un script maestro que corra toda la pipeline.

  * **Subscript 1: Alineamiento con GSnap (1_align_gsnap.sh)**
```
#!/bin/bash
# Alineamiento con GSnap y conversión a BAM

src=/root/BioInfCDCG/proyecto

files="sample_01
sample_02
sample_03"

for file in $files
do
    gsnap -t 36 -n 1 -m 5 -i 2 --min-coverage=0.90 \
            -A sam -d gac_gen_broads1_e64 \
            -D ~/research/gsnap/gac_gen_broads1_e64 \
            $src/samples/${file}.fq > $src/aligned/${file}.sam
    samtools view -b -S -o $src/aligned/${file}.bam $src/aligned/${file}.sam 
    rm $src/aligned/${file}.sam 
done
```
  * **Subscript 2: Ejecutar pstacks (2_run_pstacks.sh)**
```
#!/bin/bash
# Ejecutar pstacks en todas las muestras

src=/root/BioInfCDCG/proyecto

files="sample_01
sample_02
sample_03"

i=1 
for file in $files 
do 
    pstacks -p 36 -t bam -m 3 -i $i \
              -f $src/aligned/${file}.bam \
              -o $src/stacks/ 
    let "i+=1"; 
done
```
  * **Subscript 3: Construir lista con cstacks (3_run_cstacks.sh)**
```
#!/bin/bash
# Construir catálogo con cstacks

src=/root/BioInfCDCG/proyecto

files="sample_01
sample_02
sample_03"

samp="" 
for file in $files 
do 
    samp+="-s $src/stacks/$file "; 
done 

cstacks -g -p 36 -b 1 -n 1 -o $src/stacks $samp &>> $src/stacks/Log
```
  * **Subscript 4: Ejecutar sstacks (4_run_sstacks.sh)**
```
#!/bin/bash
# Ejecutar sstacks en todas las muestras

src=/root/BioInfCDCG/proyecto

files="sample_01
sample_02
sample_03"

for file in $files 
do 
    sstacks -g -p 36 -b 1 -c $src/stacks/batch_1 \
             -s $src/stacks/${file} \
             -o $src/stacks/ &>> $src/stacks/Log 
done
```
  * **Subscript 5: Ejecutar populations (5_run_populations.sh)**
```
#!/bin/bash
# Calcular estadísticas poblacionales

src=/root/BioInfCDCG/proyecto

populations -t 36 -b 1 -P $src/stacks/ -M $src/popmap \
              -p 9 -f p_value -k -r 0.75 -s --structure --phylip --genepop
```

  * **Script Maestro**
```
#!/bin/bash

# Script maestro que ejecuta el pipeline completo
src=/root/BioInfCDCG/proyecto

# Paso 1: Alineamiento con GSnap
echo "Ejecutando paso de alineamiento..."
./1_align_gsnap.sh

# Paso 2: Ejecutar pstacks
echo "Ejecutando pstacks..."
./2_run_pstacks.sh

# Paso 3: Construir catálogo con cstacks
echo "Ejecutando cstacks..."
./3_run_cstacks.sh

# Paso 4: Ejecutar sstacks
echo "Ejecutando sstacks..."
./4_run_sstacks.sh

# Paso 5: Calcular estadísticas poblacionales
echo "Ejecutando populations..."
./5_run_populations.sh

echo "Pipeline completado exitosamente"
```
