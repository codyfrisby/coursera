library(dplyr); library(data.table)
daq <- data.table(daq) #get our SQL query loaded as a data.table

cust <- data.table(cust)

#press <- daq[daq$StationID == 1 | daq$StationID == 3 | daq$StationID 
             == 14, ]
#press <- press[, list(pressrejects = sum(Rejected, na.rm = TRUE), 
                         freq = .N), by = c("InspectionID", "TotalParts")]

#subset for leaching and xray stations to count leaching rejects
leaching <- daq[daq$StationID == 10 | daq$StationID == 49 | 
                      daq$RejectCodeID == 45 | daq$RejectCodeID == 48, ]

leaching <- leaching[, list(leachrejects = sum(Rejected, na.rm = TRUE), 
                      freq = .N), by = c("InspectionID", "TotalParts",
                                         "AcidTime", "CustomerNumber")]
leach_cust <- merge(leaching, cust, by = "CustomerNumber")
daq14 <- leach_cust[, -c(1,3,6), with = FALSE]

#replace NA values with 0 before merging data tables
#daq14$leachrejects <- replace(daq14$leachrejects, 
#                               is.na(daq14$leachrejects), 0)

#below will be the master table with sum of all rejects by inspection #
Total_Rejects <- daq[, list(sum_Rejected = sum(Rejected, na.rm = TRUE), 
                    freq = .N), by = c("InspectionID", "TotalParts",
                                       "CreatedDate")]
#merge data tables
daq4 <- merge(Total_Rejects, daq14, by = "InspectionID", all.x = TRUE)

#add a calculated leachyield column
daq4$leachyield <- 1 - (daq4$leachrejects / (daq4$TotalParts - 
                        (daq4$sum_Rejected-daq4$leachrejects)))
#add a total yield column
daq4$totalyield <- 1 - (daq4$sum_Rejected / daq4$TotalParts)
mean(daq4$leachyield, na.rm = TRUE)
mean(daq4$totalyield)
write.csv(daq4, "yields.csv")
