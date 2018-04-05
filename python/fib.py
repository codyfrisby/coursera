# How would I code the fibonocci sequence in python?
def fib(n):
    if 0 < n <= 2:
        return 1 
    elif n > 2:
        return fib(n-2) + fib(n-1)
    else:
        return 0
# How would I code factorials in python?
def fact(n):
    if n <=1:
        return 1
    else:
        return(n * fact(n-1))
# This looks just like R, minus the braces
#for ch in map(fib,[0, 1, 2, 3, 4, 5, 6, 7]):
#   print(ch)
## Python has similar functional methods as R....
# apply a function to a list/vector:
list(map(fact, range(1, 10)))
#
# another way to compute factorial in python
from functools import reduce
reduce(lambda n,m: n*m, range(1, 6))
## or, we can also do this:
import math as m
m.factorial(5)
# or from numpy
import numpy as np
np.prod(range(1, 6))


