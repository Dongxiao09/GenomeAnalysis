salloc -A uppmax2023-2-8 -M snowy -p core -n 2 -t 01:00:00
module load bioinfo-tools
module spider fastqc
module load FastQC/0.11.9
fastqc -t 2 -o /home/dongx/Genome_Analysis/RNA_Mapping SRR6040095_scaffold_10.1P.fastq.gz
fastqc -t 2 -o /home/dongx/Genome_Analysis/RNA_Mapping SRR6040095_scaffold_10.2P.fastq.gz

firefox SRR6040095_scaffold_10.2P_fastqc.html
