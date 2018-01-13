#STAT4200 5.17
x <- c(2,4,6,6,5,8,10,14,19,13,3,7)
sx <- sqrt(x)
L <- sum(sx)/4
print(L)
sum <- 0
for (i in 1:length(sx)){
        sum <- sum + sum(sx[i])
        print(sum)
}
