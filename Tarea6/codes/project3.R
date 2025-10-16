# Project 3: Peopling of the Americas

## Modify names to match your dataset!

#### Load packages:
library(admixtools)
library(tidyverse)

#### Get f2_blocks. Only once for the entire project

target3 <- c("Pima.DG", "CLM.DG", "Bahamas_EleutheraIsl_Ceramic.AG", "Chile_Conchali_700BP.AG") #check for other ancient or present-day groups in the Americas.
source3 <- c("USA_Anzick_realigned.SG","USA_Ancient_Beringian.SG","USA_Nevada_SpiritCave_11000BP.SG")
outgroup3 <- c("Mbuti.DG", "CHB.DG", "Papuan.DG", "Russia_UstIshim_IUP.DG", "Denisova.DG")


all_pops_p3 <- c(target3, source3, outgroup3, "India_GreatAndaman_100BP.SG")
prefix <- "v62.0_1240k_public"
outdir <- "aadr_1000G_f2_proyect3"

extract_f2(pref = prefix,
           outdir = outdir,
           pops = all_pops_p3,          # only populations to analyze
           overwrite = TRUE,
           blgsize = 0.05,            # block size in Morgans (default fine)
           verbose = TRUE)

#### Load f2_blocks
f2_blocks_p3 <- f2_from_precomp(outdir)

#### Outgroup-f3: shared drift between target and sources
#pop1=outgroup; pop2=target groups or populations; pop3=the ones to test shared drift with

f3_results_p3 <- f3(f2_blocks_p3, pop1="Mbuti.DG", pop2=target3, pop3=source3)


#### f4 tests: asymmetry checks. Are target populations closer to any of the potential sources?. Run one per each target population

f4_results_p3_1 <- f4(f2_blocks_p3, pop1="Pima.DG", pop2=c("CLM.DG", "Bahamas_EleutheraIsl_Ceramic.AG", "Chile_Conchali_700BP.AG"), pop3=source3, pop4="Mbuti.DG")
f4_results_p3_2 <- f4(f2_blocks_p3, pop1="CLM.DG", pop2=c("Pima.DG", "Bahamas_EleutheraIsl_Ceramic.AG", "Chile_Conchali_700BP.AG"), pop3=source3, pop4="Mbuti.DG")
f4_results_p3_3 <- f4(f2_blocks_p3, pop1="Bahamas_EleutheraIsl_Ceramic.AG", pop2=c("Pima.DG", "CLM.DG", "Chile_Conchali_700BP.AG"), pop3=source3, pop4="Mbuti.DG")
f4_results_p3_4 <- f4(f2_blocks_p3, pop1="Chile_Conchali_700BP.AG", pop2=c("Pima.DG", "CLM.DG", "Bahamas_EleutheraIsl_Ceramic.AG"), pop3=source3, pop4="Mbuti.DG")


#### qpWave: test rank (how many ancestry streams are needed). Run one per each target population
wave_p3_1 <- qpwave(f2_blocks_p3,
                left = c(target3[1], source3),
                right = outgroup3)

wave_p3_2 <- qpwave(f2_blocks_p3,
                left = c(target3[2], source3),
                right = outgroup3)

wave_p3_3 <- qpwave(f2_blocks_p3,
                left = c(target3[3], source3),
                right = outgroup3)

wave_p3_4 <- qpwave(f2_blocks_p3,
                left = c(target3[4], source3),
                right = outgroup3)

wave_p3_5 <- qpwave(f2_blocks_p3,
                left = c(target3[1],"USA_Ancient_Beringian.SG","India_GreatAndaman_100BP.SG"),
                right = outgroup3)
wave_p3_6 <- qpwave(f2_blocks_p3,
                left = c(target3[2],"USA_Ancient_Beringian.SG","India_GreatAndaman_100BP.SG"),
                right = outgroup3)
wave_p3_7 <- qpwave(f2_blocks_p3,
                left = c(target3[3],"USA_Ancient_Beringian.SG","India_GreatAndaman_100BP.SG"),
                right = outgroup3)
wave_p3_8 <- qpwave(f2_blocks_p3,
                left = c(target3[4],"USA_Ancient_Beringian.SG","India_GreatAndaman_100BP.SG"),
                right = outgroup3)
wave_p3_1
wave_p3_2
wave_p3_3
wave_p3_4
wave_p3_5
wave_p3_6
wave_p3_7
wave_p3_8

#### qpAdm: 2 or 3-way mixture models. Run one per each target populations
admix_2way_p3_1 <- qpadm(f2_blocks_p3, left = c(target3[1], source3[1:2]), right = outgroup3, target=target3[1])
admix_2way_p3_2 <- qpadm(f2_blocks_p3, left = c(target3[2], source3[1:2]), right = outgroup3, target=target3[2])
admix_2way_p3_3 <- qpadm(f2_blocks_p3, left = c(target3[3], source3[1:2]), right = outgroup3, target=target3[3])
admix_2way_p3_4 <- qpadm(f2_blocks_p3, left = c(target3[4], source3[1:2]), right = outgroup3, target=target3[4])

View(admix_2way_p3_1$weights)
View(admix_2way_p3_2$weights)
View(admix_2way_p3_3$weights)
View(admix_2way_p3_4$weights)
