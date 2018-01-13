# Code for Statistical Inference Course Project

x <- rbinom(1000,1,0.53)
y <- NULL
for (i in 1 : 1000) y <- c(y, mean(rbinom(20, 1, 0.53)))
mean(x)
mean(y)

#To see both plots side by side.
par(mfrow=c(1,2), mar=c(5,4,2,1))
hist(x, col = "green")
hist(y, col="green")
