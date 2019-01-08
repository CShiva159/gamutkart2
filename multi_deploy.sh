#!/bin/bash

if [ $ENVIRONMENT = "QA" ];then
	for i in `cat IPs.txt`
	do
#
	echo "Deploying war file into $i QA server.."
	sleep 3
	sshpass -p "shiva" scp target/gamutkart.war shiva@$i:/home/gamut/Distros/apache-tomcat-8.5.23/webapps
#
	echo "Starting tomcat server in $i QA server.."
	sshpass -p "shiva" ssh shiva@$i "JAVA_HOME=/home/shiva/Distros/jdk1.8.0_151" "/home/shiva/Distros/apache-tomcat-8.5.23/bin/startup.sh"
#
	done
	echo "Deployment is succussful!"
fi
