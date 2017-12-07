#! usr/bin/env python3

from ggplot import *
import os
os.environ['TF_CPP_MIN_LOG_LEVEL']='2'
#print(diamonds.head())
p = ggplot(aes(x='carat', y='price', color='cut'), data = diamonds) + geom_point() + theme_bw()
print(p)

print(ggplot(aes(x='carat', y='price', color='color'), data = diamonds) + geom_point() + theme_bw())