#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

CLIENTNAME=$(jq --raw-output ".client_name" $CONFIG_PATH)

sed -i "s|%%CLIENTNAME%%|$CLIENTNAME|g" /etc/torrc

# start server
tor -f /etc/torrc
