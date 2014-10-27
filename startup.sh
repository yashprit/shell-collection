#!/bin/bash
source <input-file>

#this is decrypt function, this redirect output as string, Shell function never returns string
function decrypt() {
	#return output of decryption, we need to wrap command with $() to read output of command
	local PASS=$(printenv PASS)
	local output
	#store output to local variable
	#return output of decryption, we need to wrap command with $() to read output of command
	output=$(echo $1 | openssl enc -aes-256-cbc -d -a -pass pass:$PASS);
	#echo output so that it will be redirect to input
	echo $output;
}

#Following are step I need to do when I open my machine
#1. Login in webclient to access internet
PASSWORD=$(decrypt ${CYPASSWORD})
query_string="mode=191&username=$CYUSERNAME&password=$PASSWORD&a=$(date +'%s')&producttype=0"
curl -d "${query_string}" -H "Content-Type:application/x-www-form-urlencoded" $CYURL

#2. Open various url
google-chrome $GMAIL $PROJECT $COMMUNICATION $PLANNING >> /dev/null 2>&1 &

#3. Open Skype
PASSWORD=$(decrypt ${SKPASSWORD})
echo $SKUSERNAME $PASSWORD | skype --pipelogin >> /dev/null 2>&1 &

#4. Open Sublime
subl &

#5. open terminator
terminator --working-directory=$SHELL_DIR -e "bash -c '$TERMINAL; exec $SHELL'"


