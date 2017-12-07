# I need to add script that first checks if RODBC is installed
# on the users machine.  If it's not installed it then should
# be installed on the users machine.

#to bring the documentation up
RshowDoc("RODBC", package = "RODBC")
## load library RODBC
library(RODBC)

## establish connection to database
ch <- odbcConnect("Portal", uid = "ProdViewer", pwd = "report")

#functions for RODBC
sqlTables(ch) #to see a list of the tables available on ch.
sqlFetch(ch, "table_name", max = "number of rows desired")
sqlColumns(ch, "table_name") #to see the column names of a table on ch.
sqlQuery(ch, paste("valid SQL statement"))


odbcClose(ch) ##close connection to Portal.