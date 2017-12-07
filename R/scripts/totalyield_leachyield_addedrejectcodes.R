library(data.table)
daq1 <- data.table(daq) #get our SQL query loaded as a data.table
rm(daq) #free up the memory

#subset for leaching and xray stations
daq12 <- daq1[daq1$StationID == 10 | daq1$StationID == 49 | 
                      daq1$RejectCodeID == 45 | daq1$RejectCodeID == 48, ]
daq12 <- daq12[, list(leachingrejects = sum(Rejected, na.rm = TRUE), 
                      freq = .N), by = c("InspectionID", "TotalParts")]
daq12 <- daq12[, -c(2,4), with = FALSE] #keeps two columns
#replace NA values with 0 before merging data tables
daq12$leachingrejects <- replace(daq12$leachingrejects, 
                                 is.na(daq12$leachingrejects), 0)
#order daq by date and inspection #.
dtdate <- daq1[order(daq1$InspectionDate, daq1$InspectionID, decreasing = TRUE), ]
dtdate <- dtdate[!duplicated(dtdate$InspectionID), ] #remove rows with duplicate insp no.
dtdate <- dtdate[, c(7,10), with = FALSE] #keeps two columns

#below will be the master table with sum of all rejects by inspection #
daq2 <- daq1[, list(sumrejects = sum(Rejected, na.rm = TRUE), 
                    freq = .N), by = c("InspectionID", "TotalParts")]
#merge data tables
daq4 <- merge(daq2, daq12, by = "InspectionID", all.x = TRUE)
daq4 <- merge(daq4, dtdate, by = "InspectionID", all.x = TRUE)
rm(dtdate); rm(daq12)
#add a calculated leachyield column
daq4$leachyield <- 1 - (daq4$leachingrejects / (daq4$TotalParts - 
                                                        (daq4$sumrejects-daq4$leachingrejects)))
#add a total yield column
daq4$totalyield <- 1 - (daq4$sumrejects / daq4$TotalParts)
mean(daq4$leachyield, na.rm = TRUE); mean(daq4$totalyield)
