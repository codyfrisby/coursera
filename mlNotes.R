## Installing older version of packages
library(devtools)
install_version("RWeka", version = "0.4-23", 
                repos = "http://cran.us.r-project.org")
# i found version by linking through 
# https://cran.r-project.org/web/packages/RWeka/index.html
# and then clicking the Old Sources Archive
# now I can run the machine learning stuff from chapter 5 
# R Machine Learning book
setwd("~/Documents/coursera/rml") #where the data files are
mushrooms <- read.csv("chapter 5/mushrooms.csv", 
                      stringsAsFactors = TRUE)
