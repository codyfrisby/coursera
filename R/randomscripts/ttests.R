# t.test in R
x <- rnorm(10)
y <- rnorm(10)
t <- t.test(x,y)
t$statistic
# to get a large # of t statistics
ts <- replicate(10000, t.test(rnorm(10), rnorm(10))$statistic)
# ts is assumed to be normal and have equal variances
# in addition to having 20 - 2 degrees of freedom.
hist(ts, col = "green", freq = FALSE, xlim = c(-4, 4))
range(ts)
pts <- seq(-4.5, 4.5, length = 100)
#create a plot
plot(pts,dt(pts,df=18),col='red',type='l')
# dt is the student's t dist. 
# add our t statistic data to the plot
lines(density(ts))

#another way
# the points should be on the line.
qqplot(ts,rt(1000,df=18))
abline(0,1)

# now to get our t statistics for given values of alpha
probs <- c(0.9, 0.95, 0.99)
quantile(ts, probs)
qt(c(0.9, 0.95, 0.99), df = 18)
