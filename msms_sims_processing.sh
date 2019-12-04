#This is the bash script I used to process my msms_simulation file to get Fst values.  It relies on several R scripts, which must be accessible to calculate and plot FST values for each simulation.

#paths to files must change depending on which dataset is being used
#splitting files into unique genotype matrices

cd /PATH/TO/FILE
cat ./[FILENAME.txt] | awk 'BEGIN {RS="//";FS="\n";OFS="\n"}{$1=$2=$3="";print $0 > NR ".txt"}'


#for some reason added awk produced an extra file, so I am removing.
rm ./1.txt


#adding delimiter for each snp
for file in *.txt;
do
cat $file | gawk '{$1=$1}1' FPAT='.{1}' OFS=, > "$file"_output.txt
done

rm ./[FILENAME.txt]_output.txt


#Next, generating FST distributions - can run these in parallel.

#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart1.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart2.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart3.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart4.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart5.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart6.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart7.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart8.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart9.R
#R CMD BATCH /home/megan/scripts/Tabashnik_work/msms_sim_analysis_FSTvalsPart10.R



