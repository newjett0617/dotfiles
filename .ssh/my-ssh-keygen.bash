#!/usr/bin/env bash

## how to use it ?
## for example:
## 	./my-shell github
## 
## it will generate public/private key for github and it will append config to $HOME/.ssh/config

## -ne => Not equal to.
## -z  => True if the length of string is zero.
if [ $# -ne 1 ] && [ -z $1 ]; then
	echo "No arguments";
	exit 1;
fi

SSH_CONFIG_PATH=$HOME/.ssh/config
KEYS_PATH=$HOME/.ssh/keys
KEY_TYPE=rsa
KEY_NAME=id_$KEY_TYPE

## create folder
echo "Create folder \"$KEYS_PATH/$1\""
mkdir -p $KEYS_PATH/$1;

### create rsa public/private key
ssh-keygen \
    -t $KEY_TYPE \
    -b 4096 \
    -C $1 \
    -f $KEYS_PATH/$1/$KEY_NAME \
    -N "" \
    -q \
;

## append config
echo "Append basic config to \"$SSH_CONFIG_PATH\""
cat << EOF >> $SSH_CONFIG_PATH
Host $1
	HostName $1
	User user
	Port 22
	IdentityFile $KEYS_PATH/$1/$KEY_NAME
	IdentitiesOnly yes
EOF
