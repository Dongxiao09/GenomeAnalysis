#-v, --verbose         verbose
#--noreduction --noscaffolding --nogapclosing
#-i FASTQ, --fastq FASTQ FASTQ PE / MP files
 #-f FASTA, --fasta FASTA FASTA file with contigs / scaffolds

#!/bin/bash -l

#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 02:00:00
#SBATCH -J redundans
#SBATCH --mail-type=ALL
#SBATCH --mail-user dongxiao.chen.4798@student.uu.se

module load bioinfo-tools
module load Redundans/0.14a-20190509-ffae69e

#command
redundans.py -v -f /home/dongx/Genome_Analysis/DNA_Assembly/Canu/Canu_assembly_01/canu_assembly_output_01.contigs.fasta -o /home/dongx/Genome_Analysis/DNA_Assembly/Reduction/canu_reduced --noscaffolding --nogapclosing

