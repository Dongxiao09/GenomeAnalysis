#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J repeat_masker
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#Load modules
module load bioinfo-tools
module load RepeatMasker/4.1.2-p1

#path
INPUT="/home/dongx/Genome_Analysis/DNA_Assembly/Polish/pilon_polished.fasta"
OUT_DIR="/home/dongx/Genome_Analysis/Genome_Annotation/Repeat_Masker"

#commands
RepeatMasker $INPUT -species malvaceae -pa 4  -xsmall -gff -dir $OUT_DIR


