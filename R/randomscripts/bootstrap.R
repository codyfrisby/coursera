library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)
B <- 10000
resamples <- matrix(sample(x, n * B, replace = TRUE), B, n)
resampledMedians <- apply(resamples, 1, median)

hist(resampledMedians, col="green")

sd(resampledMedians)
quantile(resampledMedians, c(0.025, 0.975))

g = ggplot(data.frame(resampledMedians = resampledMedians), aes(x = resampledMedians))
g = g + geom_histogram(color="black", fill="lightblue", binwidth=0.05)
g