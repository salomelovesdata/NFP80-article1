#***********************************************************************
#01 set up ----

# Working dictionary
pacman::p_load(rstudioapi,dplyr,psych,haven,apaTables,readxl,tidyverse,MplusAutomation,semTools, lavaan)

options(scipen=999, max.print=5000)

setwd(dirname(getActiveDocumentContext()$path))

mydata <- read.csv("filtered_data_test.csv", sep = ",", na = c('NA','-77', '-99', '-66'))
view(mydata)  


#. Check and delete duplicated cases ----
#library(dplyr)
duplicates <- mydata %>% 
  group_by(p_0001) %>% #here I used 'userID' instead of 'p0001' Correct? 
  mutate(dupe = n()>1) %>%
  filter(dupe==T)
print(nrow(duplicates)) # Number of duplicates (0)


#***********************************************************************
#*
#*