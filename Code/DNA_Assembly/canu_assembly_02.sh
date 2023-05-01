#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 18:00:00
#SBATCH -J canu_assembly_02
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se


#Load modules
module load bioinfo-tools
module load canu/2.0

INPUT="/domus/h1/dongx/Genome_Analysis/Raw_Data/SRR6037732_scaffold_10.fq.gz"
OUTPUT="/domus/h1/dongx/Genome_Analysis/DNA_Assembly/Canu"

#commands
canu -p canu_assembly_output_02 -d $OUTPUT maxThreads=4 genomeSize=24.1m  corOutCoverage=200 "batOptions=-dg 3 -db 3 -dr 1 -ca 500 -cp 50" -pacbio-raw $INPUT

#Avoid collapsing the genome so you end up with double (assuming diploid) the genome size as long as your divergence is above about 2% (for PacBio data). Below this divergence, you’d end up collapsing the variations. We’ve used the following parameters for polyploid populations (PacBio data)
This will output more corrected reads (than the default 40x). The latter option will be more conservative at picking the error rate to use for the assembly to try to maintain haplotype separation. If it works, you’ll end up with an assembly >= 2x your haploid genome size. Post-processing using gene information or other synteny information is required to remove redundancy from this assembly.
