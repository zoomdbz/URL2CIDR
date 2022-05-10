#!/bin/bash

for i in `cat ${1+"$@"} 2>/dev/null || echo ${1+"$@"}`; do nslookup "$i" | grep "Address: " | tr -s '[[:blank:]]' | cut -d ":" -s -f 2-11 | sort -u | sed -e 's/^[ \t]*//' | while IFS= read -r line; do whois -IH "$line" | grep 'OrgName: \|CIDR: ' | tr -s '[[:blank:]]' | cut -d ":" -f 2 | sort -u | awk '$1=$1'; done;done
