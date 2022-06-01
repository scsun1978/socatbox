#!/bin/sh

#init env for readyding installation
sudo rm -R /opt/tigertms/
sudo rm /etc/profile.d/tigerproxy_cmd.sh
sudo mkdir /opt/tigertms/

socat=$(ps -ef | grep socat)
echo $socat
read -p "Press any key to kill all socat session " -n1 -s
sudo pkill -9 socat
read -p "Press any key to confirm socat session" -n1 -s
socat=$(ps -ef | grep socat)
echo $socat

sudo apt-get install socat


#Create output file, override if already present  
output1=output_var.txt
output2=output_cmd.txt

# ifc coniguration
echo "What is your IFC IP?"
read ifcip  >> $output1
echo "What is your pmslink port? Recommand:5018"
read pmslink  >> $output1

# innline coniguration
echo "What is your innline IP?"
read innlineip  >> $output1
echo "What is your innline port? Recommand:50001"
read innline  >> $output1

# pbx coniguration
echo "What is your pbx IP?"
read pbxip  >> $output1
echo "What is your pbxlink port? Recommand:15374"
read pbxlink  >> $output1

# pbxcdr coniguration
echo "What is your pbxcdr1 IP?"
read pbxcdrip1  >>$output1
echo "What is your pbxcdr2 IP?"
read pbxcdrip2  >>$output1
echo "What is your pbxcdr3 IP?"
read pbxcdrip3  >>$output1
echo "What is your pbxcdr4 IP?"
read pbxcdrip4  >>$output1
echo "What is your pbxcdr5 IP?"
read pbxcdrip5  >>$output1
echo "What is your pbxcdr port? Recommand:1752"
read pbxcdr  >>$output1

# proxyserver coniguration
echo "What is your proxyserver IP?"
read proxyip  >>$output1
echo "What is your proxyserver pbxlink port?"
read proxypbxlink  >>$output1
echo "What is your proxyserver pbxcdr1 port?"
read proxycdr1  >>$output1
echo "What is your proxyserver pbxcdr2 port?"
read proxycdr2  >>$output1
echo "What is your proxyserver pbxcdr3 port?"
read proxycdr3  >>$output1
echo "What is your proxyserver pbxcdr4 port?"
read proxycdr4  >>$output1
echo "What is your proxyserver pbxcdr5 port?"
read proxycdr5  >>$output1
echo "What is your proxyserver innline port?"
read proxyinnline  >>$output1
echo "What is your proxyserver pmslink port?"
read proxypmslink  >>$output1

echo "#!/bin/sh" >>$output2

#PBXLINK
if [[ -n "$pbxip" ]] && [[ -n "$pbxlink" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxypbxlink" ]]
	then
		echo "nohup socat TCP4:$pbxip:$pbxlink,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxypbxlink,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat15374.log 2>&1 &" >>$output2
fi
#PBXCDR
if [[ -n "$pbxcdrip1" ]] && [[ -n "$pbxcdr" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxycdr1" ]]
	then
		echo "nohup socat TCP4:$pbxcdrip1:$pbxcdr,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxycdr1,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat17521.log 2>&1 &" >>$output2
fi
if [[ -n "$pbxcdrip2" ]] && [[ -n "$pbxcdr" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxycdr2" ]]
	then
		echo "nohup socat TCP4:$pbxcdrip2:$pbxcdr,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxycdr2,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat17522.log 2>&1 &" >>$output2
fi
if [[ -n "$pbxcdrip3" ]] && [[ -n "$pbxcdr" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxycdr3" ]]
	then
		echo "nohup socat TCP4:$pbxcdrip3:$pbxcdr,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxycdr3,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat17523.log 2>&1 &" >>$output2
fi
if [[ -n "$pbxcdrip4" ]] && [[ -n "$pbxcdr" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxycdr4" ]]
	then
		echo "nohup socat TCP4:$pbxcdrip4:$pbxcdr,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxycdr4,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat17524.log 2>&1 &" >>$output2
fi
if [[ -n "$pbxcdrip5" ]] && [[ -n "$pbxcdr" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxycdr5" ]]
	then
		echo "nohup socat TCP4:$pbxcdrip5:$pbxcdr,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxycdr5,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat17525.log 2>&1 &" >>$output2
fi
#INNLINE
if [[ -n "$innlineip" ]] && [[ -n "$innline" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxyinnline" ]]
	then
		echo "nohup socat TCP4:$innlineip:$innline,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxyinnline,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat50001.log 2>&1 &" >>$output2
fi
#PMSLINK
if [[ -n "$ifcip" ]] && [[ -n "$pmslink" ]] && [[ -n "$proxyip" ]] && [[ -n "$proxypmslink" ]]
	then
		echo "nohup socat TCP4:$ifcip:$pmslink,forever,interval=15,reuseaddr,fork OPENSSL:$proxyip:$proxypmslink,cafile=dummycert.pem,verify=0 >> /opt/tigertms/socat5010.log 2>&1 &" >>$output2
fi

read -p "Press any key to wait reading configuration file... " -n1 -s
echo -e "configuration file is ready in $output2"
sudo cat $output2
read -p "Press any key to confirm configuration... " -n1 -s

sudo cp output_cmd.txt /opt/tigertms/tigerproxy_cmd.sh
sudo cp output_cmd.txt /etc/profile.d/tigerproxy_cmd.sh
sudo cp tigerpmslink.service /opt/tigertms/tigerpmslink.service
sudo chmod 777 /opt/tigertms/*.*
sudo chmod 777 /etc/profile.d/tigerproxy_cmd.sh

read -p "Press any key to run... " -n1 -s
sudo bash /opt/tigertms/tigerproxy_cmd.sh

#read -p "Press any key to write boot service... " -n1 -s
#sudo systemctl start /opt/tigertms/tigerpmslink.service
#sudo systemctl enable /opt/tigertms/tigerpmslink.service

#read -p "Press any key to show service status... " -n1 -s
#sudo systemctl status tigerpmslink.service
#sudo journalctl -u tigerpmslink.service
