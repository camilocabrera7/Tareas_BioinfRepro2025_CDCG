# **Tarea Unidad 1 -Sesion 3**
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
Escribe una función llamada `calc.tetha` que te permita calcular tetha dados Ne y u como argumentos. Recuerda que tetha =4Neu.
  * La función es la siguiente:
```
r

calc.tetha <- function(Ne, u) {
  theta <- 4 * Ne * u
  return(theta)
}
```

## **Ejercicio 8:**
Al script del ejercicio de las pruebas de Mantel, agrega el código necesario para realizar un Partial Mantel test entre la matriz Fst, y las matrices del presente y el LGM, parcializando la matriz flat. Necesitarás el paquete vegan.

  * Luego de la sección del script titulada `Isolation by Resistance`y despues de la linearización se le debe añadir lo siguiente para realizar partial mantel test:
```
r

# Creacion de dataframe con resultados del Partial Mantel test
PartialMantelResults <- c("Scenario", "Control", "PartialMTpvalue", "PartialMTr")

print("=== PARTIAL MANTEL TESTS ===")
print("Prueba para matrices del presente y controlando la matriz flat")

### Prueba presente vs LGM scenarios, controlando matriz flat
scenarios <- c("present", "ccsm", "miroc")

for(i in scenarios) {
  print(paste("Partial Mantel test for", i, "controlling for flat"))
  
  # Partial Mantel test: Test correlation between Fst and scenario i, 
  # while controlling for flat surface
  partial_mantel <- mantel.partial(xdis = as.dist(get(paste0("B.", i))), 
                                   ydis = as.dist(B.FstLin), 
                                   zdis = as.dist(B.flat),
                                   method = "pearson", 
                                   permutations = 10000)
  
  print(partial_mantel)
  
  # Extraer resultados
  PartialMTpvalue <- round(partial_mantel$signif, 6)
  PartialMTr <- round(partial_mantel$statistic, 4)
  
  # Guardar resultados
  scenario_name <- paste(i)
  control_name <- "flat"
  PartialMantelResults <- rbind(PartialMantelResults, 
                               c(scenario_name, control_name, PartialMTpvalue, PartialMTr))
}

# Mostrar los resultados de los Partial Mantel test
print("=== PARTIAL MANTEL RESULTS SUMMARY ===")
colnames(PartialMantelResults) <- PartialMantelResults[1,]
PartialMantelResults <- PartialMantelResults[-1,]
print(PartialMantelResults)

```
## **Ejercicio 9:**
Escribe un script que debe estar guardado en `PracUni1Ses3/maices/bin` y llamarse `ExplorandoMaiz.R`, que 1) cargue en R el archivo `PPracUni1Ses3maices/meta/maizteocintle_SNP50k_meta_extended.txt` y 2) responda lo siguiente.(averigua cada punto con comandos de R)

¿Qué tipo de objeto creamos al cargar la base?

  * `meta_maiz <- read.delim("PracUniSes3maices/meta/maizteocintle_SNP50k_meta_extended.txt", header=TRUE, sep= "\t")` se crea un objeto `meta_maiz` del tipo data.frame

¿Cómo se ven las primeras 6 líneas del archivo?

  * `print(head(meta_maiz))` permite ver las primeras 6 líneas del archivo y se ve en la *[Figura 8](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/head_df.png)*, lo obtenido en el código
![Fig8](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/head_df.png)

  * *Figura 8: Obtención de las primeras 6 líneas del archivo mediante la consola de R.*

¿Cuántas muestras hay?

  * `nro_muestras <- nrow(meta_maiz)` permite ver la cantidad de muestras (filas) en este caso serían **165 muestras**

¿De cuántos estados se tienen muestras?

  * `unique(meta_maiz$Estado)` permite ver de forma individual cada Estado de la columna `Estado` del data.frame, en este caso serían **19 estados**

¿Cuántas muestras fueron colectadas antes de 1980?

  * `muestras_antes_1980 <- sum(meta_maiz$A.o._de_colecta < 1980, na.rm = TRUE` permite crear un objeto con la cantidad de muestras colectadas antes de 1980, en este caso serían **8 muestras**

¿Cuántas muestras hay de cada raza?

  * `meta_maiz %>% count(Raza)` permite utilizando la libreria `dplyr` en R crear una lista con las distintas razas y su cantidad neta, que en este caso **hay 48 razas** y la cantidad de cada raza se puede ver en la *[Figura 9](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/razas_count.png)*

![Fig9](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea3/images/razas_count.png)

  * *Figura 9: Lista de conteo de cuantos especimenes hay de cada raza en el data frame meta_maiz en consola de R.*

En promedio ¿a qué altitud fueron colectadas las muestras?

  * `mean(meta_maiz$Altitud)` permite ver el promedio de la columna altitud para cada muestra, en este caso el promedio es de **1519.242**

¿Y a qué altitud máxima y mínima fueron colectadas?
```
r
    
min(meta_maiz$Altitud)
max(meta_maiz$Altitud)
```
  * Permite ver el valor mínimo y máximo de altitud de la cosecha, en este caso la **altitud máxima es de 2769 y la mínima de 5**

Crea una nueva df de datos sólo con las muestras de la raza Olotillo

```
r

df_olotillo <- meta_maiz %>%
+     filter(Raza == "Olotillo")
> df_olotillo
```
  * Permite permite utilizando la libreria `dplyr` crear un data frame de datos sólo con muestras de la raza `Olotillo`.

Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho

Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.
```
r

df_razas <- meta_maiz %>%
+     filter(Raza %in% c("Reventador", "Jala", "Ancho"))
> df_olotillo
```
  * Permite permite utilizando la libreria `dplyr` crear un data frame de datos sólo con muestras del conjunto de razas `Reventador, Jala y Ancho`.

## **Ejercicio 10:** 

Exploren los paquetes de CRAN y de Bioconductor. Compartan por el gitter el link a la página de descripción del paquete y mencionen brevemente por qué les parece útil.

El paquete `Seurat` es de gran importancia a nivel mundial para el análisis de datos de secuenciación de RNA de célula individual (scRNA-seq). Dependiendo del objetivo se trata de un paquete de R que tiene gran versatilidad. 

*Para investigadores de genómica*: Seurat permite identificar subpoblaciones celulares, caracterizar heterogeneidad tumoral, y mapear desarrollo embrionario. 

*Para bioinformáticos*: Ofrece métodos estadísticos robustos, integración de pipelines, y reproducibilidad en análisis complejos.

*Para clínicos*: Facilita el descubrimiento de biomarcadores, análisis de muestras de pacientes, y medicina personalizada.

Seurat se ha convertido en el estándar de facto para análisis de scRNA-seq debido a su robustez metodológica, facilidad de uso, y capacidad para manejar los desafíos técnicos más complejos en genómica de célula individual.

  * [CRAN](https://cran.r-project.org/package=Seurat)
  * [Sitio Oficial](https://satijalab.org/seurat/)
  * [GitHub](https://github.com/satijalab/seurat)
  * [Documentación Completa](https://satijalab.org/seurat/articles/get_started_v5_new)


