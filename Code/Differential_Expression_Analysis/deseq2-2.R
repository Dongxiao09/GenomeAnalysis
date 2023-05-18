install.packages("BiocManager")
install.packages("readxl")

BiocManager::install("DESeq2")
BiocManager::install("genefilter")

library("DESeq2")
library("gplots")
library("RColorBrewer")
library("genefilter")
library("vsn")
library("ggplot2")
library("cowplot")

#Read in read counts
table_counts <- read.delim('C:/Users/MSI-NB/Desktop/all.xls', header = T, row.names = 1)
View(table_counts)


#Creating matrix with tissue type
SRR <- c('SRR6040092', 'SRR6040093', 'SRR6040094', 'SRR6040096', 'SRR6040097', 'SRR6156066', 'SRR6156067', 'SRR6156069');
tis_type <- c('leaf', 'root', 'MSK_ARIL', 'stem', 'MSK_ARIL', 'MT_ARIL', 'MT_ARIL', 'MT_ARIL');
tissues <- data.frame(tis_type)
#MT means Monthong(golden pillow), MSK means Musang King.

#Converting to a deseq friendly format
rownames(tissues) <- c(SRR)

#DESeq2
dds <- DESeqDataSetFromMatrix(countData = table_counts, colData = tissues, design = ~ tis_type)
dim(dds)
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]
dim(dds)
dds <- DESeq(dds)

#MA Plot
res <- results(dds)
res
plotMA(res, ylim=c(-2,2))

#compare two tis_type group by group
res1 <- results(dds, contrast=c("tis_type","MSK_ARIL","MT_ARIL"))
res2 <- results(dds, contrast=c("tis_type","MSK_ARIL","nonfruit"))
res3 <- results(dds, contrast=c("tis_type","MT_ARIL","nonfruit"))

#analyze expression level of gene, we could do all the res$, or choose some of them to check the results.
res01 <- data.frame(res1, stringsAsFactors = FALSE, check.names = FALSE)
res01 <- res01[order(res01$pvalue, res01$log2FoldChange, decreasing = c(FALSE, TRUE)), ]
res01_up<- res01[which(res01$log2FoldChange >= 1 & res01$pvalue < 0.05),] 
res01_down<- res01[which(res01$log2FoldChange <= -1 & res01$pvalue < 0.05),]
res01_total <- rbind(res01_up,res01_down)


# Regularized-logarithm transform
rld <- rlog(dds, blind = FALSE)
vst <- vst(dds, blind = FALSE)

#Dispersion plot
write.csv(as.data.frame(assay(vst)), file="count_transformation_VST.csv")
write.csv(as.data.frame(assay(rld)), file="count_transformation_rlog.csv")
plotDispEsts(dds)

#Visualize data after standardize
vst1 <- meanSdPlot(assay(vst))
rld1 <- meanSdPlot(assay(rld))
p1 <- vst1$gg+ggtitle("VST")
p2 <- rld1$gg+ggtitle("rlog")
plot_grid(p1, p2,ncol = 2)

#Draw sample distance clustering heatmap
sampleDists <- dist(t(assay(vst)))
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(vst$tis_type, sep="-")
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix, clustering_distance_rows=sampleDists, clustering_distance_cols=sampleDists, col=colors)

#PCA
dev.off()
print(plotPCA(rld, intgroup=c("tis_type")))
print(plotPCA(vst, intgroup=c("tis_type")))

#Heat map with gene clustering
dev.off()
topVarGenes <- head(order(rowVars(assay(rld)), decreasing=TRUE), 10)
heatmap.2(assay(rld)[topVarGenes, ], scale="row", trace="none", dendogram="column", margins=c(8,8), col=colorRampPalette(rev(brewer.pal(9, "RdBu")))(255))
topVarGenes2 <- head(order(rowVars(assay(vst)), decreasing=TRUE), 10)
heatmap.2(assay(vst)[topVarGenes, ], scale="row", trace="none", dendogram="column", margins=c(8,8), col=colorRampPalette(rev(brewer.pal(9, "RdBu")))(255))
