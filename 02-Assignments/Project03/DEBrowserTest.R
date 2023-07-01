# Installation instructions:
# 1. Install DEBrowser and its dependencies by running the lines below
# in R or RStudio.

if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")

## Sometimes these packages have to be installed before DEBrowser. 
## If you get an error that they are missing, then remove the comment flag and run them.

#BiocManager::install("DO.db")
#BiocManager::install("GO.db")

BiocManager::install("debrowser")

## When installing debrowser, you should answer Yes or all to updating packages 
## But answer "no" to Do you want to install from sources the packages which need compilation?


# 2. Load the library

library(debrowser)

# 3. Start DEBrowser

startDEBrowser()

# 4. Check that the Example data will load

# After running that command, 