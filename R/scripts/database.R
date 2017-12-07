# I need to add script that first checks if RODBC is installed
# on the users machine.  If it's not installed it then should
# be installed on the users machine.
#get the data from a csv file which you have saved in this directory.
x <- read.csv("buildplan.csv")
y <- paste("'", x$Part.Nbr, "'", sep = "")

## load library RODBC
library(RODBC)
## establish connection to database
ch <- odbcConnect("Portal", uid = "ProdViewer", pwd = "report")
## get data from Experimental Record table
#ER <- sqlFetch(ch, "rdExperimentalRecord")
datq <- sqlQuery(ch, paste("SELECT PartNum, PartDescr, AcidTime
                           FROM dbo.uss_LeachedFinishParts_vw
                           INNER JOIN LeachAcidType AS B
                           ON AcidTypeID=B.LeachAcidTypeID
                           WHERE PartNum IN (", paste(y, collapse = ","),")"))
close(ch) ##close connection to Portal.
rm(ch)