#script to analyze the distribution of AA variants at cad86c for GA and GAR
#MF
#April 30, 2019

Variants <- matrix(c(11,19, 0,1, 0,1, 9,1, 2,0), 2, 5,
              dimnames = list(strain = c("GA", "GA-R"), AAvariant = c("V1", "V2", "V3", "V4", "V5")))
trans_Var <- t(Variants)

fisher.test(trans_Var)
fisher.test(trans_Var, simulate.p.value = TRUE, B = 1e5) #
