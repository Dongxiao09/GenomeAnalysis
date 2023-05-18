
#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 18:00:00
#SBATCH -J Braker_Annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

#load modules
module load bioinfo-tools
module load braker/2.1.6
module load GeneMark/4.68-es

source $AUGUSTUS_CONFIG_COPY
cp -vf /sw/bioinfo/GeneMark/keyfile/gm_key /home/dongx/.gm_key

#Paths
GENOME="/home/dongx/Genome_Analysis/Genome_Annotation/Repeat_Masker/pilon_polished.fasta.masked"
BAM_DIR="/home/dongx/Genome_Analysis/Genome_Annotation/STAR/"
declare -a Bam_list=("SRR6040092_10.sorted.bamAligned.sortedByCoord.out.bam" "SRR6040093_10.sorted.bamAligned.sortedByCoord.out.bam" "SRR6040094_10.sorted.bamAligned.sortedByCoord.out.bam" "SRR6040096_10.sorted.bamAligned.sortedByCoord.out.bam" "SRR6040097_10.sorte.sorted.bamAligned.sortedByCoord.out.bam" "SRR6156066_10.sorted.bamAligned.sortedByCoord.out.bam" "SRR6156067_10.sorted.bamAligned.sort.sort.sortedByCoord.out.bam" "SRR6156069_10.sorted.bamAligned.sortedByCoord.out.bam")

#Commands
 braker.pl --cores 8 --species=durian  --genome $GENOME --bam=${BAM_DIR}/${Bam_list[1]}, ${BAM_DIR}/${Bam_list[2]}, ${BAM_DIR}/${Bam_list[3]}, ${BAM_DIR}/${Bam_list[4]},${BAM_DIR}/${Bam_list[5]}, ${BAM_DIR}/${Bam_list[6]}, ${BAM_DIR}/${Bam_list[7]}, ${BAM_DIR}/${Bam_list[8]} --gff3 --softmasking

