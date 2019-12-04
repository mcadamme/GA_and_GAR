#line plot comparing FST distributions from different simulations.

library(ggplot2); library(dplyr)

#datasets comparing different generation sizes
data_1 <- read.table("~/ms_sims/orig_sim/FST_msSims1.out", header = F)
data_2 <- read.table("~/ms_sims/orig_sim/FST_msSims2.out", header = F)
data_3 <- read.table("~/ms_sims/extra_sims/Half_gen_size/FST_msSims3.out", header = F)
data_4 <- read.table("~/ms_sims/extra_sims/Half_gen_size/FST_msSims4.out", header = F)
data_5 <- read.table("~/ms_sims/extra_sims/Quart_gen_size/FST_msSims5.out", header = F)
data_6 <- read.table("~/ms_sims/extra_sims/Quart_gen_size/FST_msSims6.out", header = F)

full <- rbind(head(data_1, n = 5000), data_2)
full$sim <- rep("f", times = 10000)
half <- rbind(head(data_3, n = 5000), data_4)
half$sim <- rep("h", times = 10000)
quart <- rbind(head(data_5, n = 5000), data_6)
quart$sim <- rep("q", times = 10000)

df <- data.frame(rbind(full, half, quart))

mu <- tapply(df$V1, df$sim, mean)
mu <-unlist(mu)
sims <- c("f","h","q")
mu2 <- data.frame(cbind(mu, sims))
mu2$mu <- as.numeric(as.character(mu2$mu))


#comparing all three datasets
png(filename = "~/ms_sims/Dist_Fst_Neutral_Final_Lines_diffGenSize_dens.png", units = "px", height = 600, width = 700)
a <- ggplot(df, aes(x = df$V1, fill = df$sim)) +
  scale_fill_manual(name = "Gen Size", labels = c("Full", "Half", "Quart"), values = c("#868686FF", "#0073C2FF", "#EFC000FF")) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  labs(x=expression(F["ST"]*" value"), y=expression("Counts")) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) 

#a + geom_histogram(binwidth = 0.005, alpha = 0.4) +
  a + geom_density(mapping = aes(color = df$sim), data = df, stat = "density", alpha = 0.4) +
  scale_color_manual(name = expression("Mean F"["ST"]), labels = c("Full", "Half", "Quart"), values = c("#868686FF", "#0073C2FF", "#EFC000FF")) +
  geom_vline(aes(xintercept = mu, color = sims), data = mu2, linetype = "dashed")

dev.off()



#datasets comparing different founding pop sizes
data_7 <- read.table("~/ms_sims/extra_sims/Half_Founder/FST_msSims7.out", header = F)
data_8 <- read.table("~/ms_sims/extra_sims/Half_Founder/FST_msSims8.out", header = F)
data_9 <- read.table("~/ms_sims/extra_sims/Quart_Founder/FST_msSims9.out", header = F)
data_10 <- read.table("~/ms_sims/extra_sims/Quart_Founder/FST_msSims10.out", header = F)


half_found <- rbind(head(data_7, n = 5000), data_8)
half_found$sim <- rep("h", times = 10000)
quart_found <- rbind(head(data_9, n = 5000), data_10)
quart_found$sim <- rep("q", times = 10000)

df2 <- data.frame(rbind(full, half_found, quart_found))

mu2 <- tapply(df2$V1, df2$sim, mean)
mu2 <-unlist(mu2)
sims <- c("f","h","q")
mu2_2 <- data.frame(cbind(mu2, sims))
mu2_2$mu2 <- as.numeric(as.character(mu2_2$mu2))


#comparing all three datasets
png(filename = "~/ms_sims/Dist_Fst_Neutral_Final_Lines_diffFound_dens.png", units = "px", height = 600, width = 700)
a <- ggplot(df2, aes(x = df2$V1, fill = df2$sim)) +
  scale_fill_manual(name = "Gen Size", labels = c("Full", "Half", "Quart"), values = c("blue", "purple", "red")) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  labs(x=expression(F["ST"]*" value"), y=expression("Counts")) +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) 

  #a + geom_histogram(binwidth = 0.005, alpha = 0.4) +
  a + geom_density(mapping = aes(color = df$sim), data = df, stat = "density", alpha = 0.4) +
  scale_color_manual(name = expression("Mean F"["ST"]), labels = c("Full", "Half", "Quart"), values = c("blue", "purple", "red")) +
  geom_vline(aes(xintercept = mu2, color = sims), data = mu2_2, linetype = "dashed")

dev.off()

