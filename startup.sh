#!/bin/bash
source <input-file>
#Following are step I need to do when I open my machine

#1. Login in webclient to access internet
query_string="mode=191&username=$CYUSERNAME&password=$CYPASSWORD&a=$(date +'%s')&producttype=0"
curl -d "${query_string}" -H "Content-Type:application/x-www-form-urlencoded" $CYURL

#2. Open various url
google-chrome $GMAIL $PROJECT $COMMUNICATION $PLANNING >> /dev/null 2>&1 &

#3. Open Skype
echo $SKUSERNAME $SKPASSWORD | skype --pipelogin >> /dev/null 2>&1 &
#5 Open Sublime
subl &

#4. open terminator
terminator --working-directory=$SHELL_DIR -e "bash -c '$TERMINAL; exec $SHELL'"

