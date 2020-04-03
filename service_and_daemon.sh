#!/bin/bash
###################################################################################
## Nginx-LDAP						   		 	 ##
## Script bash for analyze the daemon ldap and the service of nginx		 ##
## Author: https://github.com/Iakim 				    		 ##
## Simplicity is the ultimate degree of sophistication		    		 ##
###################################################################################

ngx=`systemctl status nginx | grep running | wc -l`
dae=`ps aux | grep ldap-auth | wc -l`

if [ $ngx -gt 0 ]
then
	if [ $dae -lt 2 ]
	then
		rm -rf /etc/nginx/conf.d/nginx-ldap-auth-daemon.pid
		sh /etc/nginx/conf.d/nginx-ldap-auth-daemon-ctl-rh.sh start
		exit 0
	else
		exit 0
	fi
else
	test=`nginx -t -q 2> nginx_result; cat nginx_result | wc -l`
	if [ $test = 0 ]
	then
		fuser -k 80/tcp
		fuser -k 80/tcp
		service nginx start 2> /dev/null
		rm -rf nginx_result
		if [ $dae -lt 2 ]
        	then
                	rm -rf /etc/nginx/conf.d/nginx-ldap-auth-daemon.pid
	                sh /etc/nginx/conf.d/nginx-ldap-auth-daemon-ctl-rh.sh start
        	        exit 0
	        else
        	        exit 0
	        fi
	else
		cat nginx_result
		rm -rf nginx_result
		exit 0
	fi
fi
