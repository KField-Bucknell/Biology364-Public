# Galaxy Tutorial

1.  Log into <https://galaxy.bucknell.edu> and take the interactive tours of the `Galaxy UI` and `History`
2.  In Lab last week we have already accomplished:
    -   Downloading the data from the sequence read archive (see below for links to the samples)
    -   Trimming the data to remove adapters and poor quality reads using fastp
    -   Assessing the quality of the data using MultiQC
3.  Transfer the trimmed reads from the Data Library (required only if you didn't complete Lab 10 successfully)
    -   Click on `Shared Data`... `Data Libraries`
    -   Select "RNASeq Group Project" and then choose all of the files.
    -   Click `To History`, `as Datasets`, and then `Import`
    -   Click on the Galaxy logo in the top left to return to the Analysis page.
    -   The data files should be in the History panel on the right.
    -   If you need to change histories, click the `View All Histories` icon in the top right of the History panel.
4.  Pseudoaligning the reads to a transcriptome
    -   In the tool panel, search for Kallisto
    -   Select the following options for **Kallisto quant**
        -   *Use a built-in index?* Use a built-in transcriptome
        -   *Select the reference transcriptome:* Dmelanogaster
        -   *Single-end or paired reads* Single-end
        -   *Reads in FASTQ format* fastp on S2_DRSC_Untreated-1 (Note that your history will have a different name.)
        -   *Library strandness information* Unstranded
    -   Leave all of the other options as the defaults, and click `Execute`
5.  After that job successfully runs on BisonNet, click the `Eye` icon to view the results.
    -   You should see two results files, you should open the (tabular) one.
    -   You should have a 5 column table that includes the number of reads (*est_counts*) mapped to each transcript and the transcripts per million mapped reads (tpm).
6.  Click one of the results files in the History panel and then click `Run this job again` :arrows_counterclockwise:.
    -   Change the the Reads in FASTQ format to Fastp on S2_DRSC_CG8144_RNAi-1.
    -   Leave all other settings the same and click `Execute`
7.  While that is running use `Run this job again` to set up one of the paired read files to run:
    -   Change *Single-end or paired reads* to Paired
    -   Select *Forward reads*: fastp on S2_DRSC_Untreated-3_R1
    -   Select *Reverse reads*: fastp on S2_DRSC_Untreated-3_R2
    -   Double check that you have R1 for Forward, R2 for Reverse, and both come from the same sample
    -   Click `Execute`
8.  Now set up the other three paired samples. (You can fill up the queue and then make a sammich while you wait.)
    -   When they are complete verify that each of the pseudoalignment runs ran properly.
        -   Click on the results in the History panel to view the first 5 lines of the file.
        -   Verify that there are values in the est_counts and tpm columns (click the View Data icon to see all the data if needed).
        -   Click the View Details (i) icon to see the parameters used for the analysis.
        -   Follow the `stdout` and `stderr` links to view the output generated during the analysis.
        -   Under Tool Parameters verify which trimmed read file(s) were used.
9.  Download each file and rename it.
    -   As you check the read file, copy the sample name from the trimmed file name.
    -   Click download :floppy_disk: and then find the downloaded file and rename it (no spaces or symbols):
        -   Name the tabular output files Sample_Name.transcripts.tsv (See list below for expected file names)
        -   In your filenames, change any hyphens `-` to underscores `_` (DEBrowser hates `-`)
    -   After you have downloaded all of the results files and renamed them, start the [DEBrowser Tutorial](2-DEBrowser.md)

### Files

Note the file names must match exactly:

1.  Untreated_1.transcripts.tsv
2.  Untreated_3.transcripts.tsv
3.  Untreated_4.transcripts.tsv
4.  RNAi_1.transcripts.tsv
5.  RNAi_3.transcripts.tsv
6.  RNAi_4.transcripts.tsv

### Samples

Untreated samples:

-   Untreated_1 SRR031711 <http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031711>
-   Untreated_3 SRR031714 <http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031714>
-   Untreated_4 SRR031716 <http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031716>

RNAi-treated samples

-   RNAi_1 SRR031718 <http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031718>
-   RNAi_3 SRR031724 <http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031724>
-   RNAi_4 SRR031726 <http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031726>
