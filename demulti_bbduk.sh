#!/bin/bash/
## convert PacBio-generated bam file to fastq file
cd /media/megan/Elements2/PacBio_data/PB030_A01_Fritz_5kbPool
bedtools bamtofastq -i m54163_180608_183238.subreads.bam -fq cad5kb.subreads.fastq

## demultiplex by bbduk.sh
~/Documents/Programs/bbmap/bbduk.sh in=cad5kb.subreads.fastq out=unmatched1.fq outm=GA1.fq ref=primer1.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched1.fq out=unmatched2.fq outm=GA2.fq ref=primer2.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched2.fq out=unmatched3.fq outm=GA3.fq ref=primer3.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched3.fq out=unmatched4.fq outm=GA4.fq ref=primer4.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched4.fq out=unmatched5.fq outm=GA5.fq ref=primer5.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched5.fq out=unmatched6.fq outm=GA6.fq ref=primer6.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched6.fq out=unmatched7.fq outm=GA7.fq ref=primer7.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched7.fq out=unmatched8.fq outm=GA8.fq ref=primer8.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched8.fq out=unmatched9.fq outm=GA9.fq ref=primer9.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched9.fq out=unmatched10.fq outm=GA10.fq ref=primer10.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched10.fq out=unmatched11.fq outm=GA11.fq ref=primer11.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched11.fq out=unmatched12.fq outm=GA12.fq ref=primer12.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched12.fq out=unmatched13.fq outm=GA13.fq ref=primer13.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched13.fq out=unmatched14.fq outm=GA14.fq ref=primer14.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched14.fq out=unmatched15.fq outm=GA15.fq ref=primer15.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched15.fq out=unmatched16.fq outm=GA16.fq ref=primer16.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched16.fq out=unmatched17.fq outm=GA17.fq ref=primer17.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched17.fq out=unmatched18.fq outm=GA18.fq ref=primer18.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched18.fq out=unmatched19.fq outm=GA19.fq ref=primer19.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched19.fq out=unmatched20.fq outm=GA20.fq ref=primer20.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched20.fq out=unmatched21.fq outm=GA21.fq ref=primer21.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched21.fq out=unmatched22.fq outm=GA22.fq ref=primer22.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched22.fq out=unmatched23.fq outm=GA23.fq ref=primer23.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched23.fq out=unmatched24.fq outm=GA24.fq ref=primer24.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched24.fq out=unmatched25.fq outm=GA25.fq ref=primer25.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched25.fq out=unmatched26.fq outm=GA26.fq ref=primer26.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched26.fq out=unmatched27.fq outm=GA27.fq ref=primer27.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched27.fq out=unmatched28.fq outm=GA28.fq ref=primer28.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched28.fq out=unmatched29.fq outm=GA29.fq ref=primer29.fa k=18 restrictleft=18 
~/Documents/Programs/bbmap/bbduk.sh in=unmatched29.fq out=unmatched30.fq outm=GA30.fq ref=primer30.fa k=18 restrictleft=18 
