#To see both plots side by side.
par(mfrow=c(1,2), mar=c(5,4,2,1))
hist(rexp(1000), col = "green")
#Simulation of random uniform data.
mns <- NULL
for (i in 1 : 1000) mns <- c(mns, mean(rexp(40)))
hist(mns, col="green")

