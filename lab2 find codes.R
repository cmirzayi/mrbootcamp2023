rm(list=ls(all=TRUE))
install.packages("remotes")
remotes::install_github("MRCIEU/TwoSampleMR")
library(TwoSampleMR)
library(stringr)
library(MendelianRandomization)

ao <- available_outcomes()

items<-which(str_detect(tolower(ao$trait), "bmi", negate = FALSE)=="TRUE") #get information about the trait of interest, here "Iron")

View(ao)
items<-which(str_detect(ao$trait, "Age completed full time education", negate = FALSE)=="TRUE") #get information about the trait of interest, here "Iron")
data.frame("id"=ao$id[items],"trait"=ao$trait[items],"year"=ao$year[items],"author"=ao$author[items],"n"=ao$sample_size[items],"pubmed"=ao$pmid[items])

items<-which(str_detect(ao$trait, "Smoking status: Never", negate = FALSE)=="TRUE") #get information about the trait of interest, here "Iron")
data.frame("id"=ao$id[items],"trait"=ao$trait[items],"year"=ao$year[items],"author"=ao$author[items],"n"=ao$sample_size[items],"pubmed"=ao$pmid[items])

items<-which(str_detect(ao$trait, "Alcohol intake frequency", negate = FALSE)=="TRUE") #get information about the trait of interest, here "Iron")
data.frame("id"=ao$id[items],"trait"=ao$trait[items],"year"=ao$year[items],"author"=ao$author[items],"n"=ao$sample_size[items],"pubmed"=ao$pmid[items])

items<-which(str_detect(ao$trait, "Number of days/week of vigorous physical activity", negate = FALSE)=="TRUE") #get information about the trait of interest, here "Iron")
data.frame("id"=ao$id[items],"trait"=ao$trait[items],"year"=ao$year[items],"author"=ao$author[items],"n"=ao$sample_size[items],"pubmed"=ao$pmid[items])

