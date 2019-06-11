#this is the code I used for my phylogenetic analysis of cadherin genes
#any cDNA sequences were translated in expasy, 
#then protein sequences were aligned by clustalomega
#05/30/2019
#MF

library(ape)
library(phangorn)
library(seqinr)

#reading in alignment and getting std seqinr distances
cadherins <- read.alignment("~/Downloads/muscle-cadherin.aln", format = "clustal")
aa_dist <- dist.alignment(cadherins, matrix = c("identity"))

cadherins_phydat <- as.phyDat(cadherins, type = "AA")

mt <- modelTest(cadherins_phydat, model = c("WAG", "JTT", "LG", "Dayhoff"))

#modeling two best
aa_dist2 <- dist.ml(cadherins_phydat, model = "LG")
aa_dist3 <- dist.ml(cadherins_phydat, model = "WAG")

aadist2_UPGMA <- upgma(aa_dist2)
aadist2_NJ <- NJ(aa_dist2)

aadist3_UPGMA <- upgma(aa_dist3)
aadist3_NJ <- NJ(aa_dist3)

#looking at best trees - all have same-ish parsimony scores
parsimony(aadist2_NJ, data = cadherins_phydat)
parsimony(aadist2_UPGMA, data = cadherins_phydat)#these two are same
parsimony(aadist3_NJ, data = cadherins_phydat)
parsimony(aadist3_UPGMA, data = cadherins_phydat)#these two are same


#plotting two tree types for two best models protein evolution for EDA
plot(aadist2_UPGMA, main = "aadist2_UPGMA")
plot(aadist2_NJ, main = "aadist2_NJ")

plot(aadist3_UPGMA, main = "aadist3_UPGMA")
plot(aadist3_NJ, main = "aadist3_NJ")

#getting bootstrap support
fit <- pml(aadist2_NJ, cadherins_phydat)
print(fit)
fit_LG <- optim.pml(fit, model = "LG", rearrangement = "NNI")
logLik(fit_LG)
bs <- bootstrap.pml(fit_LG, bs=1000, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))

#final plot
plotBS(midpoint(fit_LG$tree), bs, p = 30, type="p", bs.col = "red", cex = 1.3, bs.adj = c(1.1, 1.2))


