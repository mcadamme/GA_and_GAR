#this is my script to plot the FST distributions for my simulations
#11/8/2019 M. Fritz

data_1 <- read.table("~/ms_sims/FST_msSims1.out", header = F)
data_2 <- read.table("~/ms_sims/FST_msSims2.out", header = F)

#checking to make sure I grabbed the right half of the sims for each of these
tail(data_1, n = 1)
head(data_2, n = 1)

full_data <- rbind(head(data_1, n = 5000), data_2)
nrow(full_data)

out.file_num <- as.numeric(as.character(full_data[-1,]))
Prob <- sum(out.file_num > 0.44)#lowest 40kb FST val in Cad86c region
print(Prob)

png(filename = "~/ms_sims/Dist_Fst_Neutral_Final.png", units = "px", height = 600, width = 700)
xlab.text = expression('F'['ST']*' value')
hist(out.file_num, breaks = 100, xlim = c(-0.1, 0.4), ylim = c(0,600), main = "", ylab = "Frequency", xlab = xlab.text, cex.lab = 1.3)
dev.off()