#!/bin/bash
# program: A network troubleshooting tool.
# version: 0.0.1

while true
do
    ## Checking for the resolved IP address .
    resolvedIP=$(nslookup github.com | awk '/Add/ && !/#/ && NR > 1 {print $2}' | xargs)
    ## The curl command `-s` does not display statistics "% Total% Received%
    url=$(curl -s -S -I http://www.google.com/)

    ## Deciding the lookup status by checking the variable has a valid IP string.
    if [[ $(echo "$resolvedIP") != "xxx.xxx.xxx.xxx" ]]; then
        echo "resolvedIP lookup failure"
    fi
    ## If service does not return 200, echo its content.
    if [[ $(echo "$url" | grep HTTP/1.1 | awk {'print $2'}) != "200" ]]; then
        echo "url is unhealthy"
        echo "$url"
    fi

    sleep 1

done