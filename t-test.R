library(tidyverse)
library(dplyr)
library(readxl)
library(ggplot2)

#set up directory
rm(list = ls())
setwd("/Users/baodinhgiatran/Desktop/DATA 332/cabbage_butterfly-main")
df <- read.csv("clean_data.csv")

#remove unknown sex value
df <-subset(df, sex != "unknown")

#Compute the size of each wing
df_wing_size <- df %>%
  dplyr::mutate(leftArea = LWingLength*LWingWidth, rightArea = RWingLength*RWingWidth)

#Dividing butterflies into two group: Europe vs. America
df_europe <- df_wing_size %>%
  dplyr::filter(country == "United Kingdom" | country == "Republic of Ireland")

df_america <- df_wing_size %>%
  dplyr::filter(country == "United States" | country == "Canada")

#Computing t-test on both wings by Continent
t.test(df_europe$leftArea, df_america$leftArea, alternative = "less", var.equal = FALSE)
t.test(df_europe$rightArea, df_america$rightArea, alternative = "less", var.equal = FALSE)

#dividing into male and female
df_female <- df_wing_size %>%
  dplyr::filter(sex == "female")

df_male <- df_wing_size %>%
  dplyr::filter(sex == "male")

#Computing t-test on both wings by sex
t.test(df_male$LWingLength, df_female$LWingLength, var.equal = FALSE)
t.test(df_male$RWingLength, df_female$RWingLength, var.equal = FALSE)
t.test(df_male$LWingWidth, df_female$LWingWidth, var.equal = FALSE)
t.test(df_male$RWingWidth, df_female$RWingWidth, var.equal = FALSE)