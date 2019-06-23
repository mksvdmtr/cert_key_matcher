#!/bin/bash

RED='\033[0;31m'
GREEN='\033[1;32m'

if [ "$1" = "-h" ] || [ -z $1 ] || [ -z $2 ]
then
  echo "Usage: `basename $0` {cert} {key}"
  exit 0
else

        cert=$(openssl x509 -in $1 -pubkey -noout -outform pem | sha256sum)
        key=$(openssl pkey -in $2 -pubout -outform pem | sha256sum)

	if [ "$cert" == "$key" ]
	then
		printf "\n"
		printf "${GREEN}Match!\n"
		printf "\n"
	else
		printf "\n"
		printf "${RED}Not match\n"
		printf "\n"
	fi
fi
