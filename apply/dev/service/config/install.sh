#!/bin/bash 

sudo -s 
apt install nginx 
RESULT=`hostname`
echo ${RESULT} > /usr/share/nginx/html/index.html
systemctl restart nginx 