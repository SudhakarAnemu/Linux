#JS - It restarts the broker. 

# /WebSphere/scripts/middleware/BRKRestart.sh


#!/bin/bash
brk=$1
free -m
echo -e "\n------------------------------------------------ Broker $brk is going to restart - $(date +%Y-%m-%d_%H-%M-%S)"
echo -e "\n------------------------------------------------Processes of the broker : - $(date +%Y-%m-%d_%H-%M-%S)"
ps -ef | grep $brk | grep bip
echo -e "\n------------------------------------------------Processes of the Execution groups : - $(date +%Y-%m-%d_%H-%M-%S)"
ps -ef | grep $brk | grep -i dataflow | sort -n
echo -e "\n------------------------------------------------Number of Execution groups : - $(date +%Y-%m-%d_%H-%M-%S)"
ps -ef | grep $brk | grep -i dataflow | sort -n | wc -l
echo -e "\n------------------------------------------------Stopping the Broker $brk : - $(date +%Y-%m-%d_%H-%M-%S)"
perl /WebSphere/scripts/middleware/wmbRestart.pl $brk stop
sleep 10
echo -e "\n------------------------------------------------Processes of the broker After stopping : - $(date +%Y-%m-%d_%H-%M-%S)"
ps -ef | grep $brk | grep bip
perl /WebSphere/scripts/middleware/wmbRestart.pl $brk start
sleep 10
echo -e "\n------------------------------------------------Processes of the broker After starting : - $(date +%Y-%m-%d_%H-%M-%S)"
ps -ef | grep $brk | grep bip
echo -e "\n------------------------------------------------Processes of the Execution groups : - $(date +%Y-%m-%d_%H-%M-%S)"
ps -ef | grep $brk | grep -i dataflow | sort -n
echo -e "\n------------------------------------------------Number of Execution groups : - $(date +%Y-%m-%d_%H-%M-%S)"
ps -ef | grep $brk | grep -i dataflow | sort -n | wc -l
free -m

echo -e "-------------------Completed-------------------"

-----------> Restart for given arry : 


/WebSphere/scripts/middleware/BRKRestartLoop.sh



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