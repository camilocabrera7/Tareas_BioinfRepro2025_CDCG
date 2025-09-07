# **Tarea 3 Unidad 1 -Sesion 3**
**Camilo Cabrera García**
**07.09.2025**
-------------------
Revisar el tutorial de la Sesión 3 de la Unidad y resolver sus ejercicios. Poner todo en un Markdown específico para esta tarea en sus repositorios. Recuerden que la página de inicio de sus repositorios debe tener un README, describiendo el repositorio, y que este debe tener links a las tareas de cada semana. Organizar el material de cada semana en su propia carpeta, tal como está organizado el repositorio del curso.

## **Ejercicio 1:**

Crea una variable con el logaritmo base 10 de 50 y súmalo a otra variable cuyo valor sea igual a 5.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 1](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/log50.png)*
```
r

var_log <- log10(50)
var_suma <- var_log + 5
var_suma
```
![Fig1](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/log50.png)

  * *Figura 1: Creación de variable de logaritmo base 10 en 50 sumado a 5 en consola de R.*

## **Ejercicio 2:**

Suma el número 2 a todos los números entre 1 y 150.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 2](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/suma1a150.png)*
```
r

suma <- 1:150 + 2
suma
```
![Fig2](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/suma1a150.png)

  * *Figura 2: Creación de variables para la suma de 2 con todos los numeros entre 1 y 150 en consola de R.*

## **Ejercicio 3:** 

¿Cuántos números son mayores a 20 en el vector -13432:234?
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 3](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/conteo_mayor_a_20.png)*
```
r

vect <- -13432:234
conteo <- sum(vect>20)
conteo
```
![Fig3](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/conteo_mayor_a_20.png)

  * *Figura 3: Creación de variables para la determinación de numeros mayores a 20 entre -13432:234 en consola de R.*

## **Ejercicio 4:** 

Carga en R el archivo `PracUni1Ses3/maices/meta/maizteocintle_SNP50k_meta_extended.txt` y ponlo en un objeto de R llamado `meta_maiz`.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 4](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/resultado_archivo_r.png)*
```
r

meta_maiz <- read.delim(C:/Users/DREAMFYRE 5/Documents/maizteocintle_SNP50k_meta_extended.txt)
```
![Fig4](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/resultado_archivo_r.png)

  * *Figura 4: Carga de archivo del practico y creación de objeto R llamado meta_maiz en consola de R.*

## **Ejercicio 5:**

Escribe un for loop para que divida 35 entre 1:10 e imprima el resultado en la consola.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 5](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/loop1.png)*
```
r

for(i in 1:10){
  print(35 / i)
}
```
![Fig5](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/loop1.png)

  * *Figura 5: Creación de loop que divida 35 entre secuencia de números del 1 al 10 en consola de R.*

Modifica el loop anterior para que haga las divisiones solo para los números nones (con un comando, NO con c(1,3,...)). Pista: next.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 6](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/loop2.png)*
```
r

for(i in 1:10){
  if(i %% 2 == 0) next
  print(35 / i)
}
```
![Fig6](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/loop2.png)

  * *Figura 6: Creación de loop que sólo divida 35 entre numeros nones en consola de R.*

Modifica el loop anterior para que los resultados de correr todo el loop se guarden en una df de dos columnas, la primera debe tener el texto "resultado para x" (donde x es cada uno de los elementos del loop) y la segunda el resultado correspondiente a cada elemento del loop. Pista: el primer paso es crear un vector fuera del loop. 
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 7](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/dataframe.png)*
```
r

texto <- c()
resultado <- c()
for(i in 1:10){
  if(i %% 2 == 0) next
  texto <- c(texto, paste("resultado para", i))
  resultado <- c(resultado, 35 / i)
}
df_result <- data.frame(texto,resultado)
df_result
```
![Fig7](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/dataframe.png)

  * *Figura 7: Creación de loop para obtener un data frame de dos columnas con resultados para el loop descrito en la figura 6 en consola de R.*

## **Ejercicio 6:**
Abre en RStudio el script `PracUni1Ses3/mantel/bin/1.IBR_testing.r`. Este script realiza un análisis de aislamiento por resistencia con Fst calculadas con ddRAD en Berberis alpina.
Lee el código del script y determina:

¿Qué hacen los dos for loops del script?
  * **El primer loop realiza las siguientes acciones:**

    * Itera sobre 13 diferentes superficies de resistencia (presente, modelos climáticos del LGM como ccsm y miroc, flat, y varias elevaciones de 1800 a 4000 metros)
    * Para cada superficie, carga el archivo de resistencias generado por Circuitscape (.out files)
    * Convierte las distancias efectivas en matrices organizadas según el orden de las poblaciones
    * Calcula la media de las distancias efectivas por población

  * **El segundo loop hace las siguientes acciones:**

    * Tests de Mantel entre la matriz de Fst linearizado y cada matriz de distancias efectivas
    * 10,000 permutaciones para obtener valores p robustos
    * Genera gráficos mostrando la relación entre distancia efectiva y diferenciación genética
    * Compila resultados (p-valor, correlación r) en una tabla resumen
    * Asigna dinámicamente los resultados a objetos con nombres como B.present y B.ccsm.

¿Qué paquetes necesitas para correr el script?
  * Se requiren 3 librerias `ade4`, `ggplo2`, y `sp`

¿Qué archivos necesitas para correr el script?
  * Se necesitas varios archivos para correr el script. Primero archivos de funcion `read.fst_summary_fix.R`, `read.effdist.R`, `DistPlot.R`, luego se requieren los siguientes archivos geográficos y genéticos `surveyed_mountains.tsv`, `BerSS.sumstats.tsv`, `BerSS.fst_summary.tsv`, `Balpina_focalpoints.txt`.
## **Ejercicio 7:**
Escribe una función llamada calc.tetha que te permita calcular tetha dados Ne y u como argumentos. Recuerda que tetha =4Neu.

## **Ejercicio 8:**
Al script del ejercicio de las pruebas de Mantel, agrega el código necesario para realizar un Partial Mantel test entre la matriz Fst, y las matrices del presente y el LGM, parcializando la matriz flat. Necesitarás el paquete vegan.

## **Ejercicio 9:**
Escribe un script que debe estar guardado en `PracUni1Ses3/maices/bin` y llamarse `ExplorandoMaiz.R`, que 1) cargue en R el archivo `PPracUni1Ses3maices/meta/maizteocintle_SNP50k_meta_extended.txt` y 2) responda lo siguiente.
(averigua cada punto con comandos de R. Recuerda comentar o tendrás 7 años de mala suerte en el lab)

¿Qué tipo de objeto creamos al cargar la base?

¿Cómo se ven las primeras 6 líneas del archivo?

¿Cuántas muestras hay?

¿De cuántos estados se tienen muestras?

¿Cuántas muestras fueron colectadas antes de 1980?

¿Cuántas muestras hay de cada raza?

En promedio ¿a qué altitud fueron colectadas las muestras?

¿Y a qué altitud máxima y mínima fueron colectadas?

Crea una nueva df de datos sólo con las muestras de la raza Olotillo

Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho

Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.

## **Ejercicio 10:** 
Divídanse por equipos de 2-3 personas según su tipo de datos o análisis. Exploren los paquetes de CRAN y de Bioconductor. Compartan por el gitter el link a la página de descripción del paquete y mencionen brevemente por qué les parece útil.


