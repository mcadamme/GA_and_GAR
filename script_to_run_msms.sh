#script to run msms
#10292019


cd /home/megan/ms_sims

#simulating initial pop based on No = 600, u = 2e-9 (from Anderson et al. 2018), and r (from Martin et al. 2019).
#java -jar /home/megan/src/msms/lib/msms.jar 20 1000 -N 600 -t 0.19 -r 3.8

#Basic model, Adding switches & outputting msms file
java -jar /home/megan/src/msms/lib/msms.jar 20 1000 -N 600 -t 0.19 -r 3.8 -I 4 5 5 5 5 \
-em 0.01 3 4 12.5 -em 0.01 4 3 12.5 -em 0.014 1 2 12.5 -em 0.014 2 1 12.5 \
-ej 0.0104 3 4 -ej 0.0146 1 2 \
-em 0.015 2 4 50.0 \
-en 0.0154 2 1.5 \
-en 0.0154 4 1.5 \
-em 0.0154 2 4 0 \
-ej 0.028 4 2 \
-en 0.029 2 0.1 \
-en 0.03 2 167 > /home/megan/ms_sims/ms_neutralModel_sim.txt


#modified model based on YC comments with equal number generations (n = 72) run on 11/8/2019
java -jar /home/megan/src/msms/lib/msms.jar 20 10000 -N 600 -t 0.19 -r 3.8 -I 4 5 5 5 5 \
-em 0.0004 3 4 25.0 -em 0.0004 4 3 25.0 -em 0.0004 1 2 25.0 -em 0.0004 2 1 25.0 \
-ej 0.0146 3 4 -ej 0.0146 1 2 \
-em 0.015 2 4 50.0 \
-en 0.0154 2 1 \
-en 0.0154 4 1 \
-em 0.0154 2 4 0 \
-en 0.0171 4 2.4 \
-en 0.0175 4 1 \
-en 0.0183 4 1.8 \
-en 0.0188 4 1 \
-en 0.0200 4 0.68 \
-en 0.0204 4 1 \
-en 0.0213 4 0.36 \
-en 0.0217 4 1 \
-en 0.0225 4 0.53 \
-en 0.0229 4 1 \
-en 0.0241 4 0.34 \
-en 0.0246 4 1 \
-en 0.0254 4 0.26 \
-en 0.0258 4 1 \
-en 0.0271 4 0.18 \
-en 0.0275 4 1 \
-en 0.0283 4 0.16 \
-ej 0.0288 4 2 \
-en 0.0288 2 1 \
-en 0.0296 2 0.3 \
-en 0.03 2 167 > /home/megan/ms_sims/orig_sim/ms_neutralModel_simYC.txt

#modified model based on YC comments with half pop size per gen, except first
java -jar /home/megan/src/msms/lib/msms.jar 20 10000 -N 300 -t 0.096 -r 3.8 -I 4 5 5 5 5 \
-em 0.00083 3 4 25.0 -em 0.00083 4 3 25.0 -em 0.00083 1 2 25.0 -em 0.00083 2 1 25.0 \
-ej 0.0292 3 4 -ej 0.0292 1 2 \
-em 0.03 2 4 50.0 \
-en 0.0308 2 1 \
-en 0.0308 4 1 \
-em 0.0308 2 4 0 \
-en 0.0342 4 2.4 \
-en 0.035 4 1 \
-en 0.0367 4 1.8 \
-en 0.0375 4 1 \
-en 0.04 4 0.68 \
-en 0.0408 4 1 \
-en 0.0425 4 0.36 \
-en 0.0433 4 1 \
-en 0.045 4 0.53 \
-en 0.0458 4 1 \
-en 0.0483 4 0.34 \
-en 0.0491 4 1 \
-en 0.0508 4 0.26 \
-en 0.0517 4 1 \
-en 0.0542 4 0.18 \
-en 0.055 4 1 \
-en 0.0567 4 0.16 \
-ej 0.0575 4 2 \
-en 0.0575 2 1 \
-en 0.0592 2 0.3 \
-en 0.06 2 167 > /home/megan/ms_sims/extra_sims/Half_gen_size/ms_neutralModel_simYC_half.txt


