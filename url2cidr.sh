#!/bin/bash

BLUE='\033[94m'
RED='\033[91m'
GREEN='\033[92m'
ORANGE='\033[93m'
RESET='\e[0m'
PURPLE='\033[0;35m'

echo -e "$RED             _ ___   _____ _____ _____  _____      $RESET "
echo -e "$RED             | |__ \ / ____|_   _|  __ \|  __ \       $RESET "
echo -e "$RED   _   _ _ __| |  ) | |      | | | |  | | |__) |     $RESET "
echo -e "$RED | | | | '__| | / /| |      | | | |  | |  _  /     $RESET "
echo -e "$RED | |_| | |  | |/ /_| |____ _| |_| |__| | | \ \     $RESET "
echo -e "$RED  \__,_|_|  |_|____|\_____|_____|_____/|_|  \_\   $RESET "

	echo -e "$RED  \n Made by $PURPLE DIVIDEBYZER0 + 3T3RN4lP4r4D0X $RESET \n"


echo -e "\n$GREEN [.] Mapping $1 to its CIDR BLOCK.. [.] \n $RESET"	


echo -e " $ORANGE [+] OUTPUT recieved from $1 [+]  $RESET "


for i in `cat ${1+"$@"} 2>/dev/null || echo ${1+"$@"}`; do nslookup "$i" | grep "Address: " | tr -s '[[:blank:]]' | cut -d ":" -s -f 2-11 | sort -u | sed -e 's/^[ \t]*//' | while IFS= read -r line; do whois -IH "$line" | grep 'OrgName: \|CIDR: ' | tr -s '[[:blank:]]' | cut -d ":" -f 2 | sort -u | awk '$1=$1'; done;done





