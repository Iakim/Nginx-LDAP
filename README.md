# Nginx-LDAP
Nginx configure LDAP connection auth

### #1: Install pip and pyldap

      yum install python3 python3-pip
      pip3 install pyldap

### #2: Configure iakim-auth.conf

      See the comments in file.

### #3: Start Daemon

      ./nginx-ldap-auth-daemon-ctl-rh.sh start
      
