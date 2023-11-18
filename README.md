## ![alt text](https://github.com/ArcanaBatch/RNA_workabout/blob/main/Imagen1.bmp)

 ![RStudio](https://img.shields.io/badge/RStudio-4285F4?style=for-the-badge&logo=rstudio&logoColor=white)
 ![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
  ![alt text](https://img.shields.io/badge/Version-1.01-brightgreen)
# RNA_workabout
Tools for creating Volcano, HeatMap and GO barplots for RNA seq analysis (R languaje)
## Volcano Plot (RNAseq_XFrag)
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




## ![alt text](https://github.com/ArcanaBatch/RNA_workabout/blob/main/git_volcano.png)




