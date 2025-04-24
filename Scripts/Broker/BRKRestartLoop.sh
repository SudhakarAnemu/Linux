
#/WebSphere/scripts/middleware/BRKRestartLoop.sh


#!/bin/bash
my_array=("WMBPRAC26" "IIBPRAC26" "WMBPRAC23" "IIBPRAC30" "WMBPRAC21" "IIBPRAC21" "IIBPRBC34" "IIBPRAC23")

#WMBPRAA21 IIBPRAA21 IIBPRAA26 WMBPRAA26 IIBPRAA30

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