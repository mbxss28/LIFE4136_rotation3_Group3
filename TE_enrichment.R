#Read TE coverage data 
hap1 <- read.table("hap1_TE_coverage.txt", header = FALSE)
hap1_ROI <- read.table("hap1_scaf5windows_TE_coverage.txt", header = FALSE)

hap2 <- read.table("hap2F_TE_coverage.txt", header = FALSE)
hap2_ROI <- read.table("hap2scaf2_TE_coverage_windows.txt", header = FALSE)

#Filter for column which contains percentage coverage 
hap1_cov <- hap1$V7
hap1_ROI_cov <- hap1_ROI$V7

hap2_cov <- hap2$V7 
hap2_ROI_cov <- hap2_ROI$V7

#Testing for signifcant enrichment of TEs in Hap1 scaf5 using Wilcoxon rank sum test
wilcox.test(hap1_ROI_cov, hap1_cov, alternative = "greater")


#Testing for signifcant enrichment of TEs in Hap2 scaf2 using Wilcoxon rank sum test
wilcox.test(hap2_ROI_cov, hap2_cov, alternative = "greater")

#create dataframe coverage of region of interest (ROI) and rest of genome (background)
hap1_df <- data.frame(
  Group = c(rep("ROI", length(hap1_ROI_cov)), rep("Background", length(hap1_cov))),
  TE_coverage = c(hap1_ROI_cov * 100, hap1_cov * 100)
)

hap2_df <- data.frame(
  Group = c(rep("ROI", length(hap2_ROI_cov)), rep("Background", length(hap2_cov))),
  TE_coverage = c(hap2_ROI_cov * 100, hap2_cov * 100)
)

#Assigning Haplotype to each dataframe
hap1_df$Haplotype <- "Haplotype 1"
hap2_df$Haplotype <- "Haplotype 2"

#checking structure of dataframes
head(hap1_df)
head(hap2_df)

#merge dataframes
bothHap_df <- rbind(hap1_df, hap2_df)

#check structrure again 
head(bothHap_df)

#plotting box and whisker plots to show % coverage of TE's in ROI's compared to the rest of the genome 
library(ggplot2)

ggplot(bothHap_df, aes(x = Group, y = TE_coverage, fill = Group)) +
  geom_boxplot(width = 0.9, alpha = 0.5, color = "black") +
  scale_fill_manual(values = c("ROI" = "orange", "Background" = "green")) +
  facet_wrap(~ Haplotype) +
  labs(title = "TE Coverage in ROI vs Background by Haplotype",
       x = "", y = "% TE Coverage") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "none")
