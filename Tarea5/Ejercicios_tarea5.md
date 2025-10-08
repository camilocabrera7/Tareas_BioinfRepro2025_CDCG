# **Tarea 5 Unidad 2 -Sesion 5**
**Camilo Cabrera García**
**07.10.2025**
-------------------
## **Ejercicio 1:**

1. ¿Cómo se llaman los archivos que contienen las tasas de datos perdidos por SNP y por muestra?
   * R: El archivo que contienen las tasas de datos pérdidos por SNPs y por muestras son los `plink.imiss` para cada individuo. Para los SNPs el archivo `plink.lmiss`. Ambos se generan cuando se realiza el script : `plink --bfile $C/chilean_all48_hg19 --missing`
2. ¿Cuántas variantes se eliminaron por tener una tasa de datos perdidos mayor a 0.2?
   * R: 
3. ¿Cuántos individuos tenían una tasa de datos perdidos mayor a 0.02?
   * R:
4. Basados en los histogramas y en sus cálculos, ¿qué valores umbrales de datos perdidos para muestras y SNPs sugeriría?
   * R:

## **Ejercicio 2:**

1. ¿Cuántos individuos fueron eliminados por discrepancia de sexo?
   * R:
2. ¿Qué riesgo(s) se corre(n) si no se eliminaran?
   * R:

## **Ejercicio 3:**

1. ¿Cuál es el nombre del primer conjunto de datos que solo contiene SNPs en autosomas?
   * R:
3. ¿Cuántos SNPs se encontraban en cromosomas sexuales?
   * R:
5. ¿Como calcularía el número de cromosomas que porta cada uno de los alelos para cada SNP?
   * R:


## **Ejercicio 4:**

1. ¿Cuál es el nombre del archivo con los resultados de la prueba de HWE?
   * R:
3. ¿Basándose en la distribución de los valores de *p*, le parece el umbral usado razonable o propondría otro valor?
   * R:

## **Ejercicio 5:**

1. ¿Cuántos SNPs en aparente equilibrio de ligamiento se encontraron?
   * R:
3. ¿Cuántos SNPs se eliminaron por estar en regiones de inversiones conocidas?
   * R:
5. ¿Cuántos individuos quedaron luego del filtro de parentesco?
   * R:
7. ¿Cuál fue el mayor coeficiente de parentesco efectivamente aceptado?
   * R:

## **Ejercicio 6:**

1. En R, genere gráficos similares para las combinaciones Component 2 vs 3 y 3 vs 4. ¿Qué puede concluir de estos gráficos?

## **Ejercicio 7:**

1. ¿Cuántos SNPs quedaron luego del filtro?
   * R: 
3. ADMIXTURE asume que los individuos no están emparentados. Sin embargo, no realizamos ningún filtro. ¿Por qué?
   * R:
