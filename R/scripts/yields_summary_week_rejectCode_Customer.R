library(dplyr)
weeksummary <- daq %>%
        filter(!is.na(Rejected)) %>%
        group_by(RejectCodeName, CustomerNumber, Week) %>%
        summarise_each(funs(sum), Rejected)

weeksummary1 <- merge(weeksummary, cust, by = "CustomerNumber", all.x = TRUE)
weeksummary <- weeksummary1[, .(RejectCodeName, Week, Rejected, Customer)]
rm(weeksummary1)