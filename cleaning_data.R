library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)

rm(list = ls())
setwd("H:/Cabbage-Butterfly")
df <- read_excel("data/CompletePierisData_2022-03-09.xlsx")

df$SexUpdated <- gsub("(?i)Female|(?i)F", "female",df$SexUpdated)
df$SexUpdated <- gsub("(?i)Male|(?i)M", "male",df$SexUpdated)
df$SexUpdated[df$SexUpdated == "female?"] <- "female"
df$SexUpdated[df$SexUpdated =="male?"] <- "male"
df$SexUpdated[is.na(df$SexUpdated)] <- "unknown"


df_butterfly <- read_excel("data/CompletePierisData_2022-03-09.xlsx", sheet = 1) %>%
  dplyr::rename("country" = "dwc:country")

df_clean <- df_butterfly %>%
  dplyr::select("coreid", "SexUpdated", "LWingLength", "LWingWidth","LBlackPatchApex",
                "LAnteriorSpotM3", "LPosteriorSpotCu2", "RWingLength", "RWingWidth",
                "RBlackPatchApex","RAnteriorSpotM3", "RPosteriorSpotCu2","country")
