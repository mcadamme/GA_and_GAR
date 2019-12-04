#Script to get distribution of FST values under neutral model using MSMS simulated genos
#103012019


setwd("~/ms_sims/extra_sims/Quart_Founder/")

#Loading packages
x <- c("adegenet", "hierfstat")

lapply(x, FUN = function(X) {
  do.call("library", list(X)) 
})

#function to paste alleles 1 and 2 together on same line.
f <- function(x) {
  s <- seq(2, length(x), 2)
  paste(x[s-1], x[s], sep="|")
}

out.file <- ""

file.names1 <- head(dir("./", pattern ="output.txt"), n=5001)

for(i in 1:length(file.names1)){

  df <- read.csv(file.names1[i], header = F)
  
  # run algorithm for each column
  df2 <- as.data.frame(lapply(df, f), stringsAsFactors=FALSE)
  pop <- c("GA", "GA", "GA", "GA", "GA", "GAR", "GAR", "GAR", "GAR", "GAR")


  df2_genind <- df2genind(df2, pop=pop, sep = "\\|", ploidy = 2)
  df2_genind_sum <- summary(df2_genind)
  df2_hier <- genind2hierfstat(df2_genind, pop = pop)

  FST_mat <- pairwise.WCfst(df2_hier, diploid = T)
  print(FST_mat[1,2])
  out.file <- rbind(out.file, FST_mat[1,2])
}


write.table(out.file, "FST_msSims9.out", row.names = F, col.names = F)

