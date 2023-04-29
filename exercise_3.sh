#!/bin/bash

log_file="/home/rvega/vscode/bash_playground/logs/ex3.log"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
message=$(ps aux --sort=-%cpu | awk 'NR<=4 {print $0}')

echo "----------------- ${timestamp} ----------------" >> "${log_file}"
echo "${message}" >> "${log_file}"
echo "" >> "${log_file}"