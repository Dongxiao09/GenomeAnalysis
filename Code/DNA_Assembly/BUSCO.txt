#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J BUSCO
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#load modules
module load bioinfo-tools
module load BUSCO/5.3.1

#path
INPUT_01="/home/dongx/Genome_Analysis/DNA_Assembly/Canu/Canu_assembly_01/canu_assembly_output_01.contigs.fasta"
OUTPUT_01="/home/dongx/Genome_Analysis/DNA_Assembly/Evaluation/BUSCO/canu_busco"

INPUT_02="/home/dongx/Genome_Analysis/DNA_Assembly/Reduction/canu_reduced/contigs.reduced.fa"
OUTPUT_02="/home/dongx/Genome_Analysis/DNA_Assembly/Evaluation/BUSCO/redundans_busco"

INPUT_03="//home/dongx/Genome_Analysis/DNA_Assembly/Polish/pilon_polished.fasta"
OUTPUT_03="/home/dongx/Genome_Analysis/DNA_Assembly/Evaluation/BUSCO/pilon_busco"

#commands
run_BUSCO.py -i $INPUT_01 -l $BUSCO_LINEAGE_SETS/eudicots_odb10 -o $OUTPUT_01 -m genome 
run_BUSCO.py -i $INPUT_02 -l $BUSCO_LINEAGE_SETS/eudicots_odb10 -o $OUTPUT_02 -m genome
run_BUSCO.py -i $INPUT_03 -l $BUSCO_LINEAGE_SETS/eudicots_odb10 -o $OUTPUT_03 -m genome

