##NOTE: First set working directory

files <- list.files() ##create a list of files in directory

dat <- data.frame()  ##create empty data frame

for (i in 1:length(files)){  ## loop through files and write data to data frame
  
  dat2 <- data.frame()
  dat2 <- read.table(files[i], header = FALSE, sep = ",", 
                               col.names = c("x", "y"))
  dat2$id <- files[i]
  dat <- rbind(dat, dat2)
  
}  

write.csv(dat, file = "filename.csv")  ##export data to csv format
remove(dat2) #get rid of clutter.
