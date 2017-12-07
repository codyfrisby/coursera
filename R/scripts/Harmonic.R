# write a function for the harmonic series
harmonic <- function(n = 1){
sum <- 0
for (i in 1:n) {
        sum <- (sum + (1/i))
print(sum)
        }

}