#!/usr/bin/env python3

class Stack(object):
    def __init__(self):
        self.items = []

    def isEmpty(self):
        return self.items == []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        return self.items.pop()

    def peek(self):
        return self.items[len(self.items)-1]

    def size(self):
        return len(self.items)


##### examples below that use the Stack object ############
# helper funciton for parChecker
def matches(op, cl):
    opens = "([{"
    closers = ")[}"
    return opens.index(op) == closers.index(cl)

# parantheses checker
def parChecker(symbolString):
    s = Stack()
    balanced = True
    index = 0
    while index < len(symbolString) and balanced:
        symbol = symbolString[index]
        if symbol == "(":
            s.push(symbol)
        else:
            if s.isEmpty():
                balanced = False
            else:
                top = s.pop()
                if not matches(top, symbol): # add helper function
                    balanced = False
                
        index += 1
    if balanced and s.isEmpty():
        return True
    else:
        return False
    
"""
# tests
print(parChecker('((()))'))
print(parChecker('(()'))

# after adding helper function
print(parChecker('{{([][])}()}'))
print(parChecker('[{()]'))
print(parChecker('()'))
"""

# decimal to binary conversion using a Stack() data structure
def divideBy2(decNumber):
    remstack = Stack()
    
    while decNumber > 0:
        rem = decNumber % 2
        remstack.push(rem)
        decNumber = decNumber // 2
        
    binString = ""
    while not remstack.isEmpty():
        binString = binString + str(remstack.pop())
        
    return binString

"""
# test it
print(divideBy2(42))
"""
# a more generalized version, base is an additional arg
def baseConverter(decNumber, base):
    digits = "0123456789ABCDEF" # 16 digits needed
    
    remstack = Stack()
    
    while decNumber > 0:
        rem = decNumber % base
        remstack.push(rem)
        decNumber = decNumber // base
        
    newString = ""
    while not remstack.isEmpty():
        newString = newString + digits[remstack.pop()]
        
    return newString

"""
# test it
print(baseConverter(42, 2))
print(baseConverter(42, 16))
"""
