# !/bin/env python
#encoding=utf-8

import urllib2
import urllib
import os
import sys
import leancloud
from fileOp import *
from leancloud import Query
from BeautifulSoup import BeautifulSoup

#reload(sys)  
#sys.setdefaultencoding('utf-8')
#print sys.getdefaultencoding()

def parseHtml(index):

  #解析HTML
  html = urllib2.urlopen('http://www.zbj.com/ydyykf/tp%d.html'%(index)).read()
  soup = BeautifulSoup(html)
  table = soup.findAll('table', attrs={'class':'list-task'})
  if(len(table) <= 0):
    print "exit zbjSpider"
    saveIndex(0)
    sys.exit()
  tbody = table[0].findAll('tr')
  
  print "===================index=%d=================="%index
  index += 1;
  saveIndex(index)

  for tr in tbody:
    price = tr.findAll('em', attrs={'class':'list-task-reward'})[0].string
    #去除&yen;
    newPrice = price.replace('&yen;','').strip();
    title = tr.findAll('a', attrs={'class':'list-task-title'})[0].string
    introduce = tr.findAll('p', attrs={'class':'list-task-ctn'})[0].string
    print "price=%s, title=%s, introduce=%s"%(newPrice, title, introduce)
    #保存数据
    saveData(newPrice, title, introduce);

def saveData(price, title, introduce):
  #init leancloud
  leancloud.init('IRLv1lvUGypwG5XCKF248SiG-gzGzoHsz', '2lRAArUswyFeFTtIXl2wC6b5')
  #sql
  Query.do_cloud_query("insert into table_prjList(price, title, introduce) values(?, ?, ?)", price, title, introduce)
  
def main():
  if(len(sys.argv) != 2):
    print 'lenth of argv Error!'
    return
  index = sys.argv[1]
  parseHtml(int(index))

if __name__ == '__main__':
  main();
