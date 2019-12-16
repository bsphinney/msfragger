# subest feasta

library('tidyverse')
library("seqinr")


setwd("E:\\brett\\UNIVERSITY_OF_GEORGIA\\HELA_QC")

# read fasta
fasta <- read.fasta("2019-12-16-td-rev-UP000005640.fas", seqtype = "AA",as.string = TRUE, set.attributes = FALSE)

# read fragger results
fragger <- read_tsv("protein.tsv")

# subset fasta to only include fragger results
fragger.subset<- names(fasta) %in% fragger$Protein
fragger.subset.fasta <- fasta[fragger.subset]

write.fasta(sequences = fragger.subset.fasta, names = names(fragger.subset.fasta), nbchar = 80, file.out = "fragger.subset.fasta")

