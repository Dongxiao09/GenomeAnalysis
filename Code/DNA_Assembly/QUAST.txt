#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J Quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#load modules
module load bioinfo-tools
module load quast/5.0.2

#path
INPUT_01="/home/dongx/Genome_Analysis/DNA_Assembly/Canu/Canu_assembly_01/canu_assembly_output_01.contigs.fasta"
OUTPUT_01="/home/dongx/Genome_Analysis/DNA_Assembly/Evaluation/QUAST/canu_quast"

INPUT_02="/home/dongx/Genome_Analysis/DNA_Assembly/Reduction/canu_reduced/contigs.reduced.fa"
OUTPUT_02="/home/dongx/Genome_Analysis/DNA_Assembly/Evaluation/QUAST/redundans_quast"

INPUT_03="//home/dongx/Genome_Analysis/DNA_Assembly/Polish/pilon_polished.fasta"
OUTPUT_03="/home/dongx/Genome_Analysis/DNA_Assembly/Evaluation/QUAST/pilon_quast"

#commands
quast.py $INPUT_01 -o $OUTPUT_01 -f --eukaryote --report-all-metrics
quast.py $INPUT_02 -o $OUTPUT_02 -f --eukaryote --report-all-metrics
quast.py $INPUT_03 -o $OUTPUT_03 -f --eukaryote --report-all-metrics

