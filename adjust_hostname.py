#!/usr/bin/python
import json
import socket

with open('servers.json') as f:
    j = json.load(f)
j['items'][0]['hostname']=socket.gethostname()

with open('servers.json', 'w') as outfile:  
    json.dump(j, outfile)
	
with open('sgroup.json') as f:
    j = json.load(f)
j['items'][0]['regexp']= "^("+socket.gethostname()+")$"

with open('sgroup.json', 'w') as outfile:  
    json.dump(j, outfile)