#this is my script to plot the FST distributions for my simulations
#must change file paths for each simulation
#11/8/2019 M. Fritz

data_1 <- read.table("/PATH/TO/FILE1", header = F)
data_2 <- read.table("/PATH/TO/FILE2", header = F)

#checking to make sure I grabbed the right half of the sims for each of these
print(tail(data_1, n = 1))
print(head(data_2, n = 1))

full_data <- rbind(head(data_1, n = 5000), data_2)
print(nrow(full_data))

out.file_num <- as.numeric(as.character(full_data$V1))
Prob <- sum(out.file_num > 0.44)#lowest 40kb FST val in Cad86c region
print(Prob/10000)

png(filename = "/PATH/TO/OUTFILE/Dist_Fst_Neutral.png", units = "px", height = 600, width = 700)
xlab.text = expression('F'['ST']*' value')
hist(out.file_num, breaks = 25, xlim = c(-0.1, 1), ylim = c(0,2000), main = "", ylab = "Frequency", xlab = xlab.text, cex.lab = 1.3)
dev.off()


