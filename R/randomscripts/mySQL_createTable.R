# first let's get the data ready to load
#df <- read.csv("~/Documents/solar/electricity", header = TRUE)
#names(df) <- c("month", "charges", "util", "solar")
### update this morning.  I wanted to add a year column...
# so I pulled the table from the data base into R added the correct
# years and deleted the table from R.  I think recreated the table
# adding the year column and loaded the dataframe R object into the
# newly created table.  Worked :)
# So now the above lines of code are invalid and should not be used
# so I have commented them out.

# create table
sql <- "CREATE TABLE solar (month varchar(255), charges decimal(4,2), util INT, solar decimal(8,2), year INT);"

library(RMySQL)
user <- "root"
password <- "root"
servername <- "localhost"
port <- 3306
dbname <- "Cody_DWH"
socket <- "/Applications/MAMP/tmp/mysql/mysql.sock"

conn <- dbConnect(MySQL(), user = user, password = password, 
                  dbname = dbname, host = servername, unix.socket = socket)

dbSendQuery(conn, sql)

## load the table with an R data.frame
library(DBI)
dbWriteTable(conn = conn, 
             name = "solar", 
             value = dq,
             append = TRUE,
             row.names = FALSE)

# pull data to check that it worked :)
sql2 = "SELECT * FROM solar"
results <- dbSendQuery(conn, sql2)
dq <- dbFetch(results)
dq

# close connection
dbDisconnect(conn)

#sqlDrop <- "DROP TABLE solar"
#dbSendQuery(conn, sqlDrop)
