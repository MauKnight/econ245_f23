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