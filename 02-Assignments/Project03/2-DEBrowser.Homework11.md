# DEBrowser Tutorial

This tutorial assumes that you have already completed the [Galaxy Tutorial](1-Galaxy.md)

When you complete this tutorial, save it as Homework11.md and push it to your repo.

## DE Browser

Kucukural A, Yukselen O, Ozata DM, Moore MJ, Garber M (2019). “DEBrowser: Interactive Differential Expression Analysis and Visualization Tool for Count Data.” BMC Genomics, 20, 6. doi: 10.1186/s12864-018-5362-x, https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-018-5362-x.

Help for DEBrowser can be found at https://www.bioconductor.org/packages/devel/bioc/vignettes/debrowser/inst/doc/DEBrowser.html

## Tutorial

1. Within your local repo directory make a Project03 folder and place the following files there:
   - The metadata file metadata.tsv
   - The DEBrowser.R file
   - Also move the transcripts.tsv files that you downloaded in Part 1 into this folder
   
2. Within R Studio open DEBrowser.R
   - Create a new folder called DESeq2_transcripts
   - Use File... Save As... to rename the script to YourName_transcripts_DESeq2_DEBrowser.R and save it in the folder you just created
   - Follow the script in [DEBrowser.R](DEBrowser.R) to generate the files needed for analysis and run the analysis
   
3. Determine if batch correction for the single versus paired samples is necessary
  - After uploading the data, click the Filter button
  - Filter the data using the default filter settings (Filter features where Max Value <10) 
    - Note the number of transcripts that were filtered out in the md file
    - Check the histograms of transcript expression before and after filtering. Describe any differences
  - Click Batch Effect Correction
  - Always select MRN (the default in DEBrowser) to normalize the samples by read depth
  - View the PCA, IQR, and Density plots without Batch Correction 
    - Visualize the PCA plot by changing Color field to "Treatment", and Shape field to "Batch"
  - Use Batch Correction: Combat, Treatment = Treatment, and Batch = Batch
  - Use the PCA, IQR, and/or Density plots to determine if normalization and batch correction were necessary
    - Describe the differences before and after batch correction in the md file
  
4. Perform the appropriate batch correction and click *QC Plots*
        - *You can ignore section 4 if you like.*
        - *The QC Plots do not match the earlier plots and they do not work properly unless you run DESeq2 first.*
        - *The questions below are to be answered only if you came back to this AFTER completing step 5*
        - *Also, you need to change Data Options, Choose a dataset to "alldetected" to view the plots for all of the data.*
   - View the PCA plot to determine the amount of variation that is explained by PC1 and whether this is associated with treatment of the samples?
   - Check the All2All and Heatmap plots to see if the Untreated samples and Treated samples are more similar to each other than to the other group?
   - Check the IQR and Density plots to verify that normalization was successful in creating samples that can be compared to each other despite differing read depths.
  
5. Next perform a Differential Expression analysis
  - Click *Go to DE Analysis* and *Add New Comparison*
  - then explore the DE Results table
  - Select *Data Type* `Down`. These are genes that are more highly expressed in the Untreated samples
  - In the search box, type FBtr0302692, which is one of the **pasilla** transcripts
    - Determine the fold change and the adjusted p value for this transcript
    - Did the RNAi treatment work as expected?
  - Now change *Data Type* to `Up` and look for the FBtr0073426 transcript. 
    - Describe the differential expression of this **Ant2** transcript
     
6. Go to the *Main Plots*
   - Read through the Tutorial on Bioconductor to see how to interpret each graph:
   https://www.bioconductor.org/packages/devel/bioc/vignettes/debrowser/inst/doc/DEBrowser.html
   - Summarize the differential expression results
    - What adjusted p-value cutoff are you using?
    - Is there a minimum fold-change cutoff that you are using?
    - How many upregulated genes were detected using these cutoffs?
    - How many downregulated genes were detected using these cutoffs?
  - Export figures in pdf, png, or jpeg format (in that order of preference) to show the following: 
     - Figure_1: Differential expression of FBtr0302692
     - Figure_2: Differential expression of FBtr0073426
     - Figure_3: A heatmap of differentially expressed transcripts
     - Figure_4: An MA plot of the data
     - Figure_5: A Volcano plot of the data
     - Place all figures in a folder called *figures* in your Project03 folder (together with this file, this will be HW11)
     
## Links

DEBrowser User Guide:
https://www.bioconductor.org/packages/devel/bioc/vignettes/debrowser/inst/doc/DEBrowser.html

Comparison of normalization methods:
https://www.rna-seqblog.com/comparison-of-tmm-edger-rle-deseq2-and-mrn-normalization-methods/

DEBrowser Emergency Backup (use only if you can't get DEBrowser to run on your computer after consulting with Prof. Field):
https://debrowser.umassmed.edu/

