ch <- odbcConnect("Report Server", uid = "ProdViewer", pwd = "report")
dat2 <- sqlQuery(ch, "SELECT A.PartNum, A.PrintedDate, C.Rejected, C.RejectCodeName, 
                C.TotalParts,A.inspectionID, A.PartDescr, 
                C.StationName, C.StationID, C.InspectionDate
                FROM uss_LeachedParts_vw AS A
                INNER JOIN uss_QualityInspection_vw AS C
                ON A.inspectionID = C.InspectionID
                WHERE A.PartDescr LIKE '%HC-%'
                AND C.InspectionDate BETWEEN '2015-11-02'
                AND '2015-11-06'
                ")
library(plyr)
y <- ddply(dat2, .(inspectionID), summarize, sumr = sum(Rejected, na.rm = TRUE), 
           yield = 1 - (sumr / 24))
mean(y$yield)
dat3 <- dat2[order(dat2$Rejected, dat2$inspectionID, decreasing = TRUE), ]
