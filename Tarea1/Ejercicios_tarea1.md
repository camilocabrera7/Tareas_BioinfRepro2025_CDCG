# Tarea Unidad 1 -Sesión 1
Camilo Cabrera Garcia 25.08.2025
--------------------------------
Realizar los ejercicios que figuran al final del tutorial de la Sesión 1 de la Unidad 1:
  * Escribe una línea de código que cree un archivo con los nombres de las muestras de maiz enlistadas en `/Unidad1/Sesion1/Prac_Uni1/Maiz/nuevos_final.fam`.
  * Escribe un script que cree 4 directorios llamados `PobA`, `PobB`, `PobC`, `PobD` y dentro de cada uno de ellos un archivo de texto que diga *"Este es un individuo de la población x"* donde `x` debe corresponder al nombre del directorio.
  * Escribe un script que baje 5 secuencias (algún loci corto, no un genoma) de una especie que te interese y señala cuántas veces existe la secuencia "TGCA" en cada una de ellas. ¿Sabes qué hace esta secuencia?

## **Ejercicio 1:**
Escribe una línea de código que cree un archivo con los nombres de las muestras de maiz enlistadas en /Unidad1/Sesion1/Prac_Uni1/Maiz/nuevos_final.fam.
* Se descargo el archivo `nuevos_final.fam` desde GitHub y luego se extrajo la segunda columna  con los nombres de las muestras.
  * Script usado:
``` cut -d ' ' -f 2 nuevos_final.fam > nombres_maiztarea.txt ```

## **Ejercicio 2:**
Escribe un script que cree 4 directorios llamados PobA, PobB, PobC, PobD y dentro de cada uno de ellos un archivo de texto que diga "Este es un individuo de la población x" donde x debe corresponder al nombre del directorio.
* Se crearon 4 directorios (PobA, PobB, PobC, PobD) con un archivo `info.txt` en cada uno donde cada info.txt contiene:
"Este es un individuo de la población PobX (siendo X endo X el poblado al cual corresponde respectivamente)"
  * Script usado:
```
for poblacion in PobA PobB PobC PobD; do
mkdir -p "$poblacion"
echo "Este es un individuo de la población $poblacion" > "$poblacion/info.txt"
done
```

## **Ejercicio 3:**
Escribe un script que baje 5 secuencias (algún loci corto, no un genoma) de una especie que te interese y señala cuántas veces existe la secuencia "TGCA" en cada una de ellas. ¿Sabes qué hace esta secuencia?**
* Se descargaron 5 secuencias de NCBI y se contó la ocurrencia del motivo TGCA.
  * Secuencias utilizadas:
    * NR_170111.1
    * DQ977395.1
    * KR712214.1
    * DQ976824.1
    * NM_001083451.2

* Archivo generado: `conteo_TGCA.txt` con el siguiente contenido:
  
  * NR_170111.1: 27 ocurrencia(s) de TGCA
  * DQ977395.1: 14 ocurrencia(s) de TGCA
  * KR712214.1: 19 ocurrencia(s) de TGCA
  * DQ976824.1: 22 ocurrencia(s) de TGCA
  * NM_001083451.2: 11 ocurrencia(s) de TGCA
    
 * Script usado:
```
for id in "${ids[@]}"; do
echo "Descargando $id ..."
wget -q -O "$id.fasta"   
"https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=${id}&rettype=fasta"
seq=$(grep -v ">" "$id.fasta" | tr -d '\n' | tr 'a-z' 'A-Z')
count=$(echo "$seq" | grep -o "TGCA" | wc -l)
echo "$id: $count ocurrencia(s) de TGCA" >> ../conteo_TGCA.txt
done
```
* La secuencia TGCA es parte de el sitio de reconocimiento de enzimas de restriccion.
