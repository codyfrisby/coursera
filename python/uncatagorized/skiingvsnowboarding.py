# -*- coding: utf-8 -*-
"""
Created on Tue Apr 07 07:40:54 2015

@author: cfrisby
"""

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0,2,1000)

plt.figure()
plt.plot(x, np.sqrt(x), label = r"Skiing: $\sqrt{x}$")
plt.plot(x, x**2, label = r"Snowboarding: $x^2$")
plt.title("Learning Curves for Snowboarding and Skiing")
plt.xlabel("Time") ; plt.ylabel("Skill")
plt.legend(loc='upper left')
plt.show()