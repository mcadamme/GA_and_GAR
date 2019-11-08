#script to run msms
#10292019


cd /home/megan/ms_sims

#simulating initial pop based on No = 600, u = 2e-9 (from Anderson et al. 2018), and r (from Martin et al. 2019).
#java -jar /home/megan/src/msms/lib/msms.jar 20 1000 -N 600 -t 0.19 -r 3.8

#Adding switches & outputting msms file
java -jar /home/megan/src/msms/lib/msms.jar 20 1000 -N 600 -t 0.19 -r 3.8 -I 4 5 5 5 5 \
-em 0.01 3 4 12.5 -em 0.01 4 3 12.5 -em 0.014 1 2 12.5 -em 0.014 2 1 12.5 \
-ej 0.0104 3 4 -ej 0.0146 1 2 \
-em 0.015 2 4 50.0 \
-en 0.0154 2 1.5 \
-en 0.0154 4 1.5 \
-em 0.0154 2 4 0 \
-ej 0.028 4 2 \
-eN 0.029 0.1 \
-eN 0.03 167 > /home/megan/ms_sims/ms_neutralModel_sim.txt

#modified model based on YC comments
#java -jar /home/megan/src/msms/lib/msms.jar 20 10000 -N 600 -t 0.19 -r 3.8 -I 4 5 5 5 5 \
#-em 0.01 3 4 25.0 -em 0.01 4 3 25.0 -em 0.014 1 2 25.0 -em 0.014 2 1 25.0 \
#-ej 0.0104 3 4 -ej 0.0146 1 2 \
#-em 0.015 2 4 50.0 \
#-en 0.0154 2 1.5 \
#-en 0.0154 4 0.5 \
#-em 0.0154 2 4 0 \
#-en 0.0171 4 2.4 \
#-en 0.0175 4 1.5 \
#-en 0.0183 4 1.8 \
#-en 0.0188 4 1.5 \
#-en 0.0200 4 0.68 \
#-en 0.0204 4 1.5 \
#-en 0.0213 4 0.36 \
#-en 0.0217 4 1.5 \
#-en 0.0225 4 0.53 \
#-en 0.0229 4 1.5 \
#-en 0.0241 4 0.34 \
#-en 0.0246 4 1.5 \
#-en 0.0254 4 0.26 \
#-en 0.0258 4 1.5 \
#-en 0.0271 4 0.18 \
#-en 0.0275 4 1.5 \
#-en 0.0283 4 0.16 \
#-ej 0.0288 4 2 \
#-eN 0.0288 1 \
#-eN 0.0296 0.1 \
#-eN 0.03 167 > /home/megan/ms_sims/ms_neutralModel_simYC.txt


#modified model based on YC comments with equal number generations run on 11/8/2019

#I compared FST value distribution using unequal (above) and equal generation times in generations 25-52 for GAR and 35-72 for GA with nsims of 1000. 
#Differences in distributions were very minimal, so using equal gen time (below) with for simplicity.  

 
java -jar /home/megan/src/msms/lib/msms.jar 20 10000 -N 600 -t 0.19 -r 3.8 -I 4 5 5 5 5 \
-em 0.014 3 4 25.0 -em 0.014 4 3 25.0 -em 0.014 1 2 25.0 -em 0.014 2 1 25.0 \
-ej 0.0146 3 4 -ej 0.0146 1 2 \
-em 0.015 2 4 50.0 \
-en 0.0154 2 1.5 \
-en 0.0154 4 0.5 \
-em 0.0154 2 4 0 \
-en 0.0171 4 2.4 \
-en 0.0175 4 1.5 \
-en 0.0183 4 1.8 \
-en 0.0188 4 1.5 \
-en 0.0200 4 0.68 \
-en 0.0204 4 1.5 \
-en 0.0213 4 0.36 \
-en 0.0217 4 1.5 \
-en 0.0225 4 0.53 \
-en 0.0229 4 1.5 \
-en 0.0241 4 0.34 \
-en 0.0246 4 1.5 \
-en 0.0254 4 0.26 \
-en 0.0258 4 1.5 \
-en 0.0271 4 0.18 \
-en 0.0275 4 1.5 \
-en 0.0283 4 0.16 \
-ej 0.0288 4 2 \
-eN 0.0288 1 \
-eN 0.0296 0.1 \
-eN 0.03 167 > /home/megan/ms_sims/ms_neutralModel_simYC.txt

#splitting file into unique genotype matrices
cat /home/megan/ms_sims/ms_neutralModel_simYC.txt | awk 'BEGIN {RS="//";FS="\n";OFS="\n"}{$1=$2=$3="";print $0 > NR ".txt"}'

#for some reason added awk produced an extra file, so I am removing.
rm ./1.txt

#adding delimiter for each snp
for file in *.txt;
do
cat $file | gawk '{$1=$1}1' FPAT='.{1}' OFS=, > "$file"_output.txt
done

rm ./ms_neutralModel_simYC.txt_output.txt
#Next, run msms_sim_analysis.R


