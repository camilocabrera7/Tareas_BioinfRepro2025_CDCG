# **Tarea 4 Unidad 2 -Sesion 4**
**Camilo Cabrera García**
**30.09.2025**
-------------------
## **Ejercicio 1:**
Consulta el [manual de VCFtools](https://vcftools.github.io/man_latest.html) y escribe un script que responda lo siguiente para el archivo `GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf ` **sin copiarlo a su directorio**:
1. ¿Cuántos individuos y variantes (SNPs) tiene el archivo? **R: Hay 18 individuos y 4450360 posibles variantes.**
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 1](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig1.png)*
```
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf
```
![Fig1](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig1.png)

   * *Figura 1: Consola y código para la obtención de individuos y SNPs en el archivo mediante vcftools.*

2. ¿Cuántos sitios del archivo no tienen datos perdidos? **R: Hay 382626 sitios sin datos perdidos.**
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 2](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig2.png)*
```
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --max-missing 1
```
![Fig2](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig2.png)
   * *Figura 2: Consola y código para el filtrado de sitios con datos pérdidos en el archivo mediante vcftools.*

3. Genera un archivo en tu carpeta de trabajo `Prac_Uni5/data` que contenga solo SNPs en una ventana de 2Mb en cualquier cromosoma. Nombra el archivo`CLG_Chr<X>_<Start>-<End>Mb.vcf` donde <X> es número del cromosoma, <Start> es el inicio de la ventana genómica y <End> es el final en megabases.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 3](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig3.png)*
```
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --chr 1 --from-bp 3000000 --to-bp 5000000 --recode -c | bgzip -c > CLG_Chr15_3-5Mb.vcf.gz
```
![Fig3](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig3.png)
   * *Figura 3: Consola y código para la obtención un archivo con SNPs en el cromosoma 15 mediante vcftools.*

4. Reporta cuántas variantes tienen el archivo generado **R: Hay 4167 variantes en el archivo generado.**
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 4](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig4.png)*
```
vcftools --gzvcf /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/CLG_Chr15_3-5Mb.vcf.gz
```
![Fig4](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig4.png)
   * *Figura 4: Consola y código para la obtención de individuos y SNPs en el archivo generado para el cromosoma 15 mediante vcftools.*

5. Reporta la cobertura promedio para todos los individuos del set de datos **R: La cobertura promedio es 2.45635 para todos los individuos.**
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 5](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig5.png)*
```
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --depth --out  /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/depth_stats
awk '{sum+=$3} END {print sum/NR}'  /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/depth_stats.idepth
```
![Fig5](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig5.png)
   * *Figura 5: Consola y código para la obtención de la cobertura promedio de todos los individuos del set de datos mediante vcftools.*

6. Calcula la frecuencia de cada alelo para todos los individuos dentro del archivo y guarda el resultado en un archivo
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 6](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig6.png)*
```
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --freq --out /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/allele_freq
```
![Fig6](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig6.png)
   * *Figura 6: Consola y código para el cálculo de frecuencia de cada alelo para todos los individuos del set de datos mediante vcftools.*

7. Filtra el archivo de frecuencias para solo incluir variantes bialélicas (tip: awk puede ser útil para realizar esta tarea, tip2:  puedes usar bcftools para filtrar variantes con más de dos alelos antes de calcular las frecuencias)
  * Para ello se puede realizar de dos formas y el resultado se puede ver en las *[Figura 7](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig7.png)* y *[Figura 8](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig8.png)*
```
awk 'NR==1 || ($5!~"," && $5!="")' /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/allele_freq.frq > /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/allele_freq_biallelic.frq
```
![Fig7](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig7.png)
   * *Figura 7: Consola y código para el cálculo de frecuencia de cada alelo para todos los individuos del set de datos mediante awk.*
```
bcftools view -m2 -M2 -v snps /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf -Ov -o /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/biallelic_snps.vcf
vcftools --vcf /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/biallelic_snps.vcf --freq --out /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/allele_freq_biallelic
```
![Fig8](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig8.png)
   * *Figura 8: Consola y código para el cálculo de frecuencia de cada alelo para todos los individuos del set de datos con filtrado por bcftools.*

8. Llama a un script escrito en lenguaje R que lee el archivo de frecuencias de variantes bialélicas y guarda un histograma con el espectro de MAF para las variantes bialélicas
  * Para ello primero se debe crear el archivo de Rscript mediante vim `vim plot_maf_spectrum.R`, luego se debe realizar el script de R, para luego ejecutarlo en bash con `Rscript plot_maf_spectrum.R /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/allele_freq_biallelic.frq /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/histo_maf_biallelic.png` y se puede ver la creación del png en la *[Figura 9](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig9.png)*
