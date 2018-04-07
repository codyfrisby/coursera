# first let's get the data ready to load
df <- read.csv("~/Documents/solar/electricity", header = TRUE)

n <- dim(df)[1]

names(df) <- c("month", "charges", "util", "solar")
#paste(df[i, ], collapse = ",")

# create table
sql <- "CREATE TABLE solar (month varchar(255), charges decimal(3,2), util INT, solar decimal(3,2));"

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
             value = df,
             append = TRUE,
             row.names = FALSE)

# pull data to check that it worked :)
sql2 = "SELECT * FROM solar"
results <- dbSendQuery(conn, sql2)
df <- dbFetch(results)
df

# close connection
dbDisconnect(conn)

#sqlDrop <- "DROP TABLE solar"
#dbSendQuery(conn, sqlDrop)
