#! /bin/bash

if pgrep ngnix &> /dev/null
then
	echo "Ngnix está operando $( date +"%Y-%m_%d%H:%M:%S")"
else
	echo "Ngnix está fora de operação $( date +"%Y-%m_%d%H:%M:%S")"
fi
