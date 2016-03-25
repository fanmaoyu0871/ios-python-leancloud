# !/bin/env python
#encoding=utf-8

import os
import sys

#读索引文件
def getIndex():
  path = '/Users/fanmaoyu/Desktop/python/index'
  file = open(path, 'r+')
  line = file.readline();
  line.strip()
  file.close()
  return int(line)

#写索引文件
def saveIndex(index):
  path = '/Users/fanmaoyu/Desktop/python/index'
  file = open(path, 'w+')
  file.writelines(['%d'%index, '\n'])
  file.close()
