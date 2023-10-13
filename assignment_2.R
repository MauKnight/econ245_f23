rm(list=ls()) # clear the environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#-------Import necessary packages here-------------------#
# Note: Using other packages than the ones listed below can break the autograder
library(tidyverse) # importing a package

#------ Uploading PERMID --------------------------------#
PERMID <- "9911876" #Type your PERMID within the quotation marks
PERMID <- as.numeric(gsub("\\D", "", PERMID)) #Don't touch
set.seed(PERMID) #Don't touch

#------ Answer ------------------------------------------#

## Problem 2

# P2 1. Setting data
airbnb <- read_csv("airbnb_data.csv") %>% # read csv
  rename("neighborhood"="neighbourhood")

# P2 2.a
neighborhoods <- airbnb %>% 
  filter(!is.na(neighborhood)) %>% 
  group_by(neighborhood) %>% 
  summarize(n=n()) %>% 
  arrange(desc(n)) %>%
  head(20) %>% 
  ungroup()


# P2 2.b
airbnb_top_neighborhoods <- airbnb %>% 
  filter(neighborhood %in% neighborhoods$neighborhood)

# P2 2.c
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% 
  group_by(neighborhood) %>% 
  summarize(avg_square_feet=mean(square_feet, na.rm = TRUE),
            avg_price=mean(price, na.rm = TRUE),
            sd_price=sd(price,na.rm = TRUE),
            max_price=max(price, na.rm = TRUE),
            min_price=min(price, na.rm = TRUE)) %>% 
  arrange(desc(avg_square_feet))

# P2 2.d
highest_avg_square_ft <- summary_stats_top_neighborhoods %>% 
  slice(1) %>% 
  pull(avg_square_feet)

# P2 2.e
second_avg_price <- summary_stats_top_neighborhoods %>% 
  slice(2) %>% 
  pull(avg_price)

#------ End ------------------------------------------#