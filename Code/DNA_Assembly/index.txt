#!/bin/sh

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J Align_index
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#load modules
module load bioinfo-tools
module load bwa/0.7.17
module load samtools
module load BEDTools

#path
REF="/home/dongx/Genome_Analysis/DNA_Assembly/Reduction/canu_reduced/contigs.reduced.fa"
INPUT1="/home/dongx/Genome_Analysis/Raw_Data/SRR6058604_scaffold_10.1P.fastq.gz"
INPUT2="/home/dongx/Genome_Analysis/Raw_Data/SRR6058604_scaffold_10.2P.fastq.gz"
OUTPUT="/home/dongx/Genome_Analysis/DNA_Assembly/Polish"

#FM-Index
bwa index $REF
bwa mem -P $REF $INPUT1 $INPUT2 > aln-pe.sam

#bam
samtools view -b aln-pe.sam -o aln-pe.bam
samtools sort -T aln-pe.prefix-o aln-pe.sorted.bam
samtools index aln-pe.sorted.bam

#-p 若无此参数：输入文件只有1个，则进行单端比对；若输入文件有2个，则作为paired reads进行比对。若加入此参数：则仅以第1个文件作为输入(会忽略第二个输入序列文件，把第一个文件当做单端测序的数据进行比对)，该文件必须是read1.fq和read2.fa进行reads交叉的数据。
