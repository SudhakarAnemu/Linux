#JS 

#mqsireportproperties IIBPRAA34 -e esb_eg4 -o HTTPSConnector -r | grep "url="

#/WebSphere/scripts/middleware/listURLEg.sh
#for i in 7 9 10
for ver in 7 9 10 12
do
      . /WebSphere/scripts/middleware/wmbprofile $ver >> /dev/null
      for brk in `mqsilist|grep BIP1284I|awk -F"'"  '{print $2}'`
      do
            for eg in `mqsilist $brk|grep BIP1286I|awk -F"'" '{print $2}'`
            do
                echo "---------------------------------------Version : $ver ---------- I am checking for $brk - $eg-------"   
                mqsireportproperties $brk -e $eg -o HTTPSConnector -r | grep "url="
            done
      done
done


# mqsireportproperties IIBPRAA34 -e esb_eg4 -o HTTPSConnector -r | grep "url="


