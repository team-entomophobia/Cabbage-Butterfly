library(tidyverse)
library(dplyr)
library(readxl)

rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

df_europe <- df %>%
  dplyr::filter(country == "United Kingdom" | country == "Republic of Ireland")

df_america <- df %>%
  dplyr::filter(country == "United States" | country == "canada")

t.test(df_europe$LWingLength,df_america$LWingLength, var.equal = FALSE)
