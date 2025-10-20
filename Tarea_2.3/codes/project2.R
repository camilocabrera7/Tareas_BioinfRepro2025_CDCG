# Project 2: Steppe formation model

## Modify names to match your dataset!

#### Load packages:
library(admixtools)
library(tidyverse)

#### Get f2_blocks. Only once for the entire project

target2 <- c("Russia_MLBA_Sintashta.AG", "Kazakhstan_Maitan_MLBA_Alakul.AG", "Russia_LBA_Srubnaya_Alakul.SG")
source2 <- c("Iran_GanjDareh_N.AG", "Russia_Sidelkino_HG.SG")
outgroup2 <- c("Mbuti.DG", "CHB.DG", "Papuan.DG", "Russia_UstIshim_IUP.DG", "Denisova.DG")


all_pops_p2 <- c(target2, source2, outgroup2)
prefix <- "v62.0_1240k_public"
outdir <- "aadr_1000G_f2_proyect2"

extract_f2(pref = prefix,
           outdir = outdir,
           pops = all_pops_p2,          # only populations to analyze
           overwrite = TRUE,
           blgsize = 0.05,            # block size in Morgans (default fine)
           verbose = TRUE)

#### Load f2_blocks
f2_blocks_p2 <- f2_from_precomp(outdir)

#### Outgroup-f3: shared drift between target and sources
#pop1=outgroup; pop2=target groups or populations; pop3=the ones to test shared drift with

f3_results_p2 <- f3(f2_blocks_p2, pop1="Mbuti.DG", pop2=target2, pop3=source2)


#### f4 tests: asymmetry checks. Are target populations closer to any of the potential sources?. Run one per each target population

f4_results_p2_1 <- f4(f2_blocks_p2, pop1="Russia_MLBA_Sintashta.AG", pop2= c("Kazakhstan_Maitan_MLBA_Alakul.AG", "Russia_LBA_Srubnaya_Alakul.SG"), pop3=source2, pop4="Mbuti.DG")
f4_results_p2_2 <- f4(f2_blocks_p2, pop1="Kazakhstan_Maitan_MLBA_Alakul.AG", pop2= c("Russia_MLBA_Sintashta.AG", "Russia_LBA_Srubnaya_Alakul.SG"), pop3=source2, pop4="Mbuti.DG")
f4_results_p2_3 <- f4(f2_blocks_p2, pop1="Russia_LBA_Srubnaya_Alakul.SG", pop2= c("Russia_MLBA_Sintashta.AG", "Kazakhstan_Maitan_MLBA_Alakul.AG"), pop3=source2, pop4="Mbuti.DG")


#### qpWave: test rank (how many ancestry streams are needed). Run one per each target population
wave_p2_1 <- qpwave(f2_blocks_p2,
                left = c(target2[3], source2),
                right = outgroup2)

wave_p2_2 <- qpwave(f2_blocks_p2,
                    left = c(target2[2], source2),
                    right = outgroup2)

wave_p2_3 <- qpwave(f2_blocks_p2,
                    left = c(target2[1], source2),
                    right = outgroup2)

wave_p2_1
wave_p2_2
wave_p2_3

#### qpAdm: 2-way mixture models. Run one per each target populations
admix_2way_p2_1 <- qpadm(f2_blocks_p2, left = c(target2[1], source2), right = outgroup2, target=target2[1])
admix_2way_p2_2 <- qpadm(f2_blocks_p2, left = c(target2[2], source2), right = outgroup2, target=target2[2])
admix_2way_p2_3 <- qpadm(f2_blocks_p2, left = c(target2[3], source2), right = outgroup2, target=target2[3])

View(admix_2way_p2_1$weights)
View(admix_2way_p2_2$weights)
View(admix_2way_p2_3$weights)

