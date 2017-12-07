# -*- coding: utf-8 -*-

name = 'Cody C. Frisby'
age = 32
height = 69.0 #inches
weight = 173 #lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'
metric_height = height * 2.54 / 100.0 #meters

print "Let's talk about %s." % name
print "He's %d inches tall." % height
print "He's %d pounds heavy." % weight
print "Actually that's not too heavy."
print "He's got %s eyes and %s hair." % (eyes, hair)
print "His teeth are usually %s depending on the coffee." % teeth

print "If I add %d, %d, and %d I get %d." % (
	age, height, weight, age + height + weight)

print metric_height, "meters"