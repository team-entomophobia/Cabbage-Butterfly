library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(reshape)

#set up working directory and the raw file
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

df1 <- df %>%
  group_by(sex) %>%
  summarise(min.LWingLength = min(LWingLength),
            mean.LWingLength = mean(LWingLength),
            median.LWingLength = median(LWingLength),
            max.LWingLength = max(LWingLength))

df2 <- pivot_longer(df1, cols = 2:5, names_to = "functions", values_to = "value")

ggplot(df2, aes(fill = functions, x = sex, y = value)) +
  geom_bar(position = "dodge", stat = "identity")