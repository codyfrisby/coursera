sys.sample <- function(N,n){
        k <- ceiling(N/n)
        #ceiling(x) rounds to the nearest integer that's larger than x. 
        #This means ceiling (2.1) = 3 
        r <- sample(1:k, 1)
        sys.samp <<- seq(r, r + k*(n-1), k)
        # Note: the last command "\"\n" prints the result in a new line
}
# To select a systematic sample, type the following command
# providing the values of N and n
# sys.sample(50, 5)