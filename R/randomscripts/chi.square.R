
approve <- c(15, 59)
dissaprove <- c(37, 29)
tbl <- cbind(approve, dissaprove)
row.names(tbl) <- c("males", "females")
tbl
chisq.test(tbl, correct = F)

#we can also use simulate.p.value = TRUE