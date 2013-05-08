#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import urllib
'''
look for a token in a PCAP file, 
- parse out the URL
- count occurance of the URL in file
'''
token='adurl%3D'

def main(argv):
    fs = open(argv[0], 'r')
    cnt_get=0
    cnt_res=0
    url = {}
    
    for line in fs:
        if(line.find('GET')!=-1):
            cnt_get+=1
            
        if(line.find('200 OK')!=-1):
            cnt_res+=1
            
        if(line.find('adurl%3D')!=-1):
            #find 'adurl'
            grep=line.split(token)
            
            #split until next '&;
            u=grep[1].split('&')[0]
            
            #print urllib.unquote(u).decode('utf8')
            #print u
            
            if u not in url:
                url[u]=1
            else:
                url[u]+=1
            
    print "count Requests/Responses", cnt_get, cnt_res
    for key in url:
        print key, url[key]
    
if __name__ == "__main__":
    main(sys.argv[1:])