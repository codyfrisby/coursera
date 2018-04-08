#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr  8 10:11:40 2018

@author: codyfrisby
"""
import random

def generateOne(strlen):
    """
    Generate a string of length strlen
    
    """
    alphabet = "abcdefghijklmnopqrstuvwxyz "
    res = ""
    for i in range(strlen):
        res = res + alphabet[random.randrange(27)]
        
    return res

#print(generateOne(28))

def score(goal, teststring):
    """
    score the random string against the teststring
    
    """
    numSame = 0
    for i in range(len(goal)):
        if goal[i] == teststring[i]:
            numSame = numSame +1
 
    return numSame / len(goal)
        
#print(score('methinks it is like a weasel', generateOne(28)))

def main():
    """
    this is the main while loop for generating randome letters/spaces
    and chcking how close it is to our goalstring
    
    """
    goalstring = 'methinks it is like a weasel'
    newstring = generateOne(28)
    #best = 0
    newscore = score(goalstring, newstring)
    n = 0
    while newscore < 1:
        if newscore == 1:
            print(newstring)
        #if newscore >= best:
        if (n % 10000) == 0: ## print every millionth iteration result
            print(newstring, n, round(newscore, 3))
            #print(newscore, newstring)
            #best = newscore
        newstring = generateOne(28)
        newscore = score(goalstring, newstring)
        n += 1

main()