

from typing import Text
import requests
import json
from xml.etree import ElementTree
import xmltodict
from xml.dom import minidom
import smtplib,ssl
from email.mime.text import MIMEText
import datetime


with open("C:\\install\\CC\\python.txt","r") as test:
    data_dict = json.load(test)
    i=0
    count=0
    hospital=[]
    

    while i<12:
        try:
            print(data_dict['feed']['entry'][i]['content']['m:properties']['d:Customer_Name'])
            print(data_dict['feed']['entry'][i]['content']['m:properties']['d:Queued_since']['@m:null'])
            print("_____________________")
            provjera=data_dict['feed']['entry'][i]['content']['m:properties']['d:Queued_since']['@m:null']
            if provjera=="true":
               count=count+1

        except:
            print("_____________________")
            hospital.append(data_dict['feed']['entry'][i]['content']['m:properties']['d:Customer_Name'])
            hospital.append(data_dict['feed']['entry'][i]['content']['m:properties']['d:Queued_since']['#text'])



          
         
         
                
        i=i+1
        

print(hospital)

sizeoflist=len(hospital)/2
x=0
y=1
temp=[]

formathospital=""
minutes=0
currenttime=datetime.datetime.now()
currentminutes=currenttime.minute
quecounter=0



while sizeoflist!=0:
    formathospital=hospital[y]
    formathospital=formathospital[11:19]
    minutes=int(formathospital[14:16])
    temp.append(hospital[x]+": "+formathospital)
    razlika=int(currentminutes-minutes)
    sizeoflist=sizeoflist-1
    x=x+2
    y=y+2
    
    

        
   

 

  



sender = 'sender mail'
receivers = ['mail adresses of people who will receive the message']

message = """From:Central catalog queue
To: Medireport support team
Subject: Items in Queue

List of items that are stucked in queue: {}

""".format(temp)
if count!=12:
    try:
       smtpObj = smtplib.SMTP('SMTP server adress',587)
       smtpObj.login(sender,"password")
       smtpObj.sendmail(sender, receivers, message)    
   
       print ("Successfully sent email")
    except SMTPException:
       print ("Error: unable to send email")
else:
    print("noError")
    quit()



