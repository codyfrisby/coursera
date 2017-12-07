#x is phase 1
#y is phase 2
n <- 24
B <- 10
bootx <- matrix(sample(x, n * B, replace = TRUE), B, n)
booty <- matrix(sample(y, n * B, replace = TRUE), B, n)
bootxmean <- apply(bootx, 1, mean) 
bootymean <- apply(booty, 1, mean)
bootxsd <- apply(bootx, 1, sd)
bootysd <- apply(booty, 1, sd)
#here we just calculate the sd of each row.
rm(bootx)
rm(booty)
mean(bootxmean)
mean(bootymean)
quantile(bootxmean, c(0.025, 0.975))
mean(bootxsd)
quantile(bootxsd, c(0.025, 0.975))
quantile(bootymean, c(0.025, 0.975))
mean(bootysd)
quantile(bootysd, c(0.025, 0.975))

par(mfrow=c(1,2), mar=c(5,4,2,1))
hist(bootxmean, freq = FALSE, col = "green")
hist(bootymean, freq = FALSE, col="green")
