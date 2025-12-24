outdir     <- "../results"

if(!file.exists(outdir)) {
  dir.create(outdir, mode = "0755", recursive=T)
}

Data.Raw  <- read.delim("Illum_data_subset_5000.txt")
signal    <- grep("AVG_Signal", colnames(Data.Raw)) # vector de columnas con datos 
detection <- grep("Detection.Pval", colnames(Data.Raw))

annot     <- read.delim("MouseRef-8_annot_full.txt")
probe_qc  <- ifelse(annot$ProbeQuality %in% c("Bad", "No match"), "Bad probes",
                    "Good probes")

design    <- read.csv("YChrom_design.csv")
print(design)

Data.Raw <- Data.Raw[probe_qc %in% "Good probes",]
annot    <- annot[probe_qc %in% "Good probes",]

rawdata           <- as.matrix(Data.Raw[,signal])
rownames(rawdata) <- Data.Raw$PROBE_ID
colnames(rawdata) <- design$Sample_Name

library(preprocessCore)
normdata           <- normalize.quantiles(rawdata) 
colnames(normdata) <- colnames(rawdata)
rownames(normdata) <- rownames(rawdata)

probe_present      <- Data.Raw[,detection] < 0.04
detected_per_group <- t(apply(probe_present, 1, tapply, design$Group, sum))

present  <- apply(detected_per_group >= 2, 1, any)
normdata <- normdata[present,]
annot    <- annot[present, ]

write.table(normdata, file.path(outdir, "normdata.txt"), sep="\t", row.names=T)

# ==============================================================================
# SELECCIÓN DE GENES (DEGs) PARA CLUSTERING
# ==============================================================================

# 1. Cargar la tabla de resultados DE
if (file.exists("DE_results.csv")) {
  
  de_results <- read.csv("DE_results.csv")
  
  # 2. Definir el umbral de FDR (Debe ser el mismo de tu tarea: 0.19)
  fdr_th <- 0.19
  
  # 3. Limpieza de IDs (igual que en el tutorial anterior)
  # Usamos EntrezID como identificador principa
  de_results$GeneID <- de_results$EntrezID
  de_results$GeneID[is.na(de_results$GeneID)] <- de_results$ProbeID[is.na(de_results$GeneID)]
  
  # 4. Aplicar el filtro de la tarea
  # a) Identificar sondas significativas en alguno de los contrastes
  Probes.Sig <- de_results[, c("FDR.Geno", "FDR.Trt", "FDR.Int")] <= fdr_th
  
  # b) Determinar genes significativos exigiendo que TODAS ('all') sus sondas lo sean
  Genes.Sig_Logic <- apply(Probes.Sig, 2, tapply, de_results$GeneID, all)
  
  # c) Quedarse con genes que pasen el filtro en al menos una condición (Geno, Trt o Int)
  # rowSums > 0 significa que fue TRUE para al menos una columna
  Genes.To.Keep <- rownames(Genes.Sig_Logic)[rowSums(Genes.Sig_Logic, na.rm=TRUE) > 0]
  
  cat("Genes seleccionados para clustering:", length(Genes.To.Keep), "\n")
  
  # 5. Filtrar la matriz 'normdata'
  # Primero alineamos los IDs en la anotación que ya tienes cargada en memoria ('annot')
  annot$GeneID <- annot$EntrezID
  annot$GeneID[is.na(annot$GeneID)] <- annot$ProbeID[is.na(annot$GeneID)]
  
  # Vector lógico: ¿La sonda pertenece a uno de los genes seleccionados?
  keep_probes <- annot$GeneID %in% Genes.To.Keep
  
  normdata_deg <- normdata[keep_probes, ]
  
  # 6. Exportar la matriz filtrada
  # La guardamos en 'outdir' (../results) para mantener el orden, con un nombre distinto.
  write.table(normdata_deg, file.path(outdir, "normdata_DEGs.txt"), sep="\t", row.names=TRUE)
  
  cat("Archivo generado exitosamente: ", file.path(outdir, "normdata_DEGs.txt"), "\n")
  cat("Dimensiones finales:", nrow(normdata_deg), "sondas x", ncol(normdata_deg), "muestras.\n")
  
}
