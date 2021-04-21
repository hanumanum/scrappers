# -*- coding: utf-8 -*-
# python

import os
import codecs

rootdir = u"/home/hanuman/Scripts/SmartBararan/downloaded indexes/"
dictionaryFile="/home/hanuman/Scripts/SmartBararan/dictionary"
count=0
dictf = codecs.open(dictionaryFile,'w',"utf-8")
for subdir, dirs, files in os.walk(rootdir):
	for file in files:
		filepath = os.path.join(subdir, file)
		ins = codecs.open(filepath,'r',"utf-8")
 
		for line in ins:
			#indexstart=line.find(unicode('class="left word-row"><a href="/'))
			#indexend=line.find(unicode('" title="'))
			indexstart=line.find(unicode(' rel="">'))
			indexend=line.find(unicode('</a></div>'))
			if indexstart>-1:
				currWord=line[indexstart+8:indexend];
				dictf.write(currWord+"\n")
				print(currWord)
				count=count+1
		ins.close()
dictf.close()
print(count)