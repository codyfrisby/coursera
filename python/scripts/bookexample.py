# -*- coding: utf-8 -*-
"""
Created on Tue Apr 07 15:23:42 2015

@author: cfrisby
"""

import json

path = 'C:\Users\cfrisby\Downloads\pydata-book-master\pydata-book-master\ch02\usagov_bitly_data2012-03-16-1331923249.txt'
records = [json.loads(line) for line in open(path, 'rb')]
records[0]