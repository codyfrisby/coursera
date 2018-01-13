#Let's bootstrap for the mean and standard deviation.
#and construct confidence intervals.
#get the data you want to bootstrap into a vector.  Call it x for ease.
#x <- #column of interest from your dataframe
n <- length(x)
B <- 10000 #let's get 10000 resamples :).
bootx <- matrix(sample(x, n * B, replace = TRUE), B, n)
#above we have filled a matrix with 10000 rows of n samples
#of our original data.
bootmean <- apply(bootx, 1, mean) 
#here we just calculate the mean of each row.
bootsd <- apply(bootx, 1, sd) 
#here we just calculate the sd of each row.
rm(bootx)#this is a large object.  Get it out of memory.
mean(bootmean)
quantile(bootmean, c(0.025, 0.975))
mean(bootsd)
quantile(bootsd, c(0.025, 0.975))
# now let's plot our bootstrapped data.
par(mfrow=c(1,2), mar=c(5,4,2,1))
hist(bootmean, col = "green")
hist(bootsd, col = "green")
