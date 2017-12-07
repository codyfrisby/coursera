#these lines of code get data from the database based on a where statement
# for scan date being greater than or equal to a certain Year-Month-Day.
#It makes use of three awesome R librarys: RODBC, data.table, and dplyr.

library(RODBC)
ch <- odbcConnect("Portal", uid = "ProdViewer", pwd = "report")
daq <- sqlQuery(ch, "SELECT A.*, B.ScanDate, C.AcidTime, C.LeachCupID,
                D.PartDescr, D.CustomerNumber
                FROM uss_QualityInspection_vw AS A
                LEFT JOIN CardScan AS B
                ON A.InspectionID = B.InspectionID
                LEFT JOIN FinishedPart AS C
                ON A.FinishedPartID = C.FinishedPartID
                LEFT JOIN PartMaster AS D
                ON A.FinishedPartID = D.PartMasterID
                WHERE B.ScanDate > '2015-12-01' 
                ")
                               # change date above ^
library(data.table)
daq <- data.table(daq)

cust <- sqlQuery(ch, "SELECT fcustno AS CustomerNumber, fcompany AS Customer
                FROM m2mSlcdpmx
                WHERE M2MCompanyNum = 10")

cust <- data.table(cust)

#get cup part numbers for further yield interrogation.
cup <- sqlQuery(ch, "SELECT DISTINCT A.LeachCupID, B.PartNum AS LeachCup  
                FROM FinishedPart AS A
                INNER JOIN PartMaster AS B
                ON A.LeachCupID = B.PartMasterID")
cup <- data.table(cup)
#cup <- cup[!duplicated(cup$LeachCupID), ]
#line above isn't needed if you add DISTINCT to the SQL query.

#subset the data from the database based on leaching reject places or codes.
leaching <- daq[StationName == "Leaching" | StationName == "Xray" |
                daq$RejectCodeID == 45 | daq$RejectCodeID == 48 | daq$RejectCodeID == 54
                | daq$RejectCodeID == 170 | daq$RejectCodeID == 154 | daq$RejectCodeID == 131,]

leaching <- leaching[, list(leachrejects = sum(Rejected, na.rm = TRUE),
                            freq = .N), by = c("InspectionID", "TotalParts")]
#keep the columns we care about for a join below
leaching <- leaching[,.(InspectionID, leachrejects)]

#below will be the master table with sum of all rejects by inspection #
Total_Rejects <-
        daq[, list(sum_Rejected = sum(Rejected, na.rm = TRUE),
        freq = .N), by = c("InspectionID", "TotalParts", "ScanDate",
                           "AcidTime", "PartDescr", "CustomerNumber", "LeachCupID")]

#merge all the seperate data tables
All_Data <- merge(Total_Rejects, leaching, by = "InspectionID", all.x = TRUE)
All_Data <- merge(All_Data, cup, by = "LeachCupID", all.x = TRUE )
All_Data <- merge(All_Data, cust, by = "CustomerNumber", all.x = TRUE)
All_Data <- All_Data[, .(InspectionID, TotalParts, ScanDate, AcidTime, 
                         PartDescr, sum_Rejected, leachrejects, Customer, LeachCup)]
#free up some memory
rm(cup); rm(cust)

#add a calculated leachyield column
All_Data$leachyield <- 1 - (All_Data$leachrejects / (
        All_Data$TotalParts - (All_Data$sum_Rejected - All_Data$leachrejects)))

#add a total yield column
All_Data$totalyield <- 1 - (All_Data$sum_Rejected / All_Data$TotalParts)
#add a week column
All_Data$Week <- strftime(All_Data$ScanDate, format = "%W")
#some summary statistics
#mean(All_Data$leachyield, na.rm = TRUE)
#mean(All_Data$totalyield)

#pre$ScanDate <- as.POSIXct(pre$ScanDate)
#C <- rbind(pre, All_Data)

#optional code to run to see summary data by customer or other group
#library(dplyr)
#yieldsummary <- All_Data  %>%
#                filter(!is.na(leachyield)) %>%
#                group_by(AcidTime, Customer) %>%
#                summarise_each(funs(mean), leachyield)
#yieldsummary

#yield_cup_summary <- C %>%
#        filter(!is.na(leachyield)) %>%
#        group_by(LeachCup, Week) %>%
#        summarise_each(funs(mean), leachyield)
#yield_cup_summary

#for if you want to share or export to another program
#write.csv(yieldsummary, "yieldsummary.csv")
#write.csv(yield_cup_summary, "leachCUP&yield.csv")
#write.csv(C, "yields_by_INSP.csv")

#rm(list = ls())
