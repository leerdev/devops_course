#!/bin/bash
# echo "Week 1 Script"
DIR=$1
FILE=$3
case $2 in
        "bzip2")
                ALGO="-j"
                ;;
        "gzip")
                ALGO="-z"
                ;;
        "xz")
                ALGO="-J"
                ;;
        "none")
                ALGO=""
                ;;
        *)
                ALGO=""
                ;;
esac

tar -c -f $FILE $ALGO $DIR 2>error.log

if [ -s error.log ]; then
        exit -1
else
        openssl enc -aes-256-cbc -in $FILE -out $FILE".encrypted"
        rm $FILE
fi