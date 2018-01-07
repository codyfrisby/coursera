#!/usr/bin/env Rscript
# R Machine Learning book Chapter 5
# C50 algorithm example
credit <- read.csv("~/Documents/mooc/RML/Machine Learning with R/chapter 5/credit.csv", stringsAsFactors = TRUE)
table(credit$default)
set.seed(12345)
credit_rand <- credit[order(runif(1000)), ]
credit_train <- credit_rand[1:900, ]
credit_test <- credit_rand[901:1000, ]
prop.table(table(credit_test$default))
prop.table(table(credit_train$default))
library(C50); library(gmodels) #C50 algorithm package
credit_model <- C5.0(credit_train[-17], credit_train$default)
summary(credit_model)
# boosting the model
credit_boost10 <- C5.0(credit_train[-17], credit_train$default, trials=10)
error_cost <- matrix(c(0, 1, 4, 0), nrow = 2)
# rJava needed as well as RWeka.  This will not work in an 
# R GUI or RStuidio session.  the OneR() algorithm is used here
####### UPDATE... I've discovered a workaround....
# check which version of java is running and installed
system2("java", args = "-version")
# make sure the correct version is below:
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
# librarys that require rJava will now open :)
##################### Better rJava Workaround ##############
# The Rprofile.site file is in the directory:
# /Library/Frameworks/R.framework/Versions/{version}/Resources/ect
###############################################################
mushrooms <- read.csv("~/Documents/mooc/RML/Machine Learning with R/chapter 5/mushrooms.csv", stringsAsFactors = TRUE)
table(mushrooms$type)
library(RWeka) # load dependent library
mushroom_1R <- OneR(type ~ ., data = mushrooms)
print(summary(mushroom_1R)) # print model to console
mushroom_JRip <- JRip(type ~ ., data = mushrooms)
print(summary(mushroom_JRip)) #print model to console
