#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J trimmed_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#Load modules
module load bioinfo-tools
module load trimmomatic/0.39

#variables
FORWARD="/home/dongx/Genome_Analysis/Raw_Data/SRR6040095_scaffold_10.1.fastq.gz"
REVERSE="/home/dongx/Genome_Analysis/Raw_Data/SRR6040095_scaffold_10.2.fastq.gz"
PREFIX="SRR6040095_scaffold_10"

#command
java -jar $TRIMMOMATIC_ROOT/trimmomatic.jar PE $FORWARD $REVERSE ${PREFIX}.1P.fastq.gz ${PREFIX}.1U.fastq.gz  ${PREFIX}.2P.fastq.gz ${PREFIX}.2U.fastq.gz  ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
