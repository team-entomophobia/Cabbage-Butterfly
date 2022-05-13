library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(ggplot2)

#set up directory
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")


barplot(df$LWingLength, main = "Left Wing Length", xlab = "mm", horiz = FALSE)