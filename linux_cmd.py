#!/usr/bin/python3

import cgi
import subprocess
print("content-type: text/html")
print()

mydata=cgi.FieldStorage()
value=mydata.getvalue("x")
print(subprocess.getoutput("sudo "+ value))
