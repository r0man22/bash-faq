#!/bin/bash

url=172.16.10.12
endpoint=$(curl -s http://"$url"/robots.txt | awk '{print $2}' | grep '/')

while read -r line; do
    # curl -I ile HTTP başlıklarını al
    output=$(curl -s -I http://"$url"/"$line" | grep -i "HTTP/" | awk '{print $2}')
    
    # Durum kodu "200" ise erişilebilir
    if [[ "$output" == "200" ]]; then
        echo "http://$url$line is accessible"
    else
        echo "http://$url$line is inaccessible. Return code --> $output"
    fi

done <<< "$endpoint"
