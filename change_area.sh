#!/usr/bin/env bash

pkill -f module.py

echo "$1" > ~/.vs_module

systemctl