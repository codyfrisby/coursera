library(RODBC)
ch <- odbcConnect("Portal", uid = "ProdViewer", pwd = "report")
#Note, this select statement does not include press rejects.
daq <- sqlQuery(ch, "SELECT A.InspectionID, SUM(A.Rejected) AS Sum_Rejects
                FROM uss_QualityInspection_vw AS A
                WHERE A.InspectionDate > '2015-11-01'
                AND A.StationID = 10
                GROUP BY A.InspectionID;
                ")