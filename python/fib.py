#! us/bin/env python3
import sys
# print(sys.argv[1])
n = int(100)
n = int(sys.argv[1])

def fib(n):
	a, b = 0, 1
	while a < n:
		print(a, end=' ')
		a, b = b, a+b
	print()
fib(n)