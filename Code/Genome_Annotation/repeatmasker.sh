#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J 9_repeatmasker
#SBATCH -o repeatmasker.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load RepeatMasker/4.1.2-p1

# Your commands
RepeatMasker -pa 2 -species malvaceae -dir /home/mathi/genome_analysis/durianproject/analyses/9_repeatmasker /home/mathi/genome_analysis/durianproject/analyses/6_improvement_pilon/pilon.fasta