#modified model based on YC comments with quarter pop size per gen, except first
java -jar /home/megan/src/msms/lib/msms.jar 20 10000 -N 150 -t 0.048 -r 3.8 -I 4 5 5 5 5 \
-em 0.0002 3 4 25.0 -em 0.0002 4 3 25.0 -em 0.0002 1 2 25.0 -em 0.0002 2 1 25.0 \
-ej 0.0583 3 4 -ej 0.0583 1 2 \
-em 0.06 2 4 50.0 \
-en 0.0617 2 1 \
-en 0.0617 4 1 \
-em 0.0617 2 4 0 \
-en 0.0683 4 2.4 \
-en 0.07 4 1 \
-en 0.0734 4 1.8 \
-en 0.075 4 1 \
-en 0.08 4 0.68 \
-en 0.0816 4 1 \
-en 0.085 4 0.36 \
-en 0.086 4 1 \
-en 0.09 4 0.53 \
-en 0.0916 4 1 \
-en 0.0966 4 0.34 \
-en 0.0982 4 1 \
-en 0.1016 4 0.26 \
-en 0.1034 4 1 \
-en 0.1084 4 0.18 \
-en 0.11 4 1 \
-en 0.1134 4 0.16 \
-ej 0.115 4 2 \
-en 0.115 2 1 \
-en 0.1184 2 0.3 \
-en 0.120 2 167 > /home/megan/ms_sims/extra_sims/Quart_gen_size/ms_neutralModel_simYC_quart.txt



#Half founder pop size, and number generations (n = 72) run on 11/22/2019
java -jar /home/megan/src/msms/lib/msms.jar 20 10000 -N 600 -t 0.19 -r 3.8 -I 4 5 5 5 5 \
-em 0.0004 3 4 25.0 -em 0.0004 4 3 25.0 -em 0.0004 1 2 25.0 -em 0.0004 2 1 25.0 \
-ej 0.0146 3 4 -ej 0.0146 1 2 \
-em 0.015 2 4 50.0 \
-en 0.0154 2 1 \
-en 0.0154 4 1 \
-em 0.0154 2 4 0 \
-en 0.0171 4 2.4 \
-en 0.0175 4 1 \
-en 0.0183 4 1.8 \
-en 0.0188 4 1 \
-en 0.0200 4 0.68 \
-en 0.0204 4 1 \
-en 0.0213 4 0.36 \
-en 0.0217 4 1 \
-en 0.0225 4 0.53 \
-en 0.0229 4 1 \
-en 0.0241 4 0.34 \
-en 0.0246 4 1 \
-en 0.0254 4 0.26 \
-en 0.0258 4 1 \
-en 0.0271 4 0.18 \
-en 0.0275 4 1 \
-en 0.0283 4 0.16 \
-ej 0.0288 4 2 \
-en 0.0288 2 1 \
-en 0.0296 2 0.15 \
-en 0.03 2 167 > /home/megan/ms_sims/extra_sims/Half_Founder/ms_neutralModel_simYC_halfFound.txt

#Quarter founder pop size, and number generations (n = 72) run on 11/22/2019
java -jar /home/megan/src/msms/lib/msms.jar 20 10000 -N 600 -t 0.19 -r 3.8 -I 4 5 5 5 5 \
-em 0.0004 3 4 25.0 -em 0.0004 4 3 25.0 -em 0.0004 1 2 25.0 -em 0.0004 2 1 25.0 \
-ej 0.0146 3 4 -ej 0.0146 1 2 \
-em 0.015 2 4 50.0 \
-en 0.0154 2 1 \
-en 0.0154 4 1 \
-em 0.0154 2 4 0 \
-en 0.0171 4 2.4 \
-en 0.0175 4 1 \
-en 0.0183 4 1.8 \
-en 0.0188 4 1 \
-en 0.0200 4 0.68 \
-en 0.0204 4 1 \
-en 0.0213 4 0.36 \
-en 0.0217 4 1 \
-en 0.0225 4 0.53 \
-en 0.0229 4 1 \
-en 0.0241 4 0.34 \
-en 0.0246 4 1 \
-en 0.0254 4 0.26 \
-en 0.0258 4 1 \
-en 0.0271 4 0.18 \
-en 0.0275 4 1 \
-en 0.0283 4 0.16 \
-ej 0.0288 4 2 \
-en 0.0288 2 1 \
-en 0.0296 2 0.08 \
-en 0.03 2 167 > /home/megan/ms_sims/extra_sims/Quart_Founder/ms_neutralModel_simYC_quartFound.txt


