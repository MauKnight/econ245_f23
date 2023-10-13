rm(list=ls()) # clear the environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#-------Import necessary packages here-------------------#
# Note: Using other packages than the ones listed below can break the autograder
library(tidyverse) # importing a package

#------ Uploading PERMID --------------------------------#
PERMID <- "7205065" #Type your PERMID within the quotation marks
PERMID <- as.numeric(gsub("\\D", "", PERMID)) #Don't touch
set.seed(PERMID) #Don't touch

#------ Answer ------------------------------------------#
airbnb = read_csv("airbnb_data.csv")

airbnb = rename(airbnb, neighborhood = neighbourhood)

airbnb %>% count(neighborhood) %>% filter(!is.na(neighborhood)) %>% arrange() %>% head(n = 20)

neighborhoods = airbnb %>% count(neighborhood) %>% filter(!is.na(neighborhood)) %>% arrange(desc(n)) %>% head(n = 20)

airbnb_top_neighborhoods = airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)

summary_stats_top_neighborhoods = airbnb_top_neighborhoods %>% group_by(neighborhood) %>% summarize(avg_square_feet = mean(square_feet, na.rm = TRUE), avg_price = mean(price, na.rm = TRUE), sd_price = sd(price, na.rm =T), max_price = max(price, na.rm =T), min_price = min(price, na.rm =T)) %>% arrange(desc(avg_square_feet))

highest_avg_square_ft = summary_stats_top_neighborhoods %>% slice(1) %>% pull(avg_square_feet)

second_avg_price = summary_stats_top_neighborhoods %>% arrange(desc(avg_price)) %>% slice(2) %>% pull(avg_price)
