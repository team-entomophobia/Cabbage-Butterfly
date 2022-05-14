library(tidyverse)
library(dplyr)

#set up directory
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

#Group years into decade
df$year <- substr(df$year,1,3)
df$year <- paste(df$year,sep='',"0's")

#Pivot Table
pt <- df %>%
  dplyr::select("year","sex","country") %>%
  group_by(country,sex,year) %>%
  summarize(numRecord = n()) %>%
  pivot_wider(names_from = sex, values_from = numRecord) #covert the gender into 2 columns