Homework 03
================
Biol 364 Student

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## The Pick et al. Dataset

The dataset that you will be exploring will be found in the Homework03
folder. It was downloaded from the Dryad Data Repository at:
<https://doi.org/10.5061/dryad.40jp4> The paper describing the analysis
of this data can be found here: <https://doi.org/10.1086/688918>

**Disentangling Genetic and Prenatal Maternal Effects on Offspring Size
and Survival** Joel L. Pick, Christina Ebneter, Pascale Hutter, and
Barbara Tschirren *The American Naturalist* 2016 188:6, 628-639

Data of body mass, size and survival throughout development of Japanese
quail chicks originating from reciprocal crosses of divergent artificial
selection lines for prenatal maternal investment

### Abstract

Organizational processes during prenatal development can have long-term
effects on an individual’s phenotype. Because these early developmental
stages are sensitive to environmental influences, mothers are in a
unique position to alter their offspring’s phenotype by differentially
allocating resources to their developing young. However, such prenatal
maternal effects are difficult to disentangle from other forms of
parental care, additive genetic effects, and/or other forms of maternal
inheritance, hampering our understanding of their evolutionary
consequences. Here we used divergent selection lines for high and low
prenatal maternal investment and their reciprocal line crosses in a
precocial bird—the Japanese quail (*Coturnix japonica*)—to quantify the
relative importance of genes and prenatal maternal effects in shaping
offspring phenotype. Maternal but not paternal origin strongly affected
offspring body size and survival throughout development. Although the
effects of maternal egg investment faded over time, they were large at
key life stages. Additionally, there was evidence for other forms of
maternal inheritance affecting offspring phenotype at later stages of
development. Our study is among the first to successfully disentangle
prenatal maternal effects from all other sources of confounding
variation and highlights the important role of prenatal maternal
provisioning in shaping offspring traits closely linked to fitness.

