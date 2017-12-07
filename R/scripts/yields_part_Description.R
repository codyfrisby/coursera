leachyields <- function(x = NULL) {
        # load dependent libraries
        x <- paste("'","%",x,"%","'",sep = "")#x has to be in quotes
        library(RODBC)
        ch <- odbcConnect("Report Server", uid = "ProdViewer", pwd = "report")
        daq <<- sqlQuery(ch, paste("SELECT C.PartNumber, C.Rejected, C.RejectCodeName, 
                        C.RejectCodeID, C.TotalParts, C.PartDesc, C.InspectionDate,
                        C.StationName, C.StationID, C.InspectionID
                        FROM uss_QualityInspection_vw AS C
                        WHERE C.InspectionDate BETWEEN
                        '2015-10-01' AND '2015-11-12'
                        AND C.PartDesc LIKE ", x))
                        
        close(ch)
        
}