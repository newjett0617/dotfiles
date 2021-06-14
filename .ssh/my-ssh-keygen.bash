#!/usr/bin/env bash

#set -xueo pipefail;

die () {
  echo >&2 "$@";
  exit 1;
}

HOST=$1

## `$#` => number of parameters
## `[ integer1 -gt integer2 ]` => integer1 > integer2
## `[ -z string ]` => string.length = 0
if [ "$#" -gt 1 ] || [ -z "${HOST}" ]; then
  die "No arguments";
fi

SSH_CONFIG_PATH="${HOME}/.ssh/config"
SSH_KEY_OUTPUT_PATH="${HOME}/.ssh/keys"
SSH_KEY_OUTPUT_DIR="${SSH_KEY_OUTPUT_PATH}/${HOST}"
SSH_KEY_TYPE="ed25519"
#SSH_KEY_TYPE="rsa"
SSH_KEY_BITS="4096"
SSH_KEY_NAME="id_${SSH_KEY_TYPE}"

## create folder
mkdir -p ${SSH_KEY_OUTPUT_DIR}

## create public/private key
ssh-keygen \
  -q \
  -b ${SSH_KEY_BITS} \
  -t ${SSH_KEY_TYPE} \
  -N '' \
  -C ${HOST} \
  -f ${SSH_KEY_OUTPUT_DIR}/${SSH_KEY_NAME}\
  ;

# append config
cat << EOF >> ${SSH_CONFIG_PATH}
Host ${HOST}
  HostName ${HOST}
  User user
  Port 22
  IdentityFile ${SSH_KEY_OUTPUT_DIR}/${SSH_KEY_NAME}
  IdentitiesOnly yes

EOF
