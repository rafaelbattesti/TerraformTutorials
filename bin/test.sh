#!/bin/bash

set +e

cat <<EOF
=========================
Infrastructure Validation
=========================
EOF


# Output all results, but fail build if one test fails
declare -i fail_build=0
declare -i total=0
declare -i failed=0

# Output colors
red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)

# 1. Test public IP
test_id="001 : Ping Public IP"
ping -c 5 $(terraform output public_ip) > /dev/null 2>&1
rc=$?
if [[ $rc -eq 0 ]] ; then
    echo "${green}${test_id}${reset}"
else
    echo "${red}${test_id}${reset}"
    ((failed = failed + 1))
    fail_build=1
fi

# 2. Test public DNS
test_id="002 : Ping Public DNS"
ping -c 5 $(terraform output public_dns) > /dev/null 2>&1
rc=$?
if [[ $rc -eq 0 ]] ; then
    echo "${green}${test_id}${reset}"
else
    echo "${red}${test_id}${reset}"
    ((failed = failed + 1))
    fail_build=1
fi

echo
echo "total: ${total}, failed: ${failed}"

if [[ fail_build -ne 0 ]] ; then
    echo
    echo "${red}-- Build Failed --${reset}"
    exit 1
fi