Project 3
================
Transcriptomics Noob
09 Apr 2023

## Project 3

### Objectives:

1.  Perform a differential expression analysis pipeline for RNASeq
2.  Understand the differences between read mapping and pseudoalignment
3.  Compare different analysis options for measuring differential expression
4.  Use an R vignette to closely examine an RNASeq analysis pipeline
5.  Collaborate as a large group to compare 12 different differential gene expression analyses

### Tasks:

  - [x] Complete the [Galaxy Tutorial](1-Galaxy.md) using Kallisto
    pseudoalignment
  - [x] Complete the [DEBrowser Tutorial](2-DEBrowser.Homework11.md) using DESeq2
    differential expression analysis
  - [ ] Repeat the DEBrowser analysis using the Vole transcriptomics dataset
  - [ ] Compare the results of your analysis to at least one other group 
  - [ ] Collaborate to complete a report comparing the results from all
    analysis pipelines

### Groups

| NAME                   | EMAL                | Project3 | Tissue | Comparison |
|------------------------|---------------------|:--------:|:------:|:----------:|
| Buabeng, Isaac K.      | ikb001@bucknell.edu | 1        |  AMY   | Isolation  |
| Amano, Aiko            | aa037@bucknell.edu  | 2        |  AMY   | Treatment  |
| DeSana, Andrew         | ad049@bucknell.edu  | 3        |  BNST  | Isolation  |
| Prohofsky, Anna        | ap048@bucknell.edu  | 4        |  BNST  | Treatment  |
| Halbreiner, Claudia J. | cjh030@bucknell.edu | 5        |  FC    | Isolation  |
| Guzman, Dariel         | dg030@bucknell.edu  | 5        |        |            |
| Frattasio, Molly O.    | mof003@bucknell.edu | 6        |  FC    | Treatment  |
| Pring, Sam S.          | ssp008@bucknell.edu | 6        |        |            |
| Brendel, Meredith T.   | mtb018@bucknell.edu | 7        |  HIPP  | Isolation  |
| Thrall, Abigail E.     | aet009@bucknell.edu | 7        |        |            |
| Paula-Gil, Heather     | hpg004@bucknell.edu | 8        |  HIPP  | Treatment  |
| Douek, Naomi R.        | nrd005@bucknell.edu | 8        |        |            |
| Gao, Jasmine           | mg060@bucknell.edu  | 9        |  PVN   | Isolation  |
| Sporea, Gloria A.      | gas020@bucknell.edu | 9        |        |            |
| Umeh Jr., Micah N.     | mnu001@bucknell.edu | 10       |  PVN   | Treatment  |
| Saum, Paul B.          | pbs018@bucknell.edu | 10       |        |            |
| Smith, Meghan C.       | mcs023@bucknell.edu | 11       | HIPP-FC|   Tissue   |
| Ling, Tianze           | tl016@bucknell.edu  | 11       |        | Pair-Untr  |
| Martinson, Katy A.     | kam071@bucknell.edu | 12       |AMY-BNST|   Tissue   |
| Zheng, Carol           | yz017@bucknell.edu  | 12       |        | Pair-Untr  |


### Prerequisites

You should have already completed [Galaxy Tutorial](1-Galaxy.md) and 
[DEBrowser Tutorial](2-DEBrowser.md) using the Pasilla dataset. 

Read the Stevenson et al. paper in the Readings folder. Pay particular 
attention to the experimental design. These are the same voles that 
we will be studying.

### Preparing results for Project 3

During Lab 12 we will use Galaxy to complete the pseudoalignment of RNASeq
reads to the vole transcriptome with kallisto. Then we will use those results 
to conduct a QC analysis using DEBrowser. 

For Project 3, you will use kallisto results that have already been generated
by Prof. Field and our prior TA, Jiawen Zhao. Each group will use DEBrowser to analyze 
these results for QC and to determine differential expression.