```
r

args <- commandArgs(trailingOnly=TRUE)
frqfile <- args[1]
outfile <- args[2]

frq <- read.table(frqfile, header = TRUE, comment.char = "#", fill = TRUE, row.names = NULL)

# Extraer las frecuencias de las columnas 5 y 6
freq1 <- as.numeric(gsub(".*:", "", frq[, 5]))  # primera frecuencia
freq2 <- as.numeric(gsub(".*:", "", frq[, 6]))  # segunda frecuencia

# Calcular MAF (Minor Allele Frequency) - la menor de las dos frecuencias
maf <- pmin(freq1, freq2)

# Crear histograma
png(outfile)
hist(maf, breaks=50, main="MAF Spectrum", xlab="Minor Allele Frequency", ylab="Frequency")
dev.off()
```
![Fig9](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig9.png)
   * *Figura 9: Consola y código para el cálculo de frecuencias bialelicas mediante Rscript y creación de histograma con espectro MAF en png.*

9. ¿Cuántos sitios tienen una frecuencia del alelo menor <0.05? **R: hay 668227 sitios con frecuencia del alelo meno <0.05**
  * Para ello se utiliza awk y el resultado se puede ver en la *[Figura 10](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig10.png)*
```
awk 'NR > 1 {
    freq1 = gensub(/.*:/, "", "g", $5)
    freq2 = gensub(/.*:/, "", "g", $6)
    maf = (freq1 < freq2) ? freq1 : freq2
    if (maf < 0.05) count++
} END {print count+0}' /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/allele_freq_biallelic.frq
```
![Fig10](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig10.png)
   * *Figura 10: Consola y código para el cálculo de frecuencia de alelo menor mediante awk.*

10. Calcula la heterocigosidad de cada individuo.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 11](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig11.png)*
```
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --het --out /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/indv_het
```
![Fig11](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig11.png)
   * *Figura 11: Consola y código para el cálculo de heterocigosidad de cada individuo del dataset mediante vcftools.*

11. Calcula la diversidad nucleotídica por sitio.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 12](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig12.png)*
```
vcftools --vcf /datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf --site-pi --out /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/site_pi
```
![Fig12](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig12.png)
   * *Figura 12: Consola y código para el cálculo de diversidad nucleotídica por sitio mediante vcftools.*

12. Filtra los sitios que tengan una frecuencia del alelo menor <0.05
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 13](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig13.png)*
```
vcftools --vcf /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/biallelic_snps.vcf --maf 0.05 --recode --recode-INFO-all --out /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/wolves_maf05
```
![Fig13](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig13.png)
   * *Figura 13: Consola y código para filtración de sitios con una frecuencia de alelo menor a <0.05 mediante vcftools.*

13. Convierte el archivo `wolves_maf05.vcf` a formato plink.
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 14](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig14.png)*
```
vcftools --vcf /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/wolves_maf05.recode.vcf --plink --out /home/bioinfo1/ccabrera/BioinfinvRepro/Unidad2/Prac_Uni5/data/wolves_maf05
```
![Fig14](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig14.png)
   * *Figura 14: Consola y código para la conversión del archivo `wolves_maf05.vcf` a formato plink mediante vcftools.*

## **Ejercicio 2:**
En la ruta `/datos/compartido/ChileGenomico/` encontrarás varios archivos plink y un archivo de matainformación (`popinfo`). 

```
$ ls -lh /datos/compartido/ChileGenomico/chilean_all48_hg19*
-rw-r--r-- 1 filesadmin datagroup 9.4M Apr 26  2023 /datos/compartido/ChileGenomico/chilean_all48_hg19.bed
-rw-r--r-- 1 filesadmin datagroup  23M Apr 26  2023 /datos/compartido/ChileGenomico/chilean_all48_hg19.bim
-rw-r--r-- 1 filesadmin datagroup 1.1K Apr 26  2023 /datos/compartido/ChileGenomico/chilean_all48_hg19.fam
-rw-r--r-- 1 filesadmin datagroup 4.0K Sep 24 12:44 /datos/compartido/ChileGenomico/chilean_all48_hg19_popinfo.csv
```

Copia esos archivos a tu respositorio en una carpeta para la sesión `Unidad2/Prac_Uni5/data`  y contesta lo siguiente **asumiendo que tu WD es `Unidad2/Sesion1/code` (y no `data`).**

1) Enlista los archivos plink que hay en `data`.  ¿Qué tipos de archivos son cada uno?
  * Para ello se realizó el siguiente código y el resultado se puede ver en la *[Figura 15](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig15.png)*
![Fig15](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig15.png)
   * *Figura 15: Consola y código para determinación del tipo de archivo plink del repositorio.*

Se puede observar que hay:
     * `chilean_all48_hg19.bed` : archivo binario de genotipos (bit‐packed dos bits por genotipo).
     * `chilean_all48_hg19.bim` : archivo de mapeo de variantes (chrom, SNP ID, posición genética, posición física, alelo1, alelo2).
     * `chilean_all48_hg19.fam` : archivo de familias e individuos (FID, IID, paterno, materno, sexo, fenotipo).
     * `chilean_all48_hg19_popinfo.csv` : metainformación de muestras (no es formato PLINK, CSV de población).

