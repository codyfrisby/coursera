#This is a check on the master_yield_function
if (!require(dplyr)){install.packages("dplyr")
        }
library(dplyr)

rejects <- All_Data %>%
        filter(!is.na(leachyield)) %>%
        group_by(AcidTime) %>%
        summarise_each(funs(mean), leachyield)
rejects           
s <- sum(rejects$Rejected)
totalparts <- daq %>%
        group_by(InspectionID) %>%
        summarize_each(funs(mean), TotalParts)
y <- sum(totalparts$TotalParts)
Y <- 1 - (s/y) #this is the non weighted mean for total yield.  
Y
s <- sum(All_Data$sum_Rejected, na.rm = T)
L <- sum(DTT$leachrejects, na.rm = T)

LDC1 <- LDC %>%
        group_by(InspectionDate) %>%
        summarise_each(funs(sum), Rejected)
