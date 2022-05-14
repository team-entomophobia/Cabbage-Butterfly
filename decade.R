library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)

#set up working directory and the raw file
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

df1 <- df %>%
  dplyr::select("coreid", "year")
df1$year <-substring(df1$year, 1,3)
df1$year <- paste(df1$year, "0s", sep = "")

df2 <- df1 %>%
  count(year)

ggplot(data = df2, aes(x=year, y = n, group = 1)) +
  geom_line(color = "#FF6600") +
  ggtitle("Number of Butterflies recorded by Decades")+
  labs(x = "Decades", y = "Number of Butterflies")+ geom_point(color = "#003399")+
  theme_minimal()