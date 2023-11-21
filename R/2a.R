### 
### This is the file where we make figure 2a
### Against the rules, we are doing this before writing our plan heehee

### Load packages
## nlme 
library("data.table")
library("tidyverse")

### Call CSV
data2a <- fread("data/Smith_2017-19_benthic_data.csv", select = c("Gonad Index", "Stipe_Density", "Residual_Prop_urchins_exp"))


