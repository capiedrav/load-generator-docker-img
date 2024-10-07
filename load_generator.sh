#!/bin/bash

while true
do 
    curl -o /dev/null/ -s -w "%{http_code} ${END_POINT}\n" http://${END_POINT}    
    sleep ${SLEEP_INTERVAL}
done