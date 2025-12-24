library(cluster)
library(ggplot2)
library(factoextra)

#Ajustar directorio de salida
outdir     <- "../results"

if(!file.exists(outdir)) {
  dir.create(outdir, mode = "0755", recursive=T)
}

#Cargado de datos
mydata <- read.delim("../results/normdata_DEGs.txt", as.is=T, row.names = NULL)

#Cambiar nombres columnas
design <- read.csv("YChrom_design.csv")
colnames(mydata)[-1] <- design$Group

#Preprocesamiento de datos
mydata <- na.omit(mydata) # eliminacion filas con faltantes
mydata[-1] <- scale(mydata[-1]) # estandarizar variables sobre columnas numericas

##Clustering de sondas
# Determinacion del numero de grupos
wss <- (nrow(mydata)-1)*sum(apply(mydata[-1],2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata[-1],
                                     centers=i)$withinss)
png(paste0(outdir,"/SSQ_by_K_using_kmeans.png"), width=600, heigh=500)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares") 
dev.off()

#Seleccion de grupos por metodo del codo (4 en este caso)
fit <- kmeans(mydata[-1], 4)
class(fit)
mydata2 <- data.frame(mydata, cluster = fit$cluster)
aggregate(mydata2,by=list(fit$cluster),FUN=mean)

#Creacion figura cluster pkg
png(paste0(outdir,"/Clusplot_kmeans_k4.png"), width=600, heigh=500)
clusplot(mydata2, fit$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=0)
dev.off()


##Clustering de grupos
mydata3 <- t(mydata[-1])

# Determinacion del numero de grupos
wss2 <-  NULL
for (i in 2:15) wss2[i] <- sum(kmeans(mydata3,
                                     centers=i)$withinss)
png(paste0(outdir,"/SSQ2_by_K_using_kmeans.png"), width=600, heigh=500)
plot(1:15, wss2, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares") 
dev.off()

#Seleccion de grupos por metodo del codo (6 en este caso)
fit <- kmeans(mydata3, 6)
class(fit)
cluster1 <- data.frame(data = rownames(mydata3), cluster = fit$cluster)

#Creacion de figura cluster pkg
png(paste0(outdir,"/Clusplot2_kmeans_k6.png"), width=600, heigh=500)
clusplot(cluster1, fit$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=0)
dev.off()


## Dendrograma de muestras
d <- dist(t(mydata[-1]), method = "euclidean") # distance matrix
fit2 <- hclust(d, method="ward.D")
png(paste0(outdir,"/hclust_samples.png"), width=600, heigh=500)
plot(fit2, hang = -1, cex = 0.8) # display dendogram
dev.off()
groups <- cutree(fit2, k=4) # cut tree into 5 clusters
groups
png(paste0(outdir,"/rect_hclust_samples.png"), width=600, heigh=500)
plot(fit2, hang = -1, cex = 0.8) # display dendogram
rect.hclust(fit2, k=4, border="red") 
dev.off()


#Dendrograma de sondas
gd <- get_dist(mydata[-1], method ="pearson", stand=FALSE)
gfit <- hclust(gd, method="ward.D")
png(paste0(outdir,"/hclust_genes.png"), width=600, heigh=500)
plot(gfit, hang = -1, cex = 0.8, labels = FALSE) # display dendogram
dev.off()





