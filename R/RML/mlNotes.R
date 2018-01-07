## Installing older version of packages
library(devtools)
install_version("RWeka", version = "0.4-7", 
                repos = "http://cran.us.r-project.org")
install.packages("rJava", type = 'source')
library(rJava)
.jinit()
.jcall("java/lang/System", "S", "getProperty", "java.runtime.version")
install.packages("rJava", "http://rforge.net/",type="source")
# i found version by linking through 
# https://cran.r-project.org/web/packages/RWeka/index.html
# and then clicking the Old Sources Archive
# now I can run the machine learning stuff from chapter 5 
# R Machine Learning book
setwd("~/Documents/coursera/rml") #where the data files are
mushrooms <- read.csv("chapter 5/mushrooms.csv", stringsAsFactors = TRUE)
library(RWeka)
table(mushrooms$type)
mushroom_1R <- OneR(type ~ ., data = mushrooms)

mushroom_JRip <- JRip(type ~ ., data = mushrooms)