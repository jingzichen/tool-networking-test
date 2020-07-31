#!/bin/bash
# program: A network troubleshooting tool.
# version: 0.0.2

function dnsresolve() {
    if [[ $(echo "$1" | awk '/Add/ && !/#/ && NR > 1 {print $2}' | xargs) != $2 ]]; then
        echo "$3 lookup failure"
    fi
}

function healthcheck() {
    if [[ $(echo "$1" | grep HTTP/1.1 | awk {'print $2'}) != "200" ]]; then
        echo "$2 is unhealthy"
        echo "$1"
    fi
}

while true
do
    ## Checking for the resolved IP address .
    resolvedIP=$(nslookup github.com | awk '/Add/ && !/#/ && NR > 1 {print $2}' | xargs)
    ## The curl command `-s` does not display statistics "% Total% Received%
    url=$(curl -s -S -I http://www.google.com/)

    ## Deciding the lookup status by checking the variable has a valid IP string.
    dnsresolve "$resolvedIP"  "xxx.xxx.xxx.xxx" "google.com"
    ## If service does not return 200, echo its content.
    healthcheck "$url" "url"

    sleep 1

done