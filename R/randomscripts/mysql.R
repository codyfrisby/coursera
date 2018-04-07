# select rows from mysql localhost server
library(RMySQL)
user <- "root"
password <- "root"
servername <- "localhost"
port <- 3306
dbname <- "Test"
socket <- "/Applications/MAMP/tmp/mysql/mysql.sock"

conn <- dbConnect(MySQL(), user = user, password = password, 
                  dbname = dbname, host = servername, unix.socket = socket)

sql = "SELECT * FROM testing"

# generate some data and then write to the table
x <- round(runif(4, min = 0, max = 100), 0)

sqlSend = paste0("INSERT INTO testing (var1, var2, var3, var4) 
                 VALUES (", paste(x, collapse = ","), ");")

#sqlRemove = "DELETE FROM testing WHERE var1 = 13;"

dbSendQuery(conn, sqlSend)

# did it work?
results <- dbSendQuery(conn, sql)
df <- dbFetch(results)
print(df)

# close connection
dbDisconnect(conn)