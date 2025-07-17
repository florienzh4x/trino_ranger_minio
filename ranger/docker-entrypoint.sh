#!/bin/bash

# statup script for ranger-admin
cd /root/ranger-admin && ./setup.sh 
ranger-admin start 

python3 -m venv /root/ranger-admin/.env && source /root/ranger-admin/.env/bin/activate && pip install -r /root/ranger-admin/requirement.txt
python /root/ranger-admin/trino_service_setup.py

echo "waiting for catalina.out to be created"
until [ -f /root/ranger/ews/logs/catalina.out ]; do 
  sleep 1
done
tail -f /root/ranger/ews/logs/ranger-admin-*-.log /root/ranger/ews/logs/catalina.out