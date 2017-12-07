

## Lambda Calculus/Recursion in R
fact <- function(x) {
  if(x <= 0) {
    return(1)
  } else {
    return(x * fact(x-1))
  }
}

factstep <- function(h) { # factorial function
  function(x) {
    if(x <= 0) {
      return(1)
    } else {
      return(x * h(x-1))
    }
  }
}

## Only works for n <= 3
f4 <- factstep(factstep(factstep(factstep(factstep()))))
f4(4)

## what about this?
fix <- function(f) { f(fix(f)) }

fact1 <- fix(factstep)

# mind is blown right about now
fact1(5)
fact1(170)

(factstep(fact1))(3) # WTF is happening????

fact1(10)

f <- function(n) {
  #x <- rev(1:n)
  prod(n:1)
}

system.time(fact(150))
system.time(f(150))
system.time(factorial(150))

## Recursive Fibonocci
fib <- function(x) {
  if (x <= 2) {
    return(1)
  } else {
    return(fib(x - 1) + fib(x - 2))
  }
}
# apply to a vector (function isn't vectorized ... 
# ... not sure how to do this yet with recursive functions).
sapply(1:10, fib)


