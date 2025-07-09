
#/WebSphere/scripts/middleware/BRKRestartLoop.sh


#!/bin/bash
my_array=("WMBPRAC26" "IIBPRAC26" "WMBPRAC23" "IIBPRAC30" "WMBPRAC21" "IIBPRAC21" "IIBPRBC34" "IIBPRAC23")
echo "Iterating through the array:"
SNO=1
for item in "${my_array[@]}"; do
  echo "--------------------------------------------------------------$SNO Restarting the Broker - $item"
  /WebSphere/scripts/middleware/BRKRestart.sh $item
  ((SNO=SNO+1))
  echo -e "\n ---------------------------------------------------------------------------------------------------------------"
  echo -e "\n ***************************************************************************************************************"
  echo -e "\n ---------------------------------------------------------------------------------------------------------------"
done

------------------------------->> 

Restart all Brokers : 

#/WebSphere/scripts/middleware/BRKRestartLoopAll.sh
SNO=1
for i in 7 9 10 12
do
      version=$i
      . /WebSphere/scripts/middleware/wmbprofile $i >> /dev/null
      echo -e "i = $i, version = $version"
      for brk in `mqsilist|grep BIP1284I|awk -F"'"  '{print $2}'`
      do
         echo -e "\nS.No - $SNO - Version : $version Broker : $brk"
         /WebSphere/scripts/middleware/BRKRestart.sh $item
         ((SNO=SNO+1))
      done
done


