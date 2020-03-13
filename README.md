# Nginx-LDAP
Nginx configure LDAP connection auth

### #1: Install pip, pyldap and depedences

      yum install git gcc openldap-devel.x86_64 python-devel libevent-devel python3 python3-pip -y
      yum clean all
      yum groupinstall "Development tools" -y
      yum provides */lber.h */ldap.h

### #2: Configure iakim-auth.conf

      See the comments in file.

### #3: Start Daemon

If you use python version < 3, change the script of python3 for python only or python{version}.

      ./nginx-ldap-auth-daemon-ctl-rh.sh start
      
