yield <- function(n,p){
        
        s <- matrix(sample(rbinom(100, 1, p), 1000*n, replace = T),1000, n)
        x <<- apply(s, 1, mean)
        p <<- p
        quantile(x, c(0.025, 0.975))
}

hist(x, col = "green", main = paste("Population yield", p*100, "%", sep = " ")
     , xlab = "yield")
abline(v=mean(x), col = "magenta", lwd = 3)
#text(x = quantile(x,0.25), labels = paste0("Mean =" , mean(x), sep = " "))
mean(x)
summary(x)

