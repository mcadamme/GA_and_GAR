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
-ej 0.028 4 2 \
-eN 0.029 0.1 \
-eN 0.03 167 > /home/megan/ms_sims/ms_neutralModel_sim.txt

#splitting file into 1000 genotype matrices
cat /home/megan/ms_neutralModel_sim.txt | awk 'BEGIN {RS="//";FS="\n";OFS="\n"}{$1=$2=$3="";print $0 > NR ".txt"}'

#for some reason added awk produced an extra file, so I am removing.
rm ./1.txt

#adding delimiter for each snp
for file in *.txt;
do
cat $file | gawk '{$1=$1}1' FPAT='.{1}' OFS=, > "$file"_output.txt
done

#Next, run msms_sim_analysis.R