Refer to the table above to determine which brain region(s) your group will be using
and which comparison that you will make for differential expression.

### Running DEBrowser

<https://debrowser.readthedocs.io/en/master/index.html>

Use the [DEBrowser.R](DEBRowser/DEBrowser.R) script to load the
DEBrowser library and launch the Shiny app. You should probably click
the Open in Browser button so that you can run DEBrowser in a web
browser.

Follow the directions in [DEBrowser.R](DEBRowser/DEBrowser.R) to perform
your DE analysis. This process is summarized below for convenience.

1.  Load in the appropriate genetable and the matching metadata file.

Before conducting your analysis for Project 3, be sure to check the results 
from Lab 12 to determine if you need to remove any samples prior to loading
your results into DEBrowser.

Note that these files are in csv format instead of tsv format.

If you have trouble loading in your results, double-check that every
column in your csv is an exact match for the samples listed in the
metadata.csv file.

2.  Filter the counts.

Use the default filtering settings.

3.  Batch Effect Correction

Select “MRN” for normalization, “Combat” for Correction Method,
“Isolation”, "Treatment", or "Tissue" for Treatment, and “Litter” for Batch. 
For the comparison that you are making, determine the if batch correction was
necessary by checking the PCA plots. 

4.  DE Analysis

Select New Comparison and then select the appropriate category, depending on 
your group assignment. You will select Tissue, Isolation, or Treatment. 

*Important*: whichever category that you don't use for your Comparison, you 
must select as a *Covariate*.

Read about the DE Analysis results from DEBrowser:
<https://debrowser.readthedocs.io/en/master/deseq/deseq.html>

Don’t download the DE results from the first screen that you see after
clicking “Start DE”. (Where you are still in the Data Prep section.)

Click “Go to Main Plots”
Select “Data Options” and change “up+down” to “up” or to “down”. 
Click “Download Data” to save the UP.csv or DOWN.csv
files according to the following naming system:

Tissue.Comparison.Direction.csv

Tissue: should equal `AMY`, `BNST`, `FC`, `HIPP`, or `PVN`. 
Comparison: should equal `Isolation` or `Treatment`. 
Direction: should equal `Up` or `Down`.

These files will be used to complete the Group Project.

Download the tables for upregulated and downregulated genes (with the above cutoffs) 
for the effect of Isolation (Paired vs Isolated) or the effect of Treatment 
(Vehicle vs Oxytocin). Note that the "up" and "down" will probably be labeled backwards.
Groups 11 and 12 will download the tables for the effect of Tissue. 

5.  Explore the results

Use DEBrowser to look at the MA and Volcano plots of your results.

Download a PNG file of the MA plot and Volcano plot, with the width of 1200 and 
height of 800. Named as above, but as Tissue.Comparison.MAPlot.png or 
Tissue.Comparison.VolcanoPlot.png

Specifically look at the expression of the following genes:

- Oxt gene, oxytocin/neurophysin I prepropeptide, "ENSMOCG00000017703"
- oxtr gene, oxytocin receptor, "ENSMOCG00000002867"
- avp gene, arginine vasopressin, "ENSMOCG00000014821"
- Avpr1b gene, arginine vasopressin receptor 1B, "ENSMOCG00000002679"
- Nr3c2 gene, nuclear receptor subfamily 3, group C, member 2, "ENSMOCG00000010658"
- Crh gene, corticotropin releasing hormone, "ENSMOCG00000018638"
- Crhr1, corticotropin releasing hormone receptor 1, "ENSMOCG00000011532"
- Crhr2, corticotropin releasing hormone receptor 2, "ENSMOCG00000019712"

For each gene of interest record the padj value for differential expression.
If a gene is not present in your dataset, record `NA`.

## Acknowledgements

Table made with https://thisdavej.com/copy-table-in-excel-and-paste-as-a-markdown-table/ 

<https://f1000research.com/articles/4-1521/v2>
