library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)
library(ggplot2)

#set up directory
rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read.csv("data/clean_data.csv")

df1 <- df %>%
  group_by(sex) %>%
  count(country)

ggplot(df1, aes(fill = sex, y = n, x = country)) +
  geom_bar(position = "stack", stat = "identity") +
  ggtitle("Number of Butterflies recorded by Sex and Country") +
  labs(x = "Country", y = "Number of Butterflies") +
  scale_fill_manual(values = c("#FFCC33", "#003366"), 
                    name = "Sex", labels = c("Female", "Male"))+
  theme_minimal()
