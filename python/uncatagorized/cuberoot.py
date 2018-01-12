# -*- coding: utf-8 -*-
"""
Created on Wed Apr 08 06:09:38 2015

@author: cfrisby
"""

#==============================================================================
# x = 3 #create variable "x" and assign it a value
# x = x*x #square variable "x"
# print x #display result
# y = float(raw_input('Enter an integer: '))
#==============================================================================
#print y

#x = int(raw_input('Enter an integer: '))
#if x%2 == 0: #% is pronounced "Mod"
#      print 'Even'
#else:
#        print 'Odd'
#        if x%3 != 0:
#            print 'And not divisible by 3'

#Find the cube root of a perfect cube
x = int(raw_input('Enter an integer: '))
ans = 0
while ans*ans*ans < abs(x):
    ans = ans + 1
    print 'current guess =', ans
print 'last guess = ', ans
print 'ans*ans*ans = ' , ans*ans*ans

if ans*ans*ans == abs(x):
    if x < 0:
        ans = -ans
    print 'Cube root of ' + str(x) + ' is ' + str(ans)
else:
    print x, 'is not a perfect cube'    
