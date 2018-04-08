#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from math import gcd # use math module function

class Fraction:
    """
    Following along interactivepython.org problem solving with algorithms
    and data structures
    Create a Fraction class and get our appetite wet for OOP.
    
    """
    
    def __init__(self, top, bottom):

        self.num = top
        self.den = bottom
    
    def show(self):
        """ 
        show the fraction representation of the object
        """
        print(self.num, "/", self.den)
        
    def __str__(self):
        """
        We want to be able to "print" our object.
        """
        return str(self.num)+"/"+str(self.den)
    
    def __repr__(self):
        """
        For returning object in interactive mode
        """
        return str(self.num)+"/"+str(self.den)
        

    def __add__(self, otherfraction):
        """
        add objects of class Fraction.
        """
        newnum = self.num * otherfraction.den + self.den * otherfraction.num
        newden = self.den * otherfraction.den
        common = gcd(newnum, newden)
        return Fraction(newnum // common , newden // common)
    
    
    def __eq__(self, other):
        """
        equality method ovverride
        """
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        
        return firstnum == secondnum
    
    def __mul__(self, otherfraction):
        """
        implement the multiply method on the Fraction class
        """
        newnum = self.num * otherfraction.num
        newden = self.den * otherfraction.den
        common = gcd(newnum, newden)
        
        return Fraction(newnum // common, newden // common)
    
    def __lt__(self, other):
        """
        Implement the less than comparision for class Fraction
        """
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        
        return firstnum < secondnum
    
    def __le__(self, other):
        """
        Implement less than or equal to method on the Fraction class
        """
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        
        return firstnum <= secondnum
    
    def __truediv__(self, other):
        """
        implement division for class Fraction
        """
        newnum = self.num * other.den
        newden = self.den * other.num
        #common = gcd(newnum, newden)
        
        return Fraction(newnum, newden)
        
    def __sub__(self, otherfraction):
        """
        Implement "-" for the Fraction class.
        """
        newnum = self.num * otherfraction.den - self.den * otherfraction.num
        newden = self.den * otherfraction.den
        common = gcd(newnum, newden)
        
        return Fraction(newnum // common, newden // common)


"""
# tests
f1 = Fraction(1, 2)
f2 = Fraction(2, 3)
print(f1 + f2)
print(f1 == f2)
print(f1 * f2)
print(f2 < f1)
print(f2 <= f1)
print(f2 / f1)
print(f2 - f1)
"""