### 
### This is the file where we make figure 2a from Smith et al 2021
### 

### Load packages
## nlme 
library("tidyverse")

## Look at all data:
data <- read_csv("data/Smith_2017-19_benthic_data.csv") %>% 
  select(Stipe_Density, log1pur=`Log+1_PUR_Density`, Residual_Prop_urchins_exp)

# Fit negative exponential decay model
fit <- nls(Residual_Prop_urchins_exp ~ a + b * exp(c * Stipe_Density), 
           start = c(a = -0.16, b = 0.33, c = -3.11),
           data = data)

a <- coef(fit)["a"]
b <- coef(fit)["b"]
c <- coef(fit)["c"]
# do the same for b and c
predictions <- tibble(
  Stipe_Density = seq(0, 13, by = 0.01), # change start, end, and step_length
  Residual_Prop_urchins_exp = a + b * exp(c * Stipe_Density)
)

## Trying to plot
# Basic scatter plot
ggplot(data, aes(x=Stipe_Density, y=Residual_Prop_urchins_exp)) + 
  geom_point() +
  geom_line(data=predictions)
