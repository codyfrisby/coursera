files <- list.files()

dat <- data.frame()

for (i in 1:length(files)){
  
  dat <- rbind(dat, read.table(files[i], header = FALSE, sep = ",", 
                        col.names = c("Time", "Force")))
  
}  
write.csv(dat, file = "TWSST Load Data.csv")