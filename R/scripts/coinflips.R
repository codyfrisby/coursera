# Coin flips

x <- rbinom(10000,1,0.50)
y <- NULL
for (i in 1 : 1000) y <- c(y, mean(rbinom(20, 1, 0.50)))
mean(x)
mean(y)

#To see both plots side by side.
par(mfrow=c(1,2), mar=c(5,4,2,1))
hist(x, freq = FALSE, col = "green")
hist(y, freq = FALSE, col="green")
#add a normal curve
curve(dnorm(x, mean(x), sd(x)), col = 2, add = TRUE)
qqnorm(x, pch=16)
shapiro.test(y)