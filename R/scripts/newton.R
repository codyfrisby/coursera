newton <- function(f, tol=1E-12,x0=1,N=20) {
        h <- 0.001
        i <- 1; x1 <- x0
        p <- numeric(N)
        while (i<=N) {
                df.dx <- (f(x0+h)-f(x0))/h
                x1 <- (x0 - (f(x0)/df.dx))
                p[i] <- x1
                i <- i + 1
                if (abs(x1-x0) < tol) break
                x0 <- x1
        }
        return(p[1:(i-1)])
}