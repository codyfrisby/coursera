
n <- 20
B <- 1000
tx <- matrix(sample(tree, n * B, replace = TRUE), B, n)

txm <- apply(tx, 1, mean)
x <- apply(tx, 1, mean)*196
txsd <- apply(tx, 1, sd)
mean(txm)
quantile(txm, c(0.025, 0.975))
mean(txsd)
quantile(txsd, c(0.025, 0.975))
#hist(txm, freq = FALSE, col = "green")
#curve(dnorm(x, mean(x), sd(x)), col = 2, add = TRUE)
hist(x, freq =  FALSE, col = "green")
curve(dnorm(x, mean(x), sd(x)), col = 2, add = TRUE, 
      from = quantile(x, 0.025), to = quantile(x, 0.975))