2) Consulta el manual de [plink1.9](https://www.cog-genomics.org/plink/1.9/formats) y contesta utilizando comandos de plink lo siguiente. Deposita cualquier archivo que generes an una carpeta `Unidad2/Prac_Uni5/results`:

   a) Transforma de formato bed a formato ped (pista: sección Data Managment). El nombre del output debe ser igual, solo cambiando la extensión. El resultado de la consola puede verse en al *[Figura 16](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig16.png)*

```
$ plink --bfile ../data/chilean_all48_hg19 --recode --out ../results/chilean_all48_hg19
```
![Fig16](https://github.com/camilocabrera7/Tareas_BioinfRepro2025_CDCG/blob/main/Tarea4/images/fig16.png)
   * *Figura 16: Consola y código para la transformación de formato bed a formato ped del archivo `chilean_all48_hg19.bed` mediante plink.*

b) Crea otro archivo ped (ojo PPPPed) pero esta vez filtrando los SNPs cuya frecuencia del alelo menor sea menor a 0.05 Y filtrando los individuos con más de 10% missing data. Tu output debe llamarse maicesArtegaetal2015_maf05_missing10

¿Cuántos SNPs y cuántos individuos fueron removidos por los filtros?

```
$ plink --bfile ../data/chilean_all48_hg19 --recode --maf 0.05  --mind 0.1 --out ../results/chilean_all48_hg19_maf05_missing10
```

c) Realiza un reporte de equilibrio de Hardy-Weinberg sobre el archivo `chilean_all48_hg19_maf05_missing10` creado en el ejercicio anterior. El nombre del archivo de tu output debe contener chilean_all48_hg19_maf05_missing10.

```
plink --file ../results/chilean_all48_hg19_maf05_missing10 --hardy --out ../results/chilean_all48_hg19_maf05_missing10
```

Observa el output y discute que es cada columna.

```
head ../results/chilean_all48_hg19_maf05_missing10.hwe
10.hwe
 CHR                          SNP     TEST   A1   A2                 GENO   O(HET)   E(HET)            P
   1                    rs9701055      ALL    T    C              18/0/28        0   0.4764    5.994e-14
   1                    rs9701055      AFF    T    C                0/0/0      nan      nan            1
   1                    rs9701055    UNAFF    T    C              18/0/28        0   0.4764    5.994e-14
   1                    rs9701055      ALL    T    C              0/16/28   0.3636   0.2975       0.3137
   1                    rs9701055      AFF    T    C                0/0/0      nan      nan            1
   1                    rs9701055    UNAFF    T    C              0/16/28   0.3636   0.2975       0.3137
   1                    rs2073813      ALL    A    G              0/17/28   0.3778   0.3064       0.3197
   1                    rs2073813      AFF    A    G                0/0/0      nan      nan            1
   1                    rs2073813    UNAFF    A    G              0/17/28   0.3778   0.3064       0.3197
```

d) Observa el archivo `maicesArtegaetal2015.fam`. Consulta la documentación de plink para determinar que es cada columna. ¿Qué información hay y no hay en este archivo?

```
$ head ../data/chilean_all48_hg19.fam
CDSJ177 CDSJ177 0 0 1 1
CDSJ021 CDSJ021 0 0 1 1
ARI006 ARI006 0 0 1 1
ARI021 ARI021 0 0 1 1
ARI022 ARI022 0 0 2 1
CDSJ174 CDSJ174 0 0 1 1
CDSJ175 CDSJ175 0 0 1 1
CDSJ046 CDSJ046 0 0 1 1
CDSJ176 CDSJ176 0 0 1 1
CDSJ469 CDSJ469 0 0 2 1
```

4) Utiliza la info el archivo `data/chilean_all48_hg19_popinfo.csv` y el comando `update-ids` de plink para cambiar los nombres de las muestras de `data/chilean_all48_hg19.fam` de tal forma que el family ID corresponda a la info de la columna `Categ.Altitud` en `maizteocintle_SNP50k_meta_extended.txt`. Pista: este ejercicio requiere varias operaciones, puedes dividirlas en diferentes scripts de bash o de R y bash. Tu respuesta debe incluir todos los scripts (y deben estar en /code). 
5) Realiza un cuna comparación entre el sexo y archivo `fam`y el `popinfo` y calcula la proporción de discordancias
6) Realiza un test de estimación de sexo usando plink y reporta los resultados en formato de tabla para todos los individuos con discordancia entre el sexto reportado en `fam` y el calculado con plink.
7) Genera una tabla de contingencia de individuos por sexo y ancestría (hint: ver columna Ancestry en el archivo `popinfo`)
