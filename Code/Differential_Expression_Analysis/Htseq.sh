#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 4:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#Load modules
module load bioinfo-tools
module load htseq/2.0.2
module load samtools

#Path
OUT_DIR=/home/dongx/Genome_Analysis/DEA/HTSEQ
BAM_DIR=/home/dongx/Genome_Analysis/Genome_Annotation/STAR
GFF3=/home/dongx/Genome_Analysis/Genome_Annotation/BRAKER/braker/braker.gff3

#commands

for file in ${BAM_DIR}/*.bam
do
samtools index $file

done

echo ${BAM_DIR}/*.bam

htseq-count -f bam -r pos -i ID -n 8 -c ${OUT_DIR}/all.tsv ${BAM_DIR}/*.bam $GFF3

	
