library(tidyverse)
library(dplyr)
library(readxl)
library(ggplot2)

rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

#Compute the size of each wing
df_wing_size <- df %>%
  dplyr::mutate(leftArea = LWingLength*LWingWidth, rightArea = RWingLength*RWingWidth)

#Divding butterflies into two group: Europe vs. America
df_europe <- df_wing_size %>%
  dplyr::filter(country == "United Kingdom" | country == "Republic of Ireland")

df_america <- df_wing_size %>%
  dplyr::filter(country == "United States" | country == "Canada")

#Computing t-test on both wings by Continent
t.test(df_europe$leftArea, df_america$leftArea, alternative = "less", var.equal = FALSE)
t.test(df_europe$rightArea, df_america$rightArea, alternative = "less", var.equal = FALSE)
