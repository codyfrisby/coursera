## load library RODBC
library(RODBC)
## establish connection to database
ch <- odbcConnect("Portal", uid = "ProdViewer", pwd = "report")
dat <- sqlQuery(ch, "SELECT
                            * FROM uss_LeachedParts_vw WHERE PartDescr LIKE '%HC-32%' 
                            AND FinishClockOut > '2015-09-01'")
close(ch)
#import inspection # vector that was obtained from Qlikview
insp <- read.csv("inspvector.csv")
#create a vector of inspectionID from dat
x <- dat$inspectionID
y <- insp$inspectionID
#subset my data obtained from the SQL qwery
dat <- subset(dat, x %in% y)