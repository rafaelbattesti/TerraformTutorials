#!/bin/bash

# Output all results, but fail build if one test fails
declare -i fail=0

# Output colors
red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)

# 1. Test public IP
echo "Running ICMP test for Public IP: $(terraform output public_ip)"
((count = 10))
while [[ $count -ne 0 ]] ; do
    ping -c 1 $(terraform output public_ip)
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 1))
        echo "${green}PASS${reset}"
    fi
    (( count-- ))
done

if [[ $rc -ne 0 ]] ; then
    echo "${red}FAIL${reset}"
    fail=1
fi

# 2. Test public DNS
echo "Running ICMP test for Public DNS: $(terraform output public_dns)"
((count = 10))
while [[ $count -ne 0 ]] ; do
    ping -c 1 $(terraform output public_dns)
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 1))
        echo "${green}PASS${reset}"
    fi
    ((count = count - 1))
done

if [[ $rc -ne 0 ]] ; then
    echo "${red}FAIL${reset}"
    fail=1
fi

if [[ fail -ne 0 ]] ; then
    exit 1
fi