# I need to add script that first checks if RODBC is installed
# on the users machine.  If it's not installed it then should
# be installed on the users machine.

## load library RODBC
library(RODBC)
## establish connection to database
ch <- odbcConnect("Portal", uid = "ProdViewer", pwd = "report")
## get data from Experimental Record table
#ER <- sqlFetch(ch, "rdExperimentalRecord")
databasequery <- sqlQuery(ch, "")
close(ch) ##close connection to Portal.
