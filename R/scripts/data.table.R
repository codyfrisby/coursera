# example
df<-data.frame(id=c("xx33","xx33","xx22","xx11","xx11","xx00"),
               amount=c(10,15,100,20,10,15),date=c("01/02/2013",
                "01/02/2013","02/02/2013","03/03/2013","03/03/2013","04/04/2013"))
df
library(data.table)
dt <- data.table(df)
dt2 <- dt[,list(sumamount = sum(amount), freq = .N), by = "id"]
dt2
# ^ is an example of using data.table and subsetting
library(data.table)
daq1 <- data.table(daq) #get our SQL query loaded as a data.table
rm(daq) #free up the memory

#subset for leaching and xray stations
daq12 <- daq1[daq1$StationID == 10 | daq1$StationID == 49, ]
daq12 <- daq12[, list(leachingrejects = sum(Rejected, na.rm = TRUE), 
                      freq = .N), by = c("inspectionID", "TotalParts")]
daq12 <- daq12[, -c(2,4), with = FALSE] #keeps two columns

#below will be the master table with sum of all rejects by inspection #
daq2 <- daq1[, list(sumrejects = sum(Rejected, na.rm = TRUE), 
                    freq = .N), by = c("inspectionID", "TotalParts")]

#replace NA values with 0 before merging data tables
daq12$leachingrejects <- replace(daq12$leachingrejects, is.na(daq12$leachingrejects), 0)

#merge data tables
daq4 <- merge(daq2, daq12, by = "inspectionID", all.x = TRUE)
#add a calculated leachyield column
daq4$leachyield <- 1 - (daq4$leachingrejects / (daq4$TotalParts - 
                                                        (daq4$sumrejects-daq4$leachingrejects)))
#add a total yield column
daq4$totalyield <- 1 - (daq4$sumrejects / daq4$TotalParts)
mean(daq4$leachyield, na.rm = TRUE); mean(daq4$totalyield)
