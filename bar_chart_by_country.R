library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(ggplot2)

#set up directory
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")


x<- table(df$country)
barplot(x, main = "Number of butterflies recorded by Country",
        xlab = "Country", ylab = "Number of butterflies", col = "blue")

