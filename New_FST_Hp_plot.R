#new plot for FST and Hp
#02142019 MF

library(CMplot)

fst <- read.table("~/Downloads/window_fst_mean.txt", header = F)
fst$ztrans <- scale(fst$V5, center = TRUE, scale = TRUE)
fst$scaf_win <- paste(fst$V1,"_",fst$V2)


#generating cmplot compatible Hp dataset
res_min<-read.table("~/Downloads/res_count_min.txt", header=FALSE)
res_maj<-read.table("~/Downloads/res_count_maj.txt", header=FALSE)
res_min$scaf_win <- paste(res_min$V1,"_",res_min$V2)
res_maj$scaf_win <- paste(res_maj$V1,"_",res_maj$V2)

merged_res <- merge(res_maj, res_min, by = "scaf_win")
merged_all <-merge(merged_res, fst)

merged_all$het_pool_res<-2*(merged_all$V5.x*merged_all$V5.y)/(merged_all$V5.x+merged_all$V5.y)^2
merged_all$ztrans_Hp <- scale(het_pool_res, center = TRUE, scale = TRUE)

merged_all$win <- seq(1:(nrow(merged_all)))

for_plot1 <- data.frame(cbind(merged_all$win, merged_all$V1.x, merged_all$V2.x, merged_all$ztrans))
for_plot2 <- data.frame(cbind(merged_all$win, merged_all$V1.x, merged_all$V2.x, merged_all$ztrans_Hp))

outliers <- subset(merged_all, ztrans_Hp < -6 & ztrans > 1)

#generating plots
CMplot(for_plot1, plot.type="m", type = "p", r=1.6, cir.legend=TRUE, col = c("grey45","grey60"), cex = 0.5, ylim = c(0, 5.0),
       file="jpg", memo="FST", dpi=300, threshold = NULL, LOG10 = F, highlight = outliers$win, ylab = expression('ZF'[ST]), xlab = "")

CMplot(for_plot2, plot.type="m", type = "p", r=1.6, cir.legend=TRUE, col = c("grey45","grey60"), cex = 0.5, ylim = c(-10.0, 0),
       file="jpg", memo="HP", dpi=300, threshold = NULL, LOG10 = F, highlight = outliers$win, ylab = expression('ZH'[p]), xlab = "")
