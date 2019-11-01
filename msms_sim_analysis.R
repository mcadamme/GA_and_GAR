#Script to get distribution of FST values under neutral model using MSMS simulated genos
#103012019


setwd("~/ms_sims/")

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

file.names <- dir("./", pattern ="output.txt")
for(i in 1:length(file.names)){
  
  df <- read.csv(file.names[i], header = F)
  #df <- read.csv("999.txt_output.txt", header = F)

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


write.table(out.file, "FST_msSims.out", row.names = F, col.names = F)

out.file_num <- as.numeric(as.character(out.file[-1,]))
Prob <- sum(out.file_num > 0.44)#lowest 40kb FST val in Cad86c region
print(Prob)

png(filename = "Dist_Fst_Neutral.png", units = "px", height = 600, width = 700)
hist(out.file_num, breaks = 100, xlim = c(-0.1, 0.2), ylim = c(0,100))
dev.off()


