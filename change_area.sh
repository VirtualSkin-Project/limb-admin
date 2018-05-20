#!/usr/bin/env bash

echo "$1" > ~/.vs_module
sudo systemctl restart vlimb.service
