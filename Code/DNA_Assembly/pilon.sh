#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#load modules
module load bioinfo-tools
module load Pilon/1.24

#path
INPUT_Fasta="/home/dongx/Genome_Analysis/DNA_Assembly/Reduction/canu_reduced/contigs.reduced.fa"
INPUT_BAM="/home/dongx/Genome_Analysis/DNA_Assembly/Polish/aln-pe.sorted.bam"
OUT_PATH="/home/dongx/Genome_Analysis/DNA_Assembly/Polish"

#Make temporary folders while working on snowy
tmpdir=$SNIC_TMP/assemblypilon_polished
mkdir $tmpdir

#Make temporary copies of relevant files while working on snowy
cp $INPUT_Fasta $tmpdir
cp $INPUT_BAM $tmpdir
cp ${INPUT_BAM}.bai $tmpdir
cd $tmpdir

#Command
java -Xmx48G -jar $PILON_HOME/pilon.jar --genome contigs.reduced.fa  --frags aln-pe.sorted.bam --diploid --output pilon_polished

#copy desired files from temporary folder on snowy back to my directory
cp pilon_polished.fasta $OUT_PATH

#--diploid：Sample is from diploid organism; will eventually affect calling of heterozygous SNPs
