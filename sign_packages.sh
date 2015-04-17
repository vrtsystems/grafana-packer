#!/bin/bash


wget https://grafanarel.s3.amazonaws.com/builds/grafana-2.0.0_beta3-1.x86_64.rpm
echo $PRIVATE_GPG_KEY > private.key
gpg --allow-secret-key-import --import private.key
./sign_expect *.rpm