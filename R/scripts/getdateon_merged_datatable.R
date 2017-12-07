




#order daq by date and inspection #.
dat2 <- daq1[order(daq1$InspectionDate, daq1$inspectionID, decreasing = TRUE), ]
dat2 <- dat2[!duplicated(dat2$inspectionID), ] #remove rows with duplicate insp no.
dat2 <- dat2[, c(7,10), with = FALSE] #keeps two columns
#merge
daq55 <- merge(daq4, dat2, by = "inspectionID", all.x = TRUE)
