#js
#!/bin/bash
#/WebSphere/scripts/middleware/ace/ListOfJksForAllEgs.sh
brk=$1
echo -e "Broker name : $brk"
LOG=$brk.$(date +%Y-%m-%d_%H-%M-%S).jks

      echo "----------------------------------------------------------------Broker : $brk" >> $LOG
      echo "----------------------------------------------------------------Broker : $brk"
	  SNO=1
      mqsilist $brk|grep BIP1286I|awk -F"'" '{print $2}' > /tmp/eg.list
      while IFS= read -r eg
      do
        echo -e "SNO:$SNO--Broker:$brk--EG:$eg---------------------------------------------------------------" >> $LOG
        echo -e "Now I am checking for - SNO:$SNO--Broker:$brk--EG:$eg" 

        echo -e "Store of ComIbmJVMManager"  >> $LOG
        mqsireportproperties $brk -e $eg -o ComIbmJVMManager -r | grep store | grep .jks  >> $LOG
        echo -e "Store of HTTPSConnector"  >> $LOG
        mqsireportproperties $brk -e $eg -o HTTPSConnector -a | grep -i store  | grep .jks  >> $LOG
        echo -e "Store of HTTPConnector"  >> $LOG
        mqsireportproperties $brk -e $eg -o HTTPConnector -a | grep -i store  | grep .jks  >> $LOG

		 ((SNO=SNO+1))
      done < /tmp/eg.list
echo "----> Completed <----"

# mqsireportproperties IIBDVBA34 -e esb_zuora_api -o ComIbmJVMManager -r | grep store | grep .jks
# mqsireportproperties IIBDVBA34 -e esb_zuora_api -o HTTPSConnector -a | grep -i store  | grep .jks
# mqsireportproperties IIBDVBA34 -e esb_zuora_api -o HTTPConnector -a | grep -i store  | grep .jks