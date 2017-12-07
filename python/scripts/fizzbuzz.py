# -*- coding: utf-8 -*-
"""
Created on Wed Apr 08 08:36:50 2015

@author: cfrisby
"""

for i in range(1,11):
    s = str(i)
    if i % 3 == 0 or i % 5 == 0:
        s = str(i) + ' '
        if i % 3 == 0:
            s = s + 'Fizz'
        if i % 5 == 0:
            s = s + 'Buzz'
    print s