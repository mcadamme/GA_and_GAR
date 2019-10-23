#This is my script to calculate the BCa boostraps for observed heterozygosity for each population.

library(adegenet); library(vcfR); library(hierfstat); library(bootstrap); library(reshape2); library(ggplot2); library(StAMPP)

setwd("/media/megan/New Volume/Tabash_WGS_subs")


is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

for (vcf_file in c("Filt_5000.vcf.recode.vcf","Filt_10000.vcf.recode.vcf","Filt_25000.vcf.recode.vcf","Filt_50000.vcf.recode.vcf","Filt_100000.vcf.recode.vcf")){
  data <- read.vcfR(vcf_file)
  #data <- read.vcfR("Filt_100000.vcf.recode.vcf")#to test outside of loop
  data_genind <- vcfR2genind(data) #converts file format
  data_genind@pop <- as.factor(c(1,1,1,2,2,1,2,2,2,1))
  print(vcf_file)
  
  
  All_hier <- genind2hierfstat(data_genind, pop = data_genind@pop)
  sum_data_All_hier <- basic.stats(All_hier)
 
  #error starts here
  locus <- rownames(sum_data_All_hier$Ho) 
  Hets_wide <- data.frame(cbind(locus, sum_data_All_hier$Ho, sum_data_All_hier$Hs))
  colnames(Hets_wide)<-c("locus","Res_Hobs", "Sus_Hobs", "Res_Hexp", "Sus_Hexp")
  Hets_wide$Res_Hobs <- as.numeric(as.character(Hets_wide$Res_Hobs))
  Hets_wide$Sus_Hobs <- as.numeric(as.character(Hets_wide$Sus_Hobs))
  Hets_wide$Res_Hexp <- as.numeric(as.character(Hets_wide$Res_Hexp))
  Hets_wide$Sus_Hexp <- as.numeric(as.character(Hets_wide$Sus_Hexp))
  Hets_wide <- na.omit(Hets_wide)
  
  
  
  FIS_wide <- data.frame(cbind(locus, sum_data_All_hier$Fis))
  colnames(FIS_wide)<-c("locus","R", "S")
  FIS_wide$R <- as.numeric(as.character(FIS_wide$R))
  FIS_wide$S <- as.numeric(as.character(FIS_wide$S))
  FIS_wide[is.nan(FIS_wide)] <- 0
  
  wide_all <- merge(Hets_wide, FIS_wide, by = "locus")
  colnames(wide_all)<-c("locus","Res_Hobs", "Sus_Hobs", "Res_Hexp", "Sus_Hexp", "Res_FIS", "Sus_FIS")
  print("Number of SNPs without NAs")
  print(nrow(wide_all))
  
  
  mean_measures <- colMeans(wide_all[,c(2:7)])
  print(mean_measures)
  
  
  #getting confidence intervals on Hobs for Res and Sus, respectively
  Ho_Res <- bcanon(wide_all$Res_Hobs,1000,mean)   
  Ho_Sus <- bcanon(wide_all$Sus_Hobs,1000,mean)
  Hs_Res <- bcanon(wide_all$Res_Hexp,1000,mean)   
  Hs_Sus <- bcanon(wide_all$Sus_Hexp,1000,mean)
  
  print(Ho_Res$confpoints)
  print(Ho_Sus$confpoints)
  print(Hs_Res$confpoints)
  print(Hs_Sus$confpoints)
  
  #getting FIS plus bootstrapped confint
  all_FIS_CIs <- boot.ppfis(dat=All_hier,nboot=1000,quant=c(0.025,0.975),diploid=TRUE,dig=4)
  print(all_FIS_CIs)
  
  FIS_Res <- bcanon(wide_all$Res_FIS,1000,mean)   
  FIS_Sus <- bcanon(wide_all$Sus_FIS,1000,mean)
  print(FIS_Res$confpoints)
  print(FIS_Sus$confpoints)
  
  # create violin plot for each measure of heterozygosity and inbreeding for each vcf file
  long_form <- melt(wide_all, id.vars=c("locus"))
  
  plot <- 
    ggplot(long_form, aes(x=variable, y=value)) +
    geom_violin()

  #save plots as .png
  ggsave(plot, file=paste(vcf_file, ".png", sep=''), scale=2)
  
  
  #Getting pairwise genetic distances with confint
  data_genlite <- vcfR2genlight(data, n.cores = 3)
  data_genlite$pop <- as.factor(c(1,1,1,2,2,1,2,2,2,1))
  data_stampp <- stamppConvert(data_genlite, type = "genlight")
  
  data_stampp_R <- data_stampp[c(1:3,6,10),]
  data_stampp_S <- data_stampp[c(4,5,7:9),]
  
  Res.D.ind <- stamppNeisD(data_stampp_R, FALSE)
  Sus.D.ind <- stamppNeisD(data_stampp_S, FALSE)
  print("Mean genetic distances between individuals for resistant and susceptible populations are:")
  print(mean(Res.D.ind))
  print(mean(Sus.D.ind))
  
  D_Res <- bcanon(Res.D.ind,1000,mean)   
  D_Sus <- bcanon(Sus.D.ind,1000,mean)
  
  print(D_Res$confpoints)
  print(D_Sus$confpoints)
  
}