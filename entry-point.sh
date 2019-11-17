#!/bin/bash 

redis-server --daemonize yes
redis-cli hmset <USER_ID> id <ID> passwd <MOODLE_PASSWD>

python3 /home/moodle/app.py