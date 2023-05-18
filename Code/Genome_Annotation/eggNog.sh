#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J Eggnog_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#load module
module load bioinfo-tools
module load eggNOG-mapper/2.1.9

#commands
/sw/bioinfo/eggNOG-mapper/2.1.9/snowy/bin/emapper.py -i /home/dongx/Genome_Analysis/Genome_Annotation/Repeat_Masker/pilon_polished.fasta.masked --itype genome  --output functional_annotation --output_dir /home/dongx/Genome_Analysis/Genome_Annotation/Eggnog --cpu 4