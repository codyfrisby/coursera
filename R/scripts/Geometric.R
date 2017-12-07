# write a function for a geometric series
g <- function(n=1){
        sum <- 0
        for (i in 1:n){
                sum <- sum + (1/2^i)
                print(sum)
        }
}