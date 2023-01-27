#!/bin/bash

ListImages=$(docker images)
echo "Images in docker:${ListImages}"
nextscan=0
while [ $nextscan -ne 1 ]
do
    read -p "Enter the docker image: " nameImage
    echo "Current Image: $nameImage"

    read -p "Enter number for:
    1.simple format
    2.json format ---> " choice

   
    case $choice in
     1)
     testscan=$(docker scan $nameImage)
     echo "Scanning Images : ${testscan}"
     ;;
     2)
     testscan2=$(docker scan $nameImage --json)
     echo "Scanning Images : ${testscan2}"
     ;;
     *)
     echo "Unknown value"
     ;;
    esac

    nextscan=1
    echo "Do you want to scan again yes or no"  
    read temporary
    if [ $temporary = 'yes' ]; then
    nextscan=0
    fi
done


