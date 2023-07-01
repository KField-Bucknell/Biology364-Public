# Installation instructions:
# 1. Install DEBrowser and its dependencies by running the lines below
# in R or RStudio.

if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("debrowser")
BiocManager::install("DO.db")
BiocManager::install("GO.db")

# 2. Load the library

library(debrowser)

# 3. Prepare data for DEBrowser

if (!require("tidyverse")) install.packages("tidyverse"); library(tidyverse)

# List the count files. You may need to change the path and pattern to match your files.

setwd("~/Documents/Biology364-2023/02-Assignments/Project03/DESeq2_transcripts")

transcriptfilelist <- list.files(pattern="*.transcripts.tsv", full.names=T)
print(transcriptfilelist)

transcriptfiles <- lapply(transcriptfilelist, read_tsv)

transcriptfilenames <- list.files(pattern="*.transcripts.tsv", full.names=F)
transcriptfilenames

# Use grep to change the file names into shorter sample names
samplenames <- gsub(".transcripts.tsv", "", transcriptfilenames)
samplenames <- gsub("-","_", samplenames) # DEBrowser doesn't like -
samplenames <- trimws(samplenames)
samplenames

# Reformat the transcript files into a single data frame
transcriptfiles %>%
  bind_cols() %>%
  dplyr::select(target_id...1, starts_with("est_counts")) -> transcripttable

# Rename the columns of the transcript table to match the sample names
colnames(transcripttable)[1] <- "transcript"
colnames(transcripttable)[2:(1+length(samplenames))] <- as.list(samplenames)


# Check the transcript table and save it
head(transcripttable)
## Open one of the (tabular) files on Galaxy and verify that at least one of the numreads matches

write_tsv(transcripttable, file="transcripttable.tsv")

## It is important that the metadata file and the transcript table match exactly
## If you have any problems with loading the data, you should check this carefully!


# 4. Start DEBrowser

# To use the annotations for drosophila (this won't be needed for lab)
#if (!require("org.Dm.eg.db")) BiocManager::install("org.Dm.eg.db"); library(org.Dm.eg.db)

startDEBrowser()
