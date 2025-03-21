#/WebSphere/scripts/middleware/checkPortProcess1Brk.sh
brk=$1
rm -f /tmp/1Brkport_output.txt
for eg in `mqsilist $brk|grep BIP1286I|awk -F"'" '{print $2}'`
do
    port=`mqsireportproperties $brk -e  $eg  -o HTTPSConnector -n explicitlySetPortNumber|grep -v BIP8071I|tr -d '\n'`
    if [[ ! -z $port ]]; then
        echo  "$brk - $eg - $port " >> /tmp/1Brkport_output.txt
    fi
done
echo -e "--------Port numbers of the Broker : $brk"
cat -n /tmp/1Brkport_output.txt
echo -e "---------------------------------------------------------------------------------------------------------------------"
input="/tmp/1Brkport_output.txt"
ENO=0
cat $input|awk -F"-" '{print $1,$2,$3}'|while read broker eg port
do
   ((ENO=ENO+1))
   echo -e "$ENO ---- Checking for the Port - $port"
   if [[ $port  -ne '' || $port -ne 0 ]]; then
      listeningPID=`netstat -anp 2>/dev/null |grep $port|grep 'LISTEN'|awk '{ print $NF}'|awk -F"/" '{print $1}'`
      liseningProcess=`ps -ef|grep $listeningPID|grep DataFlowEngine |awk '{print $NF}'`
      if [[ $liseningProcess -ne $eg ]]; then
         echo -e "$ENO----- need to kill process $broker $eg $port -----"
      else
         echo -e "$ENO----- Correct process listening $broker $eg $port"
      fi
   fi
done