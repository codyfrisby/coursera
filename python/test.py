#! usr/bin/env python3
# python
import os
os.environ['TF_CPP_MIN_LOG_LEVEL']='2'

import tensorflow as tf
hello = tf.constant("Hello, TensorFlow!")
sess = tf.Session()
print(sess.run(hello))

node1 = tf.constant(3.0, dtype=tf.float32)
node2 = tf.constant(4.0) # also tf.float32 implicitly
print(node1, node2)