``` r
quail <- read_csv("pick_et_al.csv", trim_ws = TRUE)
```

    ## Rows: 911 Columns: 20
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (9): animal, mother, father, maternal.line, paternal.line, sex, hatch.e...
    ## dbl (10): hatch.mass, week2.mass, week2.tarsus, week4.mass, week4.tarsus, ad...
    ## lgl  (1): exclude.surv
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
head(quail)
```

    ## # A tibble: 6 × 20
    ##   animal mother father hatch.m…¹ week2…² week2…³ week4…⁴ week4…⁵ adult…⁶ egg.m…⁷
    ##   <chr>  <chr>  <chr>      <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
    ## 1 CY3334 A1487  A1608       8.13    61.1    31.5    158.    41.3    41.6    11.5
    ## 2 CY3362 A1493  A1555       8.73    54.3    29.9    146.    39.9    40.9    13.3
    ## 3 CR1374 A1515  A1596       9.09    66.1    31      166     38.6    NA      13.1
    ## 4 CY3323 A1604  A1599       8.07    55.3    30.1    152.    39.4    40.2    10.9
    ## 5 CY3332 A1487  A1608       8.06    71.1    33      171.    40.3    NA      11.7
    ## 6 CG2717 A1625  A1549       7.24    53.2    28.8    132     37.4    NA      10.2
    ## # … with 10 more variables: maternal.line <chr>, paternal.line <chr>,
    ## #   sex <chr>, replicate <dbl>, hatching.day <dbl>, hatch.env <chr>,
    ## #   week2.env <chr>, week4.env <chr>, survive <dbl>, exclude.surv <lgl>, and
    ## #   abbreviated variable names ¹​hatch.mass, ²​week2.mass, ³​week2.tarsus,
    ## #   ⁴​week4.mass, ⁵​week4.tarsus, ⁶​adult.tarsus, ⁷​egg.mass

The following description of the data was also provided: Column Name -
Description “animal” - offspring ID “mother” - maternal ID “father” -
paternal ID “hatch.mass” - offspring hatchling mass (g) “week2.mass” -
offspring week 2 mass (g) “week2.tarsus” - offspring week 2 tarsus
length (mm) “week4.mass” - offspring week 4 mass (g) “week4.tarsus” -
offspring week 4 tarsus length (mm) “adult.tarsus” - offspring adult
tarsus length (mm) “egg.mass” - egg mass (g) that offspring originated
from “maternal.line” - selection line of the mother; H = high investment
line, L = low investment line “paternal.line” - selection line of the
father; H = high investment line, L = low investment line “sex” -
offspring sex “replicate” - selection line replicate “hatching.day” -
day of hatching (17 or 18) relative to start of incubation (day 0)
“hatch.env” - hatching environment (specific incubator) “week2.env” -
chick rearing environment (specific cage) from hatching to week 2
“week4.env” - juvenile rearing environment (specific cage) from week 2
to week 4 “survive” - survival to adulthood “exclude.surv” - whether
individual was excluded from survival analysis or not (TRUE = excluded);
see methods

``` r
summary(quail)
```

    ##     animal             mother             father            hatch.mass    
    ##  Length:911         Length:911         Length:911         Min.   : 5.230  
    ##  Class :character   Class :character   Class :character   1st Qu.: 7.680  
    ##  Mode  :character   Mode  :character   Mode  :character   Median : 8.330  
    ##                                                           Mean   : 8.369  
    ##                                                           3rd Qu.: 8.980  
    ##                                                           Max.   :11.240  
    ##                                                                           
    ##    week2.mass     week2.tarsus     week4.mass     week4.tarsus    adult.tarsus 
    ##  Min.   :19.80   Min.   :20.30   Min.   : 64.8   Min.   :31.60   Min.   :34.9  
    ##  1st Qu.:49.10   1st Qu.:28.70   1st Qu.:125.8   1st Qu.:37.50   1st Qu.:38.6  
    ##  Median :54.30   Median :29.70   Median :136.6   Median :38.40   Median :39.5  
    ##  Mean   :54.12   Mean   :29.62   Mean   :137.0   Mean   :38.43   Mean   :39.5  
    ##  3rd Qu.:59.10   3rd Qu.:30.60   3rd Qu.:146.7   3rd Qu.:39.30   3rd Qu.:40.3  
    ##  Max.   :81.70   Max.   :33.70   Max.   :210.0   Max.   :42.50   Max.   :43.4  
    ##  NA's   :58      NA's   :58      NA's   :60      NA's   :60      NA's   :146   
    ##     egg.mass     maternal.line      paternal.line          sex           
    ##  Min.   : 8.15   Length:911         Length:911         Length:911        
    ##  1st Qu.:11.16   Class :character   Class :character   Class :character  
    ##  Median :11.92   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :12.01                                                           
    ##  3rd Qu.:12.81                                                           
    ##  Max.   :15.86                                                           
    ##                                                                          
    ##    replicate      hatching.day    hatch.env          week2.env        
    ##  Min.   :1.000   Min.   :17.00   Length:911         Length:911        
    ##  1st Qu.:1.000   1st Qu.:17.00   Class :character   Class :character  
    ##  Median :2.000   Median :17.00   Mode  :character   Mode  :character  
    ##  Mean   :1.509   Mean   :17.14                                        
    ##  3rd Qu.:2.000   3rd Qu.:17.00                                        
    ##  Max.   :2.000   Max.   :18.00                                        
    ##                                                                       
    ##   week4.env            survive       exclude.surv   
    ##  Length:911         Min.   :0.0000   Mode :logical  
    ##  Class :character   1st Qu.:1.0000   FALSE:905      
    ##  Mode  :character   Median :1.0000   TRUE :6        
    ##                     Mean   :0.9363                  
    ##                     3rd Qu.:1.0000                  
    ##                     Max.   :1.0000                  
    ## 

You can see that some of the data is categorical, but it is of the class
“character”. We should change that to ensure that it these variables are
handled properly during analysis.

### Factor the appropriate variables

I have shown you how to do one of these, but you will need to complete
this process, referring to the description of each variable.

``` r
quail$sex <- as.factor(quail$sex)
table(quail$sex)
```

    ## 
    ## Female   Male 
    ##    463    448

### Explore the data

Next explore the data to determine if variables look like they will need
to be transformed or if they already have a normal distribution.

``` r
simple.eda(quail$hatch.mass)
```

![](Homework03_files/figure-gfm/Data%20Exploration-1.png)<!-- -->

``` r
shapiro.test(quail$hatch.mass)
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  quail$hatch.mass
    ## W = 0.99633, p-value = 0.03131

``` r
shapiro.test(quail$hatch.mass[quail$sex=="Female"])
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  quail$hatch.mass[quail$sex == "Female"]
    ## W = 0.99449, p-value = 0.0948

``` r
shapiro.test(quail$hatch.mass[quail$sex=="Male"])
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  quail$hatch.mass[quail$sex == "Male"]
    ## W = 0.99642, p-value = 0.4186

### Is it important to test for normality for each population separately?

``` r
t.test(hatch.mass ~ sex, data = quail)
```

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  hatch.mass by sex
    ## t = 2.2923, df = 906.22, p-value = 0.02212
    ## alternative hypothesis: true difference in means between group Female and group Male is not equal to 0
    ## 95 percent confidence interval:
    ##  0.02139717 0.27614689
    ## sample estimates:
    ## mean in group Female   mean in group Male 
    ##             8.442009             8.293237

This shows us that hatch mass depends on the sex of the chick (p =
0.0221).

After exploring the dataset, formulate some additional tentative
hypotheses that you wish to test. I have provided some examples of the
types of graphs that you could consider. You should alter these examples
for your own use (and fix any issues that you find.)

``` r
ggplot(quail) +
  aes(x = hatch.mass) +
  geom_histogram(bins=100) +
  theme_cowplot()
```

![](Homework03_files/figure-gfm/Data%20Visualization-1.png)<!-- -->

``` r
ggplot(quail) +
  aes(x = hatch.mass, color = sex, fill = sex) +
  geom_histogram(binwidth = 0.5, position = "dodge") +
  theme_cowplot()
```

