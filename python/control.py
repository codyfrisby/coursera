#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr  8 08:57:18 2018

@author: codyfrisby
"""
import math as m
n = input("enter a number: ")
n = int(n)

if n < 0:
    print("Sorry, your number is negative... I can't do complex math :(")
else:
    print(m.sqrt(n))

## list comprehension
sqlist = [x*x for x in range(1, 11) if x%2 != 0]
print(sqlist)

print([ch.upper() for ch in 'comprehension' if ch not in 'aeiou'])


# the two below statements produce the same output
wordlist = ['puke','pee','rabbit']
letterlist = [ ]
for aword in wordlist:
    for aletter in aword:
        letterlist.append(aletter)
print(letterlist)

# list comprehension method:
print([ch for ch in ''.join(wordlist)]) # pretty slick, python


## exception handling
anumber = input("enter a number: ")
anumber = int(anumber)

try:
    print(m.sqrt(anumber))
except:
    print("Bad Value for square root")
    print("Using absolute value instead")
    print(m.sqrt(abs(anumber)))
    
# use raise
a = input("enter a number: ")
a = int(a)
if a < 0:
    raise RuntimeError("You can't use a negative number")
else:
    print(m.sqrt(a))
