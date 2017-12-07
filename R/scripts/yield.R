yields <- function(x) {
        library(RODBC)
        x <- paste("'",x,"'",sep = "")#x has to be in quotes
        ch <-
                odbcConnect("Portal", uid = "ProdViewer", pwd = "report")
        daq <-
                sqlQuery(
                        ch, paste(
                                "SELECT A.PartNumber, A.Rejected, A.RejectCodeName,
                                A.RejectCodeID, A.TotalParts, A.PartDesc, A.InspectionDate,
                                A.StationName, A.StationID, A.InspectionID, A.BUName,
                                A.CreatedDate, B.AcidTime, B.CustomerNumber
                                FROM uss_QualityInspection_vw AS A
                                LEFT JOIN uss_LeachedFinishParts_vw AS B
                                ON A.PartMasterID = B.PartMasterID
                                WHERE A.CreatedDate >= ",x))
        
        cust <- sqlQuery(
                        ch, "SELECT fcustno AS CustomerNumber, fcompany AS Customer
                        FROM m2mSlcdpmx
                        WHERE M2MCompanyNum = 10 ")
        library(data.table)
        
        daq <- data.table(daq) #get our SQL query loaded as a data.table
        
        cust <- data.table(cust)
       
        #subset for leaching and xray stations to count leaching rejects
        leaching <- daq[daq$StationID == 10 | daq$StationID == 49 |
                                daq$RejectCodeID == 45 |
                                daq$RejectCodeID == 48,]
        
        leaching <- leaching[, list(leachrejects = sum(Rejected, na.rm = TRUE),
                                freq = .N), by = c("InspectionID", "TotalParts",
                                                   "AcidTime", "CustomerNumber")]
        leach_cust <- merge(leaching, cust, by = "CustomerNumber")
        daq14 <- leach_cust[,-c(1,3,6), with = FALSE]
        
        #below will be the master table with sum of all rejects by inspection #
        Total_Rejects <-
                daq[, list(sum_Rejected = sum(Rejected, na.rm = TRUE),
                           freq = .N), by = c("InspectionID", "TotalParts",
                                              "CreatedDate")]
        #merge data tables
        daq4 <-
                merge(Total_Rejects, daq14, by = "InspectionID", all.x = TRUE)
        
        #add a calculated leachyield column
        daq4$leachyield <- 1 - (daq4$leachrejects / (
                daq4$TotalParts -
                        (daq4$sum_Rejected -
                                 daq4$leachrejects)
        ))
        #add a total yield column
        daq4$totalyield <- 1 - (daq4$sum_Rejected / daq4$TotalParts)
        yield_data <- daq4
        mean(daq4$leachyield, na.rm = T)
}
