# pracma
Cody Frisby  
September 22, 2015  

Working in my text book for an undergraduate linear algebra course, I came across "Polynomial Interpolation".  This topic hasn't been covered in class yet and it caught my interest so I started looking at it.  Turns out you can use it to solve, say an integral that doesn't have an antiderivate. That's pretty cool.  So, turns out (why am I still surprised?) there's an R package and function within said package that will figure out the reduced row echelon form for a given nxm matrix.  Which is what's needed for this problem.  Awesome!  R continues to amaze me and all the awesome contributors.


```r
#removed lines of code that checks if a package is installed and if not attempts to
#install it.  Not sure it's working the way it's intended to.
library(pracma)

A <- matrix(data=c(1,1,1,1,1,0,(1/4),(1/2), (3/4), 
                   1, 0, 1/16, 1/4, 9/16, 1, 0, 
                   1/64, 1/8, 27/64, 1, 0, 1/256, 
                   1/16 ,81/256, 1, 0, 0.098017, 
                   .382683, .77301, 1), nrow=5)
A
```

```
##      [,1] [,2]   [,3]     [,4]       [,5]     [,6]
## [1,]    1 0.00 0.0000 0.000000 0.00000000 0.000000
## [2,]    1 0.25 0.0625 0.015625 0.00390625 0.098017
## [3,]    1 0.50 0.2500 0.125000 0.06250000 0.382683
## [4,]    1 0.75 0.5625 0.421875 0.31640625 0.773010
## [5,]    1 1.00 1.0000 1.000000 1.00000000 1.000000
```

```r
rref(A)
```

```
##      [,1] [,2] [,3] [,4] [,5]      [,6]
## [1,]    1    0    0    0    0  0.000000
## [2,]    0    1    0    0    0  0.098796
## [3,]    0    0    1    0    0  0.762356
## [4,]    0    0    0    1    0  2.144288
## [5,]    0    0    0    0    1 -2.005440
```
Our Matrix is now in Reduced Echelon Form.  I read online that there is/was? a bug in this function.  I'll have to look into that further.  For the above matrix it solved it perfectly.

But, we can solve this problem another way:

```r
A <- matrix(data=c(1,1,1,1,1,0,1/4,1/2, 3/4, 
                   1, 0, 1/16, 1/4, 9/16, 1, 0, 
                   1/64, 1/8, 27/64, 1, 0, 1/256, 
                   1/16 ,81/256, 1), nrow=5)
b <- c(0,.098017,.382683,.77301,1)

solve(A,b)
```

```
## [1]  0.000000  0.098796  0.762356  2.144288 -2.005440
```
The output above is the correct coefficients for our polynomial.  As you can see, this result is the same result from the 6th column of our reduced row echelon form matrix above
