#Volcano Plot

#Description: When analyzing data for RNA based gene expression profiling (GEP) 
#the volcano plot illustrates the log[10]-transformed adjusted p-Value against 
#the log-fold change for each probe in the assay, this tool will provide 
#visualization of such results. Each point on the graph represents a gene. 
#The log2-fold differences between the groups are plotted on the x-axis and the
#-log10 p-value differences are plotted on the y-axis. The horizontal dashed 
#line represents the significance threshold specified in the analysis, usually
#derived using a multiple testing correction.

#Authors: Flores Valdez M & Padilla Mendoza JR

#Version: 17-11-2023

#Packages:

library(ggplot2)
library(tidyverse)
library(ggrepel)
library(ggthemes)

#Input file:

proteomica <- read.csv("ExampleVolcano.csv")

#Code:

proteomica <- proteomica%>%
  mutate(Expression = if_else(Anova..p. < 0.05 & abs(Log.2.FX.Ctl) > 1,
                             if_else(Log.2.FX.Ctl > 1, "Up", "Down"),
                             "Stable"))  
proteomica$Log.2.FX.Ctl <- as.numeric(proteomica$Log.2.FX.Ctl)


ggplot(data=proteomica,
       aes(x = Log.2.FX.Ctl, y = p.Value, 
       label=ifelse(p.Value>1.3 & Log.2.FX.Ctl> 1.0 | p.Value>1.3 & Log.2.FX.Ctl< -1.0,as.character(Filler),''),
       colour = Expression))+
  geom_point(alpha = .7, size = 2)+  
  geom_hline(yintercept = 1.3, lty = 2, col= "red", lwd= .5)+
  geom_label_repel(force= 5, max.overlaps = Inf, show.legend = FALSE)+
  
  scale_color_manual(values = c("purple","lightgreen","orange")) +
  
  geom_vline(xintercept = c(-1,1), lty = 2, col= "black", lwd = .4)+
  
  labs(x= "Log2 (Fold change value)",
       y= "-Log10 p-ANOVA", 
       title = "Volcano plot proteomic")+
  theme_bw()+
   
  guides(colour = guide_legend(override.aes = list(size=2.0)))+
 
  theme(plot.title = element_text(hjust = 0.5), legend.position = c(0.8, 0.8))

 
