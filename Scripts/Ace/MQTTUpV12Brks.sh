 #/WebSphere/scripts/middleware/ace/MQTTUpV12Brks.sh
#!/bin/bash
#qmgr=$1

for brk in `mqsilist|grep BIP1284I|awk -F"'"  '{print $2}'`
do
    mqsichangeproperties $brk -b Events -o OperationalEvents/MQTT -n enabled -v false
    mqsichangeproperties $brk -b Events -o BusinessEvents/MQTT -n enabled -v false
    mqsichangeproperties $brk -b Events -o AdminEvents/MQTT -n enabled -v false
    mqsichangeproperties $brk -b Events -o OperationalEvents/MQ -n enabled -v false	
done





#mqsireportproperties IIBDVBA34 -b Events -r | grep -i MQTT -A 1

# for i in `mqsilist|grep running|awk -F"'" '{print $2}'`; do mqsichangeproperties $i -b Events -o OperationalEvents/MQTT -n enabled -v false; mqsichangeproperties $i -b Events -o BusinessEvents/MQTT -n enabled -v false; done
 
#mqsichangeproperties IIBDVBA34 -b Events -o OperationalEvents/MQTT -n enabled -v false
#mqsichangeproperties IIBDVBA34 -b Events -o BusinessEvents/MQTT -n enabled -v false
#mqsichangeproperties IIBDVBA34 -b Events -o AdminEvents/MQTT -n enabled -v false
#mqsichangeproperties IIBDVBA34 -b Events -o OperationalEvents/MQ -n enabled -v false
	
	