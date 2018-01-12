#getting my feet wet with looping functions

x = int(raw_input('Enter an integer: '))
n = 0
while 2**n < x:
	n = n + 1
	y = 2**n
	print '2^',n, "Is equal to:",y

if 2**n == x:
    print y, "Is a power of 2"
else:
    print x, "Is not a power of 2"   