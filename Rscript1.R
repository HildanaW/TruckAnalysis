library(dplyr)
library(tidyverse)
library(readxl)
library(lubridate)
library(tidyr)
rm(list = ls())
setwd("/Users/hildanateklegiorgis/Desktop/Data 331/Rproject")
df_case1<-read_excel("NP_EX_1-2.xlsx", skip = 3, .name_repair = "universal")


df <- df_case1 %>%
  dplyr::select(-"Summary")
total_hours_driving <- sum(df$Hours)
df$total_hours_driving <- total_hours_driving
df$days_driving <- as.numeric(df$Date[21] - df$Date[1])
df$Average_hours_per_day<-sum(df$Hours)/df$days_driving
df$total_fuel_purchase<-df$Gallons*df$Price.per.Gallon
df$total_fuel_expenses=sum(df$total_fuel_purchase)
df$other_expenses=sum(df$Tolls)+sum(df$Misc)
df$Total_expenses=sum(df$total_fuel_expenses)+sum(df$other_expenses)
df$Total_Gallons_consumed=sum(df$Gallons)
df$Total_Miles_driven=sum(df$Odometer.Ending-df$Odometer.Beginning)
df$Miles_per_Gallon=df$Total_Miles_driven/df$Total_Gallons_consumed
df$Total_Cost_Per_Mile=df$Total_expenses/df$Total_Miles_driven

