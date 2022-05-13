library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(reshape)
library(ggpubr)

#set up working directory and the raw file
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

#plot a
df1 <- df %>%
  group_by(sex) %>%
  summarise(min.LWingLength = min(LWingLength),
            mean.LWingLength = mean(LWingLength),
            median.LWingLength = median(LWingLength),
            max.LWingLength = max(LWingLength))

df1 <- pivot_longer(df1, cols = 2:5, names_to = "functions", values_to = "value")

a <- ggplot(df1, aes(fill = functions, x = sex, y = value)) +
  geom_bar(position = "dodge", stat = "identity")

#plotB
df2 <- df %>%
  group_by(sex) %>%
  summarise(min.RWingLength = min(RWingLength),
            mean.RWingLength = mean(RWingLength),
            median.RWingLength = median(RWingLength),
            max.RWingLength = max(RWingLength))

df2 <- pivot_longer(df2, cols = 2:5, names_to = "functions", values_to = "value")

b <- ggplot(df2, aes(fill = functions, x = sex, y = value)) +
  geom_bar(position = "dodge", stat = "identity")

#combine
figure <- ggarrange(a, b, labels = c("A", "B"), ncol = 2, nrow = 1)