# !/bin/env python
#encoding=utf-8

import leancloud
from fileOp import *
from leancloud import Object
from leancloud import Query

def main():
	#init leancloud
	leancloud.init('IRLv1lvUGypwG5XCKF248SiG-gzGzoHsz', '2lRAArUswyFeFTtIXl2wC6b5')
	#清除表中所有纪录
	table_prjList = Object.extend('table_prjList')
	table = table_prjList()
	table.destroy()
    #重置索引
	saveIndex(1)

if __name__ == "__main__":
	main()

