#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
Adapted from scripts by Marcin Nagy (@marcinag, 2012)
'''

import os
import sys
import time
import signal

def signal_handler(signal, frame):
  print 'shutting down Dummynet...'
  os.system("ipfw -f flush")
  sys.exit(0)


def main(argv):
  os.system("ipfw -f flush")
  pipe_num = "2"
  add_pipe = "ipfw add pipe "+pipe_num+" ip from 127.0.0.1 to 127.0.0.1 in" #in/out
  os.system(add_pipe)
  delay = sys.argv[2]
  plr = sys.argv[3]

  f = open(sys.argv[1])
  
  log_dir = "./logs/"
  try:
    os.makedirs(log_dir)
  except OSError:
    print "Directory " + log_dir + " already exists"

  g = open(log_dir+"dnet-vcap.txt","w")
  for line in f:
    data = line.split(' ')
    data[1] = data[1][:-1]
    bw = data[0]
    print data
    timeout = float(data[1])
    command = "ipfw pipe "+pipe_num+" config bw " + bw + " delay " + delay + "ms queue 10 " + "plr "+plr
    print 'Dummynet command: ' + command + "\n"
    log = str(time.time()) + "\t" + str(bw) + "\n"
    g.write(log)
    os.system(command)
    time.sleep(timeout)  
  
  # print "simulation finished"
  # os.system("ipfw -f flush")
  f.close
  g.close
  
  
if __name__ == "__main__":
  signal.signal(signal.SIGINT, signal_handler)
  main(sys.argv[1:])