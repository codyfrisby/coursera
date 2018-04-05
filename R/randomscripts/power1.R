## a function for a power series that outputs a vector of length
##...n and graphs it.
power <- function(n = 1, p = 2){
        y <- vector()
        sum <- 0
        for (i in 1:n) {
                sum <- (sum + (1/i^p))
                y <- append(y, sum)
        }
        #print(y)
        plot(y)
}