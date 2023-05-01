#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 18:00:00
#SBATCH -J canu_assembly_01
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se


#Load modules
module load bioinfo-tools
module load canu/2.0

INPUT="domus/h1/dongx/Genome_Analysis/Raw_Data/SRR6037732_scaffold_10.fq.gz"
OUTPUT="/domus/h1/dongx/Genome_Analysis/DNA_Assembly/Canu"

#commands
canu -p canu_assembly_output_01 -d $OUTPUT maxThreads=4 genomeSize=24.1m -pacbio-raw $INPUT
