# Project 4: Medieval / Iberian admixture

## Modify names to match your dataset!

#### Load packages:
library(admixtools)
library(tidyverse)

# Set working directory
setwd("/home/ahumada_quintanilla/Escritorio/Bioinformatica/popgen_shared")

# Load metadata
metadf = read.table("v62.0_1240k_public_metadata2.csv", header = T, sep = ",")
#### Get f2_blocks. Only once for the entire project

target4 <- c("Spain_Islamic.AG","Spain_Medieval.AG","Spain_NazariPeriod_Muslim.AG","Spain_Islamic_Zira.AG","Spain_Visigoth_Granada.AG") 
source4 <- c("Spain_MLN.AG", "Morocco_EN.WGC.SG", "Yoruba.DG") 
outgroup4 <- c("Ethiopia_4500BP.SG", "Han.DG", "CHB.DG", "Papuan.DG", "Russia_UstIshim_IUP.DG")


all_pops <- c(target4, source4, outgroup4, "Mbuti.DG")
prefix <- "v62.0_1240k_public"
outdir <- "aadr_1000G_f2_proyect4"

extract_f2(pref = prefix,
           outdir = outdir,
           pops = all_pops,          # only populations to analyze
           overwrite = TRUE,
           blgsize = 0.05,            # block size in Morgans (default fine)
           verbose = TRUE)

#### Load f2_blocks
f2_blocks <- f2_from_precomp(outdir)

#### Outgroup-f3: shared drift between target and sources
#pop1=outgroup; pop2=target groups or populations; pop3=the ones to test shared drift with

f3_results <- f3(f2_blocks, pop1="Ethiopia_4500BP.SG", pop2=target4, pop3=source4)


#### f4 tests: asymmetry checks. Are target populations closer to any of the potential sources?. Run one per each target population

f4_results <- f4(f2_blocks, pop1="Spain_Islamic.AG", pop2=c("Spain_Medieval.AG","Spain_NazariPeriod_Muslim.AG","Spain_Islamic_Zira.AG","Spain_Visigoth_Granada.AG"), pop3=source4, pop4="Mbuti.DG")


#### qpWave: test rank (how many ancestry streams are needed). Run one per each target population
wave2<- qpwave(f2_blocks,
                left=  c(target4[1], source4),
                right= outgroup4)
wave2

wave3 <- qpwave(f2_blocks,
                left = c(target4[2], source4),
                right = outgroup4)
wave3

wave4 <- qpwave(f2_blocks,
                left = c(target4[3], source4),
                right = outgroup4)
wave4
wave5 <- qpwave(f2_blocks,
                left = c(target4[4], source4),
                right = outgroup4)
wave5

wave6 <- qpwave(f2_blocks,
                left = c(target4[5], source4),
                right = outgroup4)
wave6

#### qpAdm: 2 or 3-way mixture models. Run one per each target populations
#2-way
admix_2way1 <- qpadm(f2_blocks, left = c(target4[1], source4[1:2]), right = outgroup4, target=target4[1])
admix_2way2 <- qpadm(f2_blocks, left = c(target4[2], source4[1:2]), right = outgroup4, target=target4[1])
admix_2way3 <- qpadm(f2_blocks, left = c(target4[3], source4[1:2]), right = outgroup4, target=target4[1])
admix_2way4 <- qpadm(f2_blocks, left = c(target4[4], source4[1:2]), right = outgroup4, target=target4[1])
admix_2way5 <- qpadm(f2_blocks, left = c(target4[5], source4[1:2]), right = outgroup4, target=target4[1])
view(admix_2way1$weights)
view(admix_2way2$weights)
view(admix_2way3$weights)
view(admix_2way4$weights)
view(admix_2way5$weights)

#3-way
admix_3way1 <- qpadm(f2_blocks, left = c(target4[1], source4), right = outgroup4, target=target4[1])
admix_3way2 <- qpadm(f2_blocks, left = c(target4[2], source4), right = outgroup4, target=target4[1])
admix_3way3 <- qpadm(f2_blocks, left = c(target4[3], source4), right = outgroup4, target=target4[1])
admix_3way4 <- qpadm(f2_blocks, left = c(target4[4], source4), right = outgroup4, target=target4[1])
admix_3way5 <- qpadm(f2_blocks, left = c(target4[5], source4), right = outgroup4, target=target4[1])
view(admix_3way1$weights)
view(admix_3way2$weights)
view(admix_3way3$weights)
view(admix_3way4$weights)
view(admix_3way5$weights)
