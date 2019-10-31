#Script to get distribution of FST values under neutral model using MSMS simulated genos
#103012019

setwd("/home/megan/ms_sims/test")

#function for weir and cockerham's theta goes here'

#for loop using *_output.txt

data <- read.csv("2.txt_output.txt", header = F)
