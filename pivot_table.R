library(tidyverse)
library(dplyr)

#set up directory
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

#Group years into decade
df$Year <- substr(df$Year,1,3)
df$Year <- paste(df$Year,sep='',"0's")

#Pivot Table
pt <- df %>%
  dplyr::select("Year","Sex","Country") %>%
  group_by(Country,Sex,Year) %>%
  summarize(numRecord = n()) %>%
  pivot_wider(names_from = Sex, values_from = numRecord) #covert the gender into 2 columns