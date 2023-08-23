rm(list=ls(all=TRUE))
#use MR-Base generated code
#2 alternate
install.packages("remotes")
remotes::install_github("MRCIEU/TwoSampleMR")
library(TwoSampleMR)
exposure_dat <- read_exposure_data( #read in the lead file"
  filename = 'lead.txt',
  sep = ' ',
  snp_col = 'SNP',
  beta_col = 'beta',
  se_col = 'se',
  effect_allele_col = 'effect_allele',
  phenotype_col = 'Phenotype',
  units_col = 'units',
  other_allele_col = 'other_allele',
  eaf_col = 'eaf',
  samplesize_col = 'samplesize',
  ncase_col = 'ncase',
  ncontrol_col = 'ncontrol',
  gene_col = 'gene',
  pval_col = 'pval'
)

outcome_dat <- extract_outcome_data(exposure_dat$SNP, c('ebi-a-GCST006696','ebi-a-GCST006697','ebi-a-GCST006701')) #get data for the choosen outcomes
dat <- harmonise_data(exposure_dat, outcome_dat)
mr(dat) #results
#
