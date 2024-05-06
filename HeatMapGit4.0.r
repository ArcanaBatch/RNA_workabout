#Heat Map

#A heat map is a graphical representation of data that uses color coding to 
#indicate the magnitude of values. Heat maps are commonly used in transcriptomics 
#to visualize gene expression data. By measuring the number of RNA molecules 
#produced by genes in a particular sample, researchers can determine the level 
#of gene expression.

#Authors: Flores Valdez M & Padilla Mendoza JR

#Version: 17-11-2023

#Packages:

library(ggplot2)
library(reshape2)
library(pheatmap)
library(dplyr)


#Input file:

example_data <- read.table("ExampleHeat.csv", sep= ",", 
                           header = TRUE, row.names = 1 )
head(example_data,10)

#Code:


pheatmap(example_data, 
         cluster_rows = FALSE, 
         cluster_cols = FALSE, 
         scale = "none",
         show_rownames = FALSE, 
         show_colnames = TRUE,
         color = colorRampPalette(c("#58003d", "lightgreen", "orange"))(30))


counts_normalised_only_diff_genes <- example_data

counts_scaled = counts_normalised_only_diff_genes%>%
  t(.)%>%     # transpose to have the genes in columns
  scale()%>%  # scale(x, center = TRUE, scale = TRUE)
  t(.)        # back in original shape
              # sanity check
              # the majority of the values should be around zero
apply(counts_scaled,MARGIN=1,mean)%>%   # calculate the mean per row
hist(.,main="",xlab="Z-score values",col="#58003d")


pheatmap(counts_scaled,
         cluster_rows=FALSE,
  cluster_cols=FALSE,
  show_rownames=FALSE,
  scale="none",
  # already done "manually"
  show_colnames=TRUE,
  color = colorRampPalette(c("#58003d", "lightgreen", "orange"))(30))


pheatmap(counts_scaled,
  cluster_rows=TRUE,
  cluster_cols=TRUE,
  show_rownames=FALSE,
  show_colnames=TRUE,
  main="Clustering on",
  color = colorRampPalette(c("#58003d", "lightgreen", "orange"))(30))



pheatmap(example_data, 
         main = "Normalized gene expression levels for the 99 significant genes",
         cluster_rows = TRUE, 
         cluster_cols = FALSE, 
         scale = "row",
         show_rownames = TRUE, 
         show_colnames = TRUE,
         cellwidth= 70.0,
         cellheight= 8.5,
         color = colorRampPalette(c("#58003d", "lightgreen", "orange"))(30))

