rm(list=ls(all=TRUE))
install.packages("remotes")
remotes::install_github("MRCIEU/TwoSampleMR")
library(TwoSampleMR)
library(stringr)
library(MendelianRandomization)

ao <- available_outcomes()
items<-which(str_detect(ao$trait, "attained age", negate = FALSE)=="TRUE") #get information about the trait of interest, here "Iron")
data.frame("id"=ao$id[items],"trait"=ao$trait[items],"year"=ao$year[items],"author"=ao$author[items],"n"=ao$sample_size[items],"pubmed"=ao$pmid[items])


