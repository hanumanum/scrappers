# -*- coding: utf-8 -*-
# python

from TorCtl import TorCtl
import urllib2
import codecs
import time

user_agent = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7'
headers={'User-Agent':user_agent}
 
def request(url):
    def _set_urlproxy():
        proxy_support = urllib2.ProxyHandler({"http" : "127.0.0.1:8118"})
        opener = urllib2.build_opener(proxy_support)
        urllib2.install_opener(opener)
    _set_urlproxy()
    request=urllib2.Request(url, None, headers)
    return urllib2.urlopen(request).read()
 
def renew_connection():
    conn = TorCtl.connect(controlAddr="127.0.0.1", controlPort=9051, passphrase="mygago")
    conn.send_signal("NEWNYM")
    conn.close()
#http://bararanonline.com/words/letter/%D5%AD/page:400

ip=""
letter="ֆ"
i=14
while i<=600:

    time.sleep(5)
    curntURL="http://bararanonline.com/words/letter/"+letter+"/page:"+str(i)
    print("Current IP:"+ip)
    print(curntURL)
    currpage=request(curntURL)
    currpage=unicode(currpage,"UTF-8")
    captchaExists=currpage.find(unicode("Captcha"))
    lattersTableExists=currpage.find(unicode("letters-table"))
    
    if captchaExists>-1 or lattersTableExists>-1:
        #perform renuw connection
        print("Capcha exists")
        for j in range(1,100):
            newIP=request("http://icanhazip.com/")
            if ip==newIP:
                renew_connection()
            else:
                ip=newIP
                print("New IP")
                break
        
    else:
        endNiddle=unicode("Էջը չի գտնվել", "UTF-8")
        if currpage.find(endNiddle)>-1:
            break
        else:
            filename = letter+"_"+"page"+str(i)+".html"
            ff = codecs.open(filename, 'a',"utf-8")
            ff.write(currpage)
            ff.close()
            i=i+1            
                

    # stringg = "wget --mirror -p --convert-links --restrict-file-names=nocontrol -nc --reject jpg,png,css,js,jpeg,gif -P /home/hanuman/Scripts/SmartBararan/bararanonline1/ http://bararanonline.com/"
    # stream = os.popen(stringg) 