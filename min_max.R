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

#plot left wing length
df1 <- df %>%
  group_by(sex) %>%
  summarise(min.LWingLength = min(LWingLength),
            mean.LWingLength = mean(LWingLength),
            median.LWingLength = median(LWingLength),
            max.LWingLength = max(LWingLength))

df1 <- pivot_longer(df1, cols = 2:5, names_to = "functions", values_to = "value")

a <- ggplot(df1, aes(fill = functions, x = sex, y = value)) +
  geom_bar(position = "dodge", stat = "identity") +
  ggtitle("Left Wing Length")

#plot left wing width
df3 <- df %>%
  group_by(sex) %>%
  summarise(min.LWingWidth = min(LWingWidth),
            mean.LWingWidth = mean(LWingWidth),
            median.LWingWidth = median(LWingWidth),
            max.LWingWidth = max(LWingWidth))

df3 <- pivot_longer(df3, cols = 2:5, names_to = "functions", values_to = "value")

c <- ggplot(df1, aes(fill = functions, x = sex, y = value)) +
  geom_bar(position = "dodge", stat = "identity")+
  ggtitle("Left Wing Width")

#plot right wing length
df2 <- df %>%
  group_by(sex) %>%
  summarise(min.RWingLength = min(RWingLength),
            mean.RWingLength = mean(RWingLength),
            median.RWingLength = median(RWingLength),
            max.RWingLength = max(RWingLength))

df2 <- pivot_longer(df2, cols = 2:5, names_to = "functions", values_to = "value")

b <- ggplot(df2, aes(fill = functions, x = sex, y = value)) +
  geom_bar(position = "dodge", stat = "identity") +
  ggtitle("Right Wing Length")

#plot right wing width
df4 <- df %>%
  group_by(sex) %>%
  summarise(min.RWingWidth = min(RWingWidth),
            mean.RWingWidth = mean(RWingWidth),
            median.RWingWidth = median(RWingWidth),
            max.RWingWidth = max(RWingWidth))

df4 <- pivot_longer(df4, cols = 2:5, names_to = "functions", values_to = "value")

d <- ggplot(df4, aes(fill = functions, x = sex, y = value)) +
  geom_bar(position = "dodge", stat = "identity")+ 
  ggtitle("Right Wing Width")
#combine
ggarrange(a, b, c, d, ncol = 2, nrow = 2)