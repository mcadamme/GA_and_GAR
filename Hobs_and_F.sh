#script to thin snps in my vcf file and plot Hobs and F.


cd /media/megan/"New Volume"

mkdir Tabash_WGS_subs

vcftools --vcf Tabash_Hzea_filtered_SNPs.vcf --thin 5000 --out ./Tabash_WGS_subs/Filt_5000.vcf --recode

vcftools --vcf Tabash_Hzea_filtered_SNPs.vcf --thin 10000 --out ./Tabash_WGS_subs/Filt_10000.vcf --recode

vcftools --vcf Tabash_Hzea_filtered_SNPs.vcf --thin 25000 --out ./Tabash_WGS_subs/Filt_25000.vcf --recode

vcftools --vcf Tabash_Hzea_filtered_SNPs.vcf --thin 50000 --out ./Tabash_WGS_subs/Filt_50000.vcf --recode

vcftools --vcf Tabash_Hzea_filtered_SNPs.vcf --thin 100000 --out ./Tabash_WGS_subs/Filt_100000.vcf --recode

R CMD BATCH /home/megan/Desktop/script_heterozygosity_pval_Tabash.R


