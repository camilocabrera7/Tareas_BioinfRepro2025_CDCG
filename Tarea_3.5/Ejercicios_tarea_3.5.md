# Tarea Unidad 3 - Sesion 5

**Camilo Cabrera 09.12.2025**

---------------------------------

## 1. Introducción
En el siguiente informe se hizo uso del pipeline nf-core/sarek para detectar variantes germinales y somáticas a partir de lecturas de secuenciación de muestras tumorales (En este caso `S4`). El objetivo principal del tutorial y tarea fue ejecutar pipeline de análisis geerminal y somático, comparar ambos conjuntos de variantes. Investigar la relevancia biológica y clínica de las variantes identificadas usando bases de datos cómo OncoKB (somáticas) y gnomAD (germinales).

## 2. Metodología
Todos los análisis fueron realizados en el servidor `bioinfo1` (entorno Linux) utilizando el pipeline nf-core/sarek, ejecutado mediante Nextflow y Singularity. Para realizar los análisis se utilizó la muestra `S4`, donde sus archivos fasta correspondientes son:

> **S4_R1.fastq.gz**

> **S4_R2.fastq.gz**

Ambos scripts se utilizaron según lo descrito en el tutorial sarek, con la única salvedad que se modificaron el input de los archivos fasta y el output de los resultados, aquí se puede ver el código del [script sarek_germinal.sh](./codes/sarek_germinal.sh) y aquí se puede ver el código del [script sarek_somatic.sh](./codes/sarek_somatic.sh).

Para el presente informe los comandos se realizaron de la siguiente forma:
```
bash sarek_germinal.sh S4_R1.fastq.gz S4_R2.fastq.gz ../results
bash sarek_somatic.sh S4_R1.fastq.gz S4_R2.fastq.gz ../results
```

Una vez ejecutados los scripts se puede observar la siguiente distribución de carpetas. El análisis germinal se realizó en la siguiente ruta:
```
/home/bioinfo1/ccabrera/Tareas_BioinfRepro2025_CDCG/Tarea_3.5/pipeline_sarek/results/germinal_S4/
└── variant_calling/haplotypecaller/S4/
    ├── S4.haplotypecaller.filtered.vcf.gz      ← USADO
    ├── S4.haplotypecaller.filtered.vcf.gz.tbi
    ├── S4.haplotypecaller.vcf.gz              
    └── S4.haplotypecaller.vcf.gz.tbi
```
El análisis somático se realizó en la siguiente ruta:

```
/home/bioinfo1/ccabrera/Tareas_BioinfRepro2025_CDCG/Tarea_3.5/pipeline_sarek/results/somatic_S4/
└── variant_calling/mutect2/S4/
    ├── S4.mutect2.filtered.vcf.gz              ← USADO
    ├── S4.mutect2.filtered.vcf.gz.tbi
    ├── S4.mutect2.vcf.gz                       
    ├── S4.mutect2.contamination.table
    ├── S4.mutect2.segmentation.table
    └── S4.mutect2.pileups.table
```


## 3. Resultados Germinales
El análisis de variantes germinales se realizó utilizando **nf-core/sarek con HaplotypeCaller**. Se procesó la muestra S4 y se filtraron variantes de baja calidad según los estándares de GATK. El análisis produjo 124 variantes de alta confianza en el VCF filtrado de HaplotypeCaller (filtro PASS en todas las entradas).

| Métrica | Valor | Interpretación |
|---------|-------|-----------------|
| Total de variantes identificadas | 124 | Número de variantes después de filtrado GATK |
| Single Nucleotide Polymorphisms (SNPs) | 95 (76.6%) | Dominan sobre indels, típico en germinales |
| Insertions/Deletions (Indels) | 29 (23.4%) | Proporción esperada para secuenciación de línea germinal |
| **Ratio de Transiciones/Transversiones (Ts/Tv)** | **2.28** | **Excelente - Indica alta calidad del variant calling** |
| Profundidad promedio (DP) | ~3-10x | Típica para análisis germinal con cobertura moderada |

## 4. Resultados Somáticos
El análisis de variantes somáticas se realizó utilizando **nf-core/sarek con Mutect2**, optimizado para detectar variantes adquiridas en células tumorales. Se procesó la muestra S4 con filtrado de alta confianza y el análisis identifico 288 variantes.

| Métrica | Valor | Interpretación |
|---------|-------|-----------------|
| Total de variantes identificadas | 288 | Variantes somáticas en tejido tumoral (filtradas) |
| Single Nucleotide Polymorphisms (SNPs) | 195 (67.7%) | Predominan, pero con proporción menor que germinal |
| Insertions/Deletions (Indels) | 93 (32.3%) | Proporción AUMENTADA respecto a germinal (típico en tumores) |
| **Ratio de Transiciones/Transversiones (Ts/Tv)** | **0.81** | **Transversiones > Transiciones (patrón típico somático)** |
| Variantes somáticas únicas | ~164 | Variantes presentes SOLO en tumor, no en germinal |


## 5. Comparación Germinal vs Somático

| Métrica | Germinal | Somático | Diferencia | % Cambio | Interpretación |
|---------|----------|----------|-----------|----------|-----------------|
| **Total de variantes** | 124 | 288 | +164 | +132% | Tumor acumula 2.3x más variantes |
| **SNPs** | 95 (76.6%) | 195 (67.7%) | +100 | +105% | Aumento absoluto, pero proporción relativa menor |
| **Indels** | 29 (23.4%) | 93 (32.3%) | +64 | +221% | AUMENTO DRAMÁTICO de indels (3.2x más) |
| **Transiciones (Ts)** | 66 | 82 | +16 | +24% | Aumento moderado |
| **Transversiones (Tv)** | 29 | 101 | +72 | +248% | AUMENTO DRAMÁTICO de transversiones |
| **Ratio Ts/Tv** | 2.28 | 0.81 | -1.47 | -65% | CAMBIO CRÍTICO en patrón mutacional |

## 6. Búsqueda de Variantes Seleccionadas

## 7. Discusión 

## 8. Conclusiones
