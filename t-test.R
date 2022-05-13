library(tidyverse)
library(dplyr)
library(readxl)

rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

df_europe <- df %>%
  dplyr::filter(country == "United Kingdom" | country == "Republic of Ireland") %>%
  dplyr::mutate(leftArea = LWingLength*LWingWidth, rightArea = RWingLength*RWingWidth)


df_america <- df %>%
  dplyr::filter(country == "United States" | country == "Canada") %>%
  dplyr::mutate(leftArea = LWingLength*LWingWidth, rightArea = RWingLength*RWingWidth)


#t.test(df_europe$LWingLength, df_america$LWingLength, alternative = "less", var.equal = FALSE)

t.test(df_europe$leftArea, df_america$leftArea, alternative = "less", var.equal = FALSE)
t.test(df_europe$rightArea, df_america$rightArea, alternative = "less", var.equal = FALSE)
