library(tidyverse)
library(dplyr)
library(readxl)

rm(list = ls())
setwd("/Users/chloefausett/Library/Mobile Documents/com~apple~CloudDocs/Documents/DATA 332/cabbage_butterfly-main")
df <- read_csv("data/clean_data.csv")

#Selecting columns
df_male_female <- df %>%
  dplyr::select("sex", "LWingLength", "LWingWidth", "RWingLength", "RWingWidth")

#Get table of gender to perform t-test
df_male_female_pivot <- df_male_female %>%
  dplyr::group_by(sex) %>%
  dplyr::summarise(number = n())

#Location
df_country <- df %>%
  dplyr::select("country", "LWingLength", "LWingWidth", "RWingLength", "RWingWidth")

#Get table of Countries to perform t-test
df_country_pivot <- df_country %>%
  dplyr::group_by(country) %>%
  dplyr::summarise(number = n())

#t-test performed
t.test(df_country_pivot$number) #t-test by country  
t.test(df_male_female_pivot$number) #t-test by gender



df_europe <- df %>%
  dplyr::filter(countr == "United Kingdom" | country == "Republic of Ireland")

df_america <- df %>%
  dplyr::filter(country == "United States" | country == "Canada")

t.test(df_europe$LwingLength, df_america$LWingLength, var.equal = FALSE)