![](Homework03_files/figure-gfm/Data%20Visualization-2.png)<!-- -->

``` r
ggplot(quail) +
  aes(x = hatch.mass,  fill = sex) + 
  geom_density(alpha=.3) +
  theme_cowplot()
```

![](Homework03_files/figure-gfm/Data%20Visualization-3.png)<!-- -->

There appears to be some other factors influencing the hatch mass, in
addition to sex.

### Explore the data to determine at least one other variable to incorporate into your model

For comparison, you should choose one variable that you expect might be
significant and one that you expect will not be.

### Use the lm() function from Lab03 to test a hypothesis about one or more of these other factors.

I have provided the base example.

### Which p value equals (approximately) the p value from the original t.test()?

``` r
lmSex <- lm(hatch.mass ~ sex, data=quail)
summary(lmSex)
```

    ## 
    ## Call:
    ## lm(formula = hatch.mass ~ sex, data = quail)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -3.11201 -0.69762 -0.02324  0.61676  2.79799 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  8.44201    0.04550 185.555   <2e-16 ***
    ## sexMale     -0.14877    0.06488  -2.293   0.0221 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.979 on 909 degrees of freedom
    ## Multiple R-squared:  0.005752,   Adjusted R-squared:  0.004658 
    ## F-statistic: 5.258 on 1 and 909 DF,  p-value: 0.02207

### Compare this model to the original model that depended only on sex.

Note to compare models using the anova() function, they need to be
nested. That is, one needs to be an extension of the other by adding one
or more terms.

## Peer Review

``` r
roster <- read_csv("../../00-Syllabus/roster_2023.csv")
```

    ## Rows: 20 Columns: 8
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (7): NAME, EMAL, MAJR, CLAS, Realname, Username, Reponame
    ## dbl (1): SECTION
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
roster %>%
  filter(SECTION == "1") %>%
  mutate(Peer1 = lag(Realname)) %>%
  mutate(Peer2 = lag(Realname, n = 2)) %>%
  select(Realname, Peer1, Peer2) %>%
  print()
```

    ## # A tibble: 8 × 3
    ##   Realname           Peer1              Peer2             
    ##   <chr>              <chr>              <chr>             
    ## 1 Meredith Brendel   <NA>               <NA>              
    ## 2 Naomi Douek        Meredith Brendel   <NA>              
    ## 3 Molly Frattasio    Naomi Douek        Meredith Brendel  
    ## 4 Dariel Guzman      Molly Frattasio    Naomi Douek       
    ## 5 Claudia Halbreiner Dariel Guzman      Molly Frattasio   
    ## 6 Heather Paula-Gil  Claudia Halbreiner Dariel Guzman     
    ## 7 Sam Pring          Heather Paula-Gil  Claudia Halbreiner
    ## 8 Abigail Thrall     Sam Pring          Heather Paula-Gil

``` r
roster %>%
  filter(SECTION == "2") %>%
  mutate(Peer1 = lag(Realname)) %>%
  mutate(Peer2 = lag(Realname, n = 2)) %>%
  select(Realname, Peer1, Peer2) %>%
  head(n = Inf)
```

    ## # A tibble: 12 × 3
    ##    Realname       Peer1          Peer2         
    ##    <chr>          <chr>          <chr>         
    ##  1 Aiko Amano     <NA>           <NA>          
    ##  2 Isaac Buabeng  Aiko Amano     <NA>          
    ##  3 Andrew DeSana  Isaac Buabeng  Aiko Amano    
    ##  4 Jasmine Gao    Andrew DeSana  Isaac Buabeng 
    ##  5 Jerry Ling     Jasmine Gao    Andrew DeSana 
    ##  6 Katy Martinson Jerry Ling     Jasmine Gao   
    ##  7 Anna Prohofsky Katy Martinson Jerry Ling    
    ##  8 Paul Saum      Anna Prohofsky Katy Martinson
    ##  9 Meghan Smith   Paul Saum      Anna Prohofsky
    ## 10 Gloria Sporea  Meghan Smith   Paul Saum     
    ## 11 Micah Umeh     Gloria Sporea  Meghan Smith  
    ## 12 Carol Zheng    Micah Umeh     Gloria Sporea

## Completion Checklist

For completion of the assignment (DUE FRIDAY): \[ \] Provide functional
code that completes each objective \[ \] Annotate the code with
rationale and conclusions \[ \] Push this code to your personal Repo
before the deadline (Friday at 11:59pm) \[ \] Provide acknowledgements
(below) for any help you received, including links if applicable

For full credit of the assignment (DUE MONDAY): \[ \] Browse the Repo
from two other members of the class (see separate email) \[ \] Use the
“Reference in New Issue” command on github.com to provide feedback \[ \]
Find at least one constructive criticism to improve the code or
annotation \[ \] Comment on at least one approach or interpretation that
you could use to improve your future analysis in this class

# \## Acknowledgements
