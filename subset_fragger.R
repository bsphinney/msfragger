# create a subest fasta from Fragpipe/MSFragger results and initial database

library('tidyverse')
library("seqinr")

# setwd to your dir. Should contain the .fas database and the fragpipe/MSfragger
# protein.tsv output file
setwd("E:\\brett\\Data\\HELA_QC")

# read fasta used in the MSFragger search change this to the one use used 
fasta <- read.fasta("2019-12-16-td-rev-UP000005640.fas", seqtype = "AA",as.string = TRUE, set.attributes = FALSE)

# read fragpipe/msfragger protein results file
fragger <- read_tsv("protein.tsv")

# create subset fasta that only includes MSFragger results (usually the FDR is 1%)
fragger.subset<- names(fasta) %in% fragger$Protein
fragger.subset.fasta <- fasta[fragger.subset]

write.fasta(sequences = fragger.subset.fasta, names = names(fragger.subset.fasta), nbchar = 80, file.out = "fragger.subset.fasta")

