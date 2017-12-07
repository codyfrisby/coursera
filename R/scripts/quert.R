        #function for a SQL query using R.  Arguments to pass to function:
        # valid SQL query.  And an object for a where statement.
        # If the SQL arguments do not have a WHERE statement the function should
        # by pass the second of the arguments...? I don't know how I would do this yet.
quert <- function(y){
        if (is.character(y) == TRUE){
                y <- paste("'", y , "'", sep = "")
        
        }
        if (is.factor(y) == TRUE){
                y <- paste("'", y , "'", sep = "")
        }
        library(RODBC)
        ch <- odbcConnect("Portal", uid = "ProdViewer", pwd = "report")
        ## get data from Experimental Record table
        #ER <- sqlFetch(ch, "rdExperimentalRecord")
        datq <<- sqlQuery(ch, paste("SELECT PartNum, PartDescr, AcidTime
                                   FROM dbo.uss_LeachedFinishParts_vw
                                   INNER JOIN LeachAcidType AS B
                                   ON AcidTypeID=B.LeachAcidTypeID
                                   WHERE PartNum IN (", paste(y, collapse = ","),")"))
        
        
}
