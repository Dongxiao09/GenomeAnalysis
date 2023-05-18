#DNA Assembly
1) Genome assembly of Pacbio reads: Canu.
2) Illumina data for quality control: FastQC.
3) Remove redundancy: Redundans.
4) Mapping: BWA
5) Polishing: Pilon
6) quality assessment: QUAST and BUSCO

#RNA Mapping
1) Illumina data for quality control: FastQC.
2) Trimming: Trimmomatic

#Genome Annotation
1) Mapping: STAR(index and alignment)
2) Structure annotation: BRAKER
3) Function annotation: eggNomapper

#Differential Expression Analysis
1) Reads count: HTseq
2) Differential Expression Analysis: DESeq2
