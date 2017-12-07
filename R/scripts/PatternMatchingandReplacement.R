#Base R way:
clrs <- c("blue", "black", "brown", "beige", "berry", "bronze", "blue-green", "blueberry")
clrs
dfx <- data.frame(Velocity=sample(100, 8), Colors=clrs)
dfx
ptn <- '^be.*?'
ndx <- grep(ptn, dfx$Colors, perl=T)
selected_rows <- dfx[ndx,]
selected_rows

#data.table way:
library(data.table)
DT <- data.table(Name=c("Mary","George","Martha", "Mary-Jane", 
                        "Ben", "HiMaryio"), Salary=c(2,3,4,4,1,7))
## Subset the DT table where the Name column is like "Mar%":
DT[Name %like% "^Mar"]

