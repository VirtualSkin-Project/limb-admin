#!/bin/bash

if [ -f /etc/init.d/limb-manager ] ; then
    sudo rm /etc/init.d/limb-manager
fi
sudo cp limb-manager /etc/init.d/limb-manager
sudo update-rc.d limb-manager defaults
sudo systemctl start limb-manager.service
