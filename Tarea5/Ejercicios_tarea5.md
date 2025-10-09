# **Tarea 5 Unidad 2 -Sesion 5**
**Camilo Cabrera García**
**07.10.2025**
-------------------
## **Ejercicio 1:**

1. ¿Cómo se llaman los archivos que contienen las tasas de datos perdidos por SNP y por muestra?
   * R: El archivo que contienen las tasas de datos pérdidos por SNPs y por muestras son los `plink.imiss` para cada individuo. Para los SNPs el archivo `plink.lmiss`. Ambos se generan cuando se realiza el script : `plink --bfile $C/chilean_all48_hg19 --missing`.
2. ¿Cuántas variantes se eliminaron por tener una tasa de datos perdidos mayor a 0.2?
   * R: Mediante el script `plink --bfile $C/chilean_all48_hg19 --geno 0.2 --make-bed --out chilean_all48_hg19_2` se eliminaron **4680 variantes**.
3. ¿Cuántos individuos tenían una tasa de datos perdidos mayor a 0.02?
   * R: Mediante el script `plink --bfile chilean_all48_hg19_4 --mind 0.02 --make-bed --out chilean_all48_hg19_5` no se eliminaron individuos por el filtro. Por ende **no hay individuos con perdida de datos mayor a 0.02**.
4. Basados en los histogramas y en sus cálculos, ¿qué valores umbrales de datos perdidos para muestras y SNPs sugeriría?
   * R: En base a los cálculos anteriores y los histogramas se puede observar que la mayoría de los individuos tiene menos de un 2% de datos pérdidos y permite eliminar variantes problemáticas para el análisis. Por ello el umbral sería de **0.02 para el filtro**.

## **Ejercicio 2:**

1. ¿Cuántos individuos fueron eliminados por discrepancia de sexo?
   * R: Mediante el script `plink --bfile chilean_all48_hg19_5 --remove sex_discrepancy.txt --make-bed --out chilean_all48_hg19_6` se eliminaron **3 individuos** por discrepancia de sexo. 
2. ¿Qué riesgo(s) se corre(n) si no se eliminaran?
   * R: Se pueden correr varios riesgos como:
       * Errores de identificación de muestras afectando la confiabilidad del análisis final, ya que puede introducir asociaciones erroneas si el estudio considera cromosomas sexuales.
       * Generar ruido y sesgo dentro del dataset lo que puede disminuir la prescisión de los resultados.
       * Errores en la reproducibilidad y trazabilidad de los resultados lo que puede dificultar validación o comparación de resultados entre estudios que pueden ser independientes.

## **Ejercicio 3:**

1. ¿Cuál es el nombre del primer conjunto de datos que solo contiene SNPs en autosomas?
   * R: Mediante el script `plink --bfile chilean_all48_hg19_6 --extract snp_1_22.txt --make-bed --out chilean_all48_hg19_7` se produce el conjunto de datos que sólo contiene autosomas que sería el conjunto `chilean_all48_hg19_7`.
2. ¿Cuántos SNPs se encontraban en cromosomas sexuales?
   * R: Al aplicar el filtro de MAF quedan 459378 SNPs, y antes del filtro habían 574624 SNPs. Por diferencia serían **115246 SNPs** que se encontraba en cromosomas sexuales.
3. ¿Como calcularía el número de cromosomas que porta cada uno de los alelos para cada SNP?
   * R: Mediante el script `plink --bfile chilean_all48_hg19_7 --freq --out MAF_check` se debe generar el archivo de freceuncias alelicas `MAF_check.frq` para luego utilizar awk y calcular los cromosomas portadores de cada alelo con el archivo de frecuencia. Con el siguiente script se calcula la cantidad de cromosomas del alelo meno `A1_count` y del alelo mayor `A2_count`
```
awk 'NR>1 { 
  A1_count = $6 * $7; 
  A2_count = $7 - A1_count; 
  print $2, $3, $4, $5, A1_count, A2_count 
}' MAF_check.frq > alleles_chromosome_counts.txt
```   

## **Ejercicio 4:**

1. ¿Cuál es el nombre del archivo con los resultados de la prueba de HWE?
   * R: Mediante el script `plink --bfile chilean_all48_hg19_8 --hardy` se produce el archivo `plink.hwe` que corresponde al resultado de la prueba de HWE.
2. ¿Basándose en la distribución de los valores de *p*, le parece el umbral usado razonable o propondría otro valor?
   * R: El **valor 1x10^-6** sería un umbral razonable para la distribución de valores p. Ya que la mayoría de SNPs tiene un valores de p cercanos a 1. sólo un un grupo muy pequeño presenta desviaciones extremas (menores a 1X10^-6)

## **Ejercicio 5:**

1. ¿Cuántos SNPs en aparente equilibrio de ligamiento se encontraron?
   * R: Mediante el script `wc -l indepSNP.prune.in` se puede obtener la cantidad de SNPs tras el filtro de ligamiento, estos son **103214 SNPs**.
2. ¿Cuántos SNPs se eliminaron por estar en regiones de inversiones conocidas?
   * R: Mediante el script `plink --bfile chilean_all48_hg19_9 --exclude $T/inversion.txt --range --indep-pairwise 50 5 0.2 --out indepSNP` se puede observa que **se eliminaron 7914 variantes** por estar en regiones de inversiones conocidas.
3. ¿Cuántos individuos quedaron luego del filtro de parentesco?
   * R: Mediante el script `plink -bfile chilean_all48_hg19_9 -remove to_romeve_by_relatedness.txt -make-bed --out chilean_all48_hg19_10` se puede observar que se **retuvieron 42 individuos** luego del filtro de parentezco.
4. ¿Cuál fue el mayor coeficiente de parentesco efectivamente aceptado?
   * R: Se mantiene el valor utilizado en el tutorial **un coeficiente de pihat = 0.2005**.

## **Ejercicio 6:**

1. En R, genere gráficos similares para las combinaciones Component 2 vs 3 y 3 vs 4. ¿Qué puede concluir de estos gráficos?

## **Ejercicio 7:**

1. ¿Cuántos SNPs quedaron luego del filtro?
   * R: Quedaron **103,214 SNPs seleccionados**, como lo indica el conteo de líneas del archivo `indepSNP.prune.in`
3. ADMIXTURE asume que los individuos no están emparentados. Sin embargo, no realizamos ningún filtro. ¿Por qué?
   * R: No se realizó un filtro de individuos emparentados para la fase de ADMIXTURE porque en el control de calidad previo del set ChileGenómico-HapMap, ya fueron eliminados aquellos con pihat ≥ 0.2 (parientes cercanos). Los individuos restantes tienen baja o nula relación, lo que garantiza que los resultados de inferecia de ancestría (por máxima verosimilitud) no estarán sesgados por parentesco oculto
