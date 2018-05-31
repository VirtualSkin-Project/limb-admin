#!/bin/bash

* * * * * bash echo /home/pi/VirtualSkin/virtual-limb/admin >> /tmp/cron.log
* * * * * bash /home/pi/VirtualSkin/virtual-limb/admin/subscribe.sh >> /home/pi/VirtualSkin/virtual-limb/admin/subscribe.log
