#new plot for FST and Hp
#02142019 MF

library(CMplot)

#getting numbers of snps per window
num_snps <- read.table("~/Downloads/num_SNPs.txt", header = F)
num_snps$scaf_win <- paste(num_snps$V1,"_",num_snps$V2)

#generating cmplot compatible Hp dataset
res_min<-read.table("~/Downloads/res_count_min.txt", header=FALSE)
res_maj<-read.table("~/Downloads/res_count_maj.txt", header=FALSE)
res_min$scaf_win <- paste(res_min$V1,"_",res_min$V2)
res_maj$scaf_win <- paste(res_maj$V1,"_",res_maj$V2)

merged_res <- merge(res_maj, res_min, by = "scaf_win")

merged_res$het_pool_res<-2*(merged_res$V5.x*merged_res$V5.y)/(merged_res$V5.x+merged_res$V5.y)^2
merged_res$ztrans_Hp <- scale(merged_res$het_pool_res, center = TRUE, scale = TRUE)

merged_numSNPs <- merge(merged_res, num_snps, by = "scaf_win")
outliers_Hp <- subset(merged_numSNPs, ztrans_Hp <= -6 & V5 >=10) #note that this list of scaffolds and windows matches the 38 rows of TableS5


#getting fst vals
fst <- read.table("~/Downloads/window_fst_mean.txt", header = F)
fst$ztrans <- scale(fst$V5, center = TRUE, scale = TRUE)
fst$scaf_win <- paste(fst$V1,"_",fst$V2)

#merging datasets
merged_all <-merge(merged_numSNPs, fst, by = "scaf_win")
merged_all$win <- seq(1:(nrow(merged_all)))

final <- data.frame(merged_all[,c(1:4,12:13,18,23:25)])

no_low <- subset(final,  V5.x >= 10) 

for_plot1 <- data.frame(cbind(no_low$win, no_low$V1.x, no_low$V2.x, no_low$ztrans))
for_plot2 <- data.frame(cbind(no_low$win, no_low$V1.x, no_low$V2.x, no_low$ztrans_Hp))


outliers_Hp_FST <- subset(no_low, ztrans_Hp <= -6 & ztrans >= 1)

#generating plots
CMplot(for_plot1, plot.type="m", type = "p", r=1.6, cir.legend=TRUE, col = c("grey45","grey60"), cex = 0.5, ylim = c(0, 5.0),
       file="jpg", memo="FST", dpi=300, threshold = NULL, LOG10 = F, highlight = outliers_Hp_FST$win, ylab = expression('ZF'[ST]), xlab = "")

CMplot(for_plot2, plot.type="m", type = "p", r=1.6, cir.legend=TRUE, col = c("grey45","grey60"), cex = 0.5, ylim = c(-10.0, 0),
       file="jpg", memo="HP", dpi=300, threshold = NULL, LOG10 = F, highlight = outliers_Hp_FST$win, ylab = expression('ZH'[p]), xlab = "")

hist(no_low$ztrans, breaks = 100, ylim = c(0,800), xlab = expression('ZF'[ST]), main = "")
hist(no_low$ztrans_Hp, breaks = 100, ylim = c(0,4000), xlab = expression('ZH'[p]), main = "")
