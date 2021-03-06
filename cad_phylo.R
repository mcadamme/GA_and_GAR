#this is the code I used for my phylogenetic analysis of cadherin genes
#any cDNA sequences were translated in expasy, 
#then protein sequences were aligned by clustalomega
#05/30/2019
#MF

library(ape)
library(phangorn)
library(seqinr)

#reading in alignment and getting std seqinr distances
cadherins <- read.alignment("~/Downloads/muscle-cadherin2.aln", format = "clustal")
aa_dist <- dist.alignment(cadherins, matrix = c("identity"))

cadherins_phydat <- as.phyDat(cadherins, type = "AA")

mt <- modelTest(cadherins_phydat, model = c("WAG", "JTT", "LG", "Dayhoff"))
min(mt$BIC)

#modeling two best
aa_dist2 <- dist.ml(cadherins_phydat, model = "LG")
aa_dist3 <- dist.ml(cadherins_phydat, model = "WAG")

aadist2_UPGMA <- upgma(aa_dist2)
aadist2_NJ <- NJ(aa_dist2)

aadist3_UPGMA <- upgma(aa_dist3)
aadist3_NJ <- NJ(aa_dist3)

#looking at best trees - UPGMA have best parsimony scores, but evidence in literature that NJ trees are more accurate, so using those.
parsimony(aadist2_NJ, data = cadherins_phydat)
parsimony(aadist2_UPGMA, data = cadherins_phydat)
parsimony(aadist3_NJ, data = cadherins_phydat)
parsimony(aadist3_UPGMA, data = cadherins_phydat)


#plotting two tree types for two best models protein evolution for EDA
plot(aadist2_UPGMA, main = "aadist2_UPGMA")
plot(aadist2_NJ, main = "aadist2_NJ")

plot(aadist3_UPGMA, main = "aadist3_UPGMA")
plot(aadist3_NJ, main = "aadist3_NJ")

#getting bootstrap support for the tree
fit <- pml(aadist3_NJ, cadherins_phydat)
print(fit)
fit_LG <- optim.pml(fit, model = "WAG", rearrangement = "NNI")
logLik(fit_LG)
bs <- bootstrap.pml(fit_LG, bs=1000, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))


#final plot
treeBS <- plotBS(midpoint(fit_LG$tree), bs, p = 10, type="p", cex = 1.1, bs.col = "red",  bs.adj = c(1.8, 0.9))
add.scale.bar()