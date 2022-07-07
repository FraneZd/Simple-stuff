
import requests
import json
from xml.etree import ElementTree
import xmltodict
from xml.dom import minidom
import datetime

error = 0
errorlog="Error collecting data from the Cloud. Check network settings.!!"
noerrorlog="No issues found. In case of issues please ask SPD to assist you!!"

while error!=200:

    try:
        test = requests.get(
        "Location of the site where date is taken", 
        auth=('username', 'password!')

  
    )
    



        sajt=xmltodict.parse(test.text)
        json=json.dumps(sajt)

        file=open("C:\\install\\CC\\python.txt","w")
        file.write(json)
        file.close
        error=test.status_code
        log=noerrorlog
        vrijeme=str(datetime.datetime.now())
           
        file=open("C:\\install\\CC\\log.txt","a")
        file.write(''+ vrijeme + '->'+ log +'\n')
        file.close

    except:                  
                           
             log=errorlog  
             vrijeme=str(datetime.datetime.now())
             file=open("C:\\install\\CC\\log.txt","a")
             file.write(''+vrijeme+"->"+log+"\n")
             file.close


    

    
     
    

          