#!/usr/bin/env bash
green="\033[0;32m"
red="\033[0;31m"
cyan="\033[0;36m"
nc="\033[0m"
blue="\033[1;34m"
yellow="\033[1;33m"
lightPurple='\033[1;35m'

isTest=${1}
echo -e "${yellow}
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${lightPurple}
            #  # #### #    #     ###    ##     ##  ###  #### #    ###
            #### ##   #    #    #   #    #  #  #  #   # # #  #    #  #
            #  # #### #### ####  ###      ## ##    ###  #  # #### ###
    ${yellow}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${nc}"
#exit 255

echo -e "
    ${yellow}-------------------------------------------${nc}
    ${blue}Updating ${nc}
    ${yellow}-------------------------------------------${nc}
    "
sleep 3s # wait before doing.
sudo apt update

if [ $? -ne 0 ];then
    ./terminator.sh 1 "sudo apt update"
    exit 255
fi

echo -e "
    ${yellow}-------------------------------------------${nc}
    ${green}Update complete${nc}
    ${yellow}-------------------------------------------${nc}
    ${blue}Upgrading ${nc}
    ${yellow}-------------------------------------------${nc}
    "
sleep 3s # wait before doing.

if [ ${isTest} == 'true' ];then
    ## force Upgrades can break things. Use this on your own risk.
    sudo apt upgrade -y --fix-missing ## running in force installation mode
else
    sudo apt upgrade --fix-missing
fi

if [ $? -ne 0 ];then
    ./terminator.sh 1 "sudo apt upgrade"
    exit 255
fi

echo -e "
    ${yellow}-------------------------------------------${nc}
    ${green}Upgrade Complete${nc}
    ${yellow}-------------------------------------------${nc}
    "
