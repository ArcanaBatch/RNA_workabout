#GO plot

#A GO plot is a graphical representation of data that make associations between 
#gene products and GO terms, which are used to capture the existing knowledge 
#about what each gene is known to do.

#Authors: Flores Valdez M & Padilla Mendoza JR

#Version: 22-11-2023

#Packages:
library(DESeq2)
library(clusterProfiler)
library(org.Hs.eg.db)
library(AnnotationDbi)
library(ggplot2)


#Input file:

Counts <- read.delim("ExampleCounts.csv", header = TRUE, row.names = 1, sep = ",")

#Code

Counts <- Counts[which(rowSums(Counts) > 0),]
condition <- factor(c("C","C","S","S"))
coldata <- data.frame(row.names = colnames(Counts), condition)
dds <- DESeqDataSetFromMatrix(countData = Counts, colData = coldata, design = ~condition)
dds <- DESeq((dds), fitType='mean')
res <- results(dds, contrast = c("condition", "S", "C"))
sigs <- na.omit(res)
genes_to_test <- rownames(sigs[sigs$log2FoldChange > 0.05,])

GO_results <- enrichGO(gene = genes_to_test, OrgDb = "org.Hs.eg.db", 
              keyType = "UNIPROT", pAdjustMethod = "none", ont = "BP", minGSSize= 20)

as.data.frame(GO_results)

#Plot

fit <- plot(barplot(GO_results, showCategory = 20, color= "p.adjust")+
              geom_bar(stat="identity")+(scale_fill_gradient(low="purple",high="orange"))+ 
              theme_bw()+ ggtitle("Bar plot of enriched terms")+
              theme(text = element_text(size = 15),
                    plot.title = element_text(size = 10),
                    axis.text.y = element_text(size = 10),
                    legend.key.height= unit(1, 'cm'),
                    legend.key.size = unit(5, 'cm'),
                    legend.key.width= unit(0.5, 'cm'))
            )


