yield <- function(n=500, p=0.5, s=20) {

x <- rbinom(n,1,p)
y <- NULL
for (i in 1 : 5) y <- c(y, mean(sample(x,20)))

par(mfrow=c(1,2), mar=c(5,4,2,1))
hist(x, col = "green")
hist(y, col="green")
quantile(y, c(0.025, 0.975))
}