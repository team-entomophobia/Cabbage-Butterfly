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
df1$year <- paste(df1$year, "0", sep = "")

df2 <- df1 %>%
  count(year)

ggplot(data = df2, aes(x=year, y = n, group = 1)) +
  geom_line(color = "blue") +
  ggtitle("Number of butterflies recorded by decade")+
  labs(x = "decades", y = "number of butterflies")+ geom_point()