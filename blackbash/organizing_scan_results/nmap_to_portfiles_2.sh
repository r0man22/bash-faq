  GNU nano 8.3                               results.sh                                         
#!/bin/bash

result=$(nmap -sn 172.16.10.0/24 | grep "Nmap scan" | awk -F'report for ' '{print $2}')
sleep 10

echo "$result" | while IFS= read -r line; do
    nmap -sV "$line" | grep open | while read -r p; do
        port=$(echo "$p" | awk -F'/' '{print $1}')
        filename="port-${port}.txt"

        if ! grep -q "$line" "$filename" 2>/dev/null; then
            echo "$line" >> "$filename"
        fi
    done
done
