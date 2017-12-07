# check for directory
if(!file.exists("babydata")){
  dir.create("babydata")}

# check for dependent packages
if(!("data.table" %in% rownames(installed.packages()))) {
  install.packages("data.table")
}

if(!("ggplot2" %in% rownames(installed.packages()))) {
  install.packages("ggplot2")
}

if(!("dplyr" %in% rownames(installed.packages()))) {
  install.packages("dplyr")
}

#download file from Social Security websit and unzip it.
download.file("https://www.ssa.gov/oact/babynames/names.zip",
              destfile = "files")
unzip("files", exdir = "./babydata")
unlink("files")
file.rename("./babydata/NationalReadMe.pdf", "NationalReadme.PDF")

message("Finished downloading data from social security DB.  Reading them now... Please Wait....")

f <- list.files("babydata", pattern = "\\.txt$") ##create a list of files in directory

#setwd("./babydata")

#library(data.table)
#dat <- data.table()  ##create empty data frame
dat <- data.frame()

for (i in 1:length(f)){## loop through files and write data to data frame
  
  dat2 <- data.frame()
  dat2 <- read.table(paste0("babydata/", f[i]), 
                            header = FALSE, sep = ",", 
                            col.names = c("Name", "Sex", "Occurence"))
  dat2$year <- as.numeric(substr(f[i], 4, 7))
  dat <- rbind(dat, dat2)
  
}

remove(dat2)
write.csv(dat, "babynames.csv")  ##export data to csv format

# plot the data
#library(dplyr); library(ggplot2)
#namesyear <- dat %>%
#  group_by(year, Sex) %>%
#  summarise_at(funs(sum), Occurence)

#print(qplot(year, Occurence, data = namesyear, color = Sex, ylab = 
#        "Babies Born", main("Social Security Database Baby Names")))

#v <- 1999:2014
#S <- namesyear[names$year %in% v, ]
#qplot(year, Occurence, data = S, color = Sex, geom = "line")

graph <- function(z){
  yz <- dat[Name == z]
  qplot(year, Occurence, data = yz, color = Sex,
        main = z)
}

message("Operation finished successfully.  Try typing graph('Name')")
