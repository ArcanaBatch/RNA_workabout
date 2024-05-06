## ![alt text](https://github.com/ArcanaBatch/RNA_workabout/blob/main/Images/Imagen1.bmp)


 ![RStudio](https://img.shields.io/badge/RStudio-4285F4?style=for-the-badge&logo=rstudio&logoColor=white)
 ![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
  ![alt text](https://img.shields.io/badge/Version-1.01-brightgreen)
# RNA_workabout
Tools for creating Volcano, HeatMap and GO barplots for RNA seq analysis (R languaje)
## Volcano Plot (RNAseq)
When analyzing data for RNA based gene expression profiling (GEP) the volcano plot illustrates the log[10]-transformed adjusted p-Value against the log-fold change for each probe in the assay, this tool will provide visualization of such results.
Each point on the graph represents a gene. The log2-fold differences between the groups are plotted on the x-axis and the -log10 p-value differences are plotted on the y-axis. The horizontal dashed line represents the significance threshold specified in the analysis, usually derived using a multiple testing correction.

### Dependencies # 

| Library | Needed |
| :----: | :----: |
| ggplot2 | yes |
| tidyverse | yes |
| ggrepel | yes |
| ggthemes | yes |

### Input # 

Data for RNA based GEP must be contained in a .CSV file, and must contain at least the columns shown in the example below the "Filler" column must be populated with the gene names or monickers.

| Filler |	Anova (p) |	Log^2 FX/Ctl |	p-Value |
| :---: | :---: | :---: | :---: |
| g1 |	0.000673042 |	-3.320167673 |	3.171957834 |
| g2 |	0.001442404 |	-0.311494014 |	2.840913082 |
| g3 |	0.001680965 |	-5.133571199 |	2.774441329 |
| g4 |	0.00309731 |	1.308667426 |	2.509015325 |
| n | 0.00.... | 0.00... | 0.00... |



### Output # 




## ![alt text](https://github.com/ArcanaBatch/RNA_workabout/blob/main/Images/volcano.png)


## Heat Map (RNAseq)
A heat map is a graphical representation of data that uses color coding to indicate the magnitude of values. Heat maps are commonly used in transcriptomics to visualize gene expression data. By measuring the number of RNA molecules produced by genes in a particular sample, researchers can determine the level of gene expression.

### Dependencies # 

| Library | Needed |
| :----: | :----: |
| ggplot2 | yes |
| reshape2 | yes |
| pheatmap | yes |
| dplyr | yes |

### Input # 

Data must be contained in a .CSV file, and must contain at least the columns shown in the example below the "Gene" column must be populated with the gene names or monickers. Different clustering options may be produced according to necessity.

| Gene |	Sample1 |	Control1 |	Sample2 | n |
| :---: | :---: | :---: | :---: | :---: | 
| g1 |	2.934713378 |	3.320167673 |	31.171957834 | 0.00... |
| g2 |	33.001442404 |	20.311494014 |	21.840913082 | 0.00... |
| g3 |	4.001680965 |	15.133571199 |	20.774441329 | 0.00... |
| g4 |	2.00309731 |	11.308667426 |	22.509015325 | 0.00... |
| n | 0.00.... | 0.00... | 0.00... | 0.00... |


### Output # 


## ![alt text](https://github.com/ArcanaBatch/RNA_workabout/blob/main/Images/heatb.png)



## GO plot (RNAseq)
GO enrichment analysis is ubiquitously used for interpreting high throughput molecular data and generating hypotheses about underlying biological phenomena of experiments. In this type of analysis functional categories are searched such as biochemical function, cellular role, etc. This task can be performed repeatedly, for each gene, in order to construct a master list of all biological processes in which at least one gene is involved.

### Dependencies # 

| Library | Needed |
| :----: | :----: |
| ggplot2 | yes |
| DESeq2 | yes |
| clusterProfiler | yes |
| org.Hs.eg.db | yes |
| AnnotationDbi | yes |

### Input # 

Data must be contained in a .CSV file, and must contain at least the columns shown in the example below the "ProteinID" column must be populated with the correspondent names or monickers. Several options may be enabled according to necessity.

| ProteinID |	Control1 |	Control2 |	Test1 | n |
| :---: | :---: | :---: | :---: | :---: | 
| Q9Y4D8 |	3 |	3 |	0 | 0... |
| Q9Y4D7 |	33 |	20 |	2 | 0... |
| K7ES02 |	4 |	5 |	20 | 0.00... |
| Q96CG8 |	2 |	1 |	22 | 0.00... |
| n | 0.... | 0... | 0... | 0... |


### Output # 


## ![alt text](https://github.com/ArcanaBatch/RNA_workabout/blob/main/Images/GOplot.png)




