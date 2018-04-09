#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr  8 19:24:06 2018

@author: codyfrisby

Following along with interactivepython.org's 
Problem Solving with Algorithms and Data Structures

"""

import time
# %%
def sumofN(n):
    """
    This algorithm's compute time grows linearly with n, O(n)
    """
    start = time.time()
    
    theSum = 0
    for i in range(1, n+1):
        theSum += i
    end = time.time()
    return theSum, end-start

#%%
# test with 5 repetitions
for i in range(5):
    print("Sum %d required %10.7f seconds" %sumofN(1000000))

#%%    
# another one that is O(1)
def sumofN2(n):
    """
    This algorithm's compute time is constant.  O(1)
    """
    start = time.time()
    theSum = (n) * (n + 1)/2
    end = time.time()
    return theSum, end - start

#%%
# test with 5 reps
for i in range(5): # 5 repetitions
    print("Sum %d required %10.7f seconds" %sumofN2(1000000))

#%%
## find the minimum number in a list
# this algo is O(n^2)
def findMin(alist):
    
    overallmin = alist[0]
    
    for i in alist:
        issmallest = True
        for j in alist:
            if i > j:
                issmallest = False
        if issmallest:
            overallmin = i
    return overallmin

#findMin([5, 6, 2, 1, 3, 6, 7])

#%%
# test the above algo with large, rangom lists
from random import randrange
for listSize in range(1000, 10001, 1000):
    alist = [randrange(100000) for x in range(listSize)]
    start = time.time()
    print(findMin(alist))
    end = time.time()
    n = listSize
    print("size: %d time: %f" %(listSize, end-start))

#%%    
## write algo that is O(n) and finds the minimum number
def findMin2(alist):
    minsofar = alist[0]    
    for i in alist: # only one loop through the list
        if i < minsofar:
            minsofar = i   
    return minsofar

#findMin2([5, 3, 2, 1, 4, 8, 0, 1, 2, 100])

#%%
# test on some larger lists
for listSize in range(1000, 100001, 10000):
    alist = [randrange(100000) for x in range(listSize)]
    start = time.time()
    print(findMin2(alist))
    end = time.time()
    n = listSize
    print("size: %d time: %f" %(listSize, end-start))


# %%
#anagram detection

def anagramSolution1(s1, s2):
    alist = list(s2)
    
    pos1 = 0
    stillOK = True
    # outer while loop start
    while pos1 < len(s1) and stillOK:
        pos2 = 0
        found = False
        # inner while loop start
        while pos2 < len(alist) and not found:
            if s1[pos1] == alist[pos2]:
                found = True
            else:
                pos2 += 1
            # inner while loop end
            
        if found:
            alist[pos2] = None
        else:
            stillOK = False
            
        pos1 += 1
    # outer while loop end
    return stillOK
# %%
# test it
print(anagramSolution1('heart', 'earth'))
