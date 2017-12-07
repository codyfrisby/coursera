# Sampling with replacement
x <- c(1, 3, 5, 7)
#p <- c(0.1, 0.2, 0.3, 0.4) #Not sure how to compute this yet with weights
D <- NULL
for (i in 1 : 1000) D <- c(D, mean(sample(x, size=2, replace=TRUE)))

#plot histograms of the two distributions side by side.
par(mfrow=c(1,2), mar=c(5,4,2,1))
hist(x, col="green")
hist(D, col="green")