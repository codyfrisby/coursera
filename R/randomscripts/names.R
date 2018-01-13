#download file from Social Security websit and unzip it.
if(!file.exists("data")){
        dir.create("data")}

download.file("https://www.ssa.gov/oact/babynames/names.zip",
                   destfile = "files")
unzip("files", exdir = "./data")
unlink("files")
file.rename("./data/NationalReadMe.pdf", "NationalReadme.PDF")
f <- list.files("./data") ##create a list of files in directory
setwd("./data")
library(data.table)
dat <- data.table()  ##create empty data frame

for (i in 1:length(f)){## loop through files and write data to data frame
        
        dat2 <- data.table()
        dat2 <- read.table(f[i], header = FALSE, sep = ",", 
                           col.names = c("Name", "Sex", "Occurence"))
        dat2$year <- as.numeric(substr(f[i], 4, 7))
        dat <- rbind(dat, dat2)
        
}

remove(dat2)
write.csv(dat, "names.csv")  ##export data to csv format


library(dplyr); library(ggplot2)
namesyear <- dat %>%
        group_by(year, Sex) %>%
        summarise_each(funs(sum), Occurence)
qplot(year, Occurence, data = namesyear, color = Sex, ylab = 
              "Babies Born")

v <- 1999:2014
S <- namesyear[year %in% v]
qplot(year, Occurence, data = S, color = Sex, geom = "line")
