#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 04:00:00
#SBATCH -J STAR
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#load modules
module load bioinfo-tools
module load star/2.7.9a

#Path
GENOME_DIR="/home/dongx/Genome_Analysis/Genome_Annotation/STAR"
GENOME_FASTA="/home/dongx/Genome_Analysis/Genome_Annotation/Repeat_Masker/pilon_polished.fasta.masked"
RNA_DIR="/home/dongx/Genome_Analysis/raw_data/transcriptome/trimmed"
suffix_1="scaffold_10.1.fastq.gz"
suffix_2="scaffold_10.2.fastq.gz"

#Index
STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $GENOME_DIR \
--genomeFastaFiles $GENOME_FASTA

#Mapping

declare -a arr=("SRR6040092" "SRR6040093" "SRR6040094" "SRR6040096" "SRR6040097" "SRR6156066" "SRR6156067" "SRR6156069")

for pref in "${arr[@]}"
do

echo $pref
echo ${pref}_${suffix_1}

STAR --runThreadN 8 \
--genomeDir $GENOME_DIR \
--readFilesIn ${RNA_DIR}/${pref}_${suffix_1} ${RNA_DIR}/${pref}_${suffix_2} \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard \
--outFileNamePrefix ${pref}_10.sorted.bam

done
