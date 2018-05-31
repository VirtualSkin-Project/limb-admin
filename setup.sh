#!/bin/bash

if [[ -f /etc/init.d/limb-manager ]]; then
    sudo rm /etc/init.d/limb-manager
fi
sudo cp limb-manager /etc/init.d/limb-manager
sudo update-rc.d limb-manager defaults
sudo systemctl start limb-manager.service

if [[ -f /etc/default/limb-manager ]]; then
        sudo rm /etc/default/limb-manager
fi
awk '{print $2}' ~/.bash_profile > limb-manager.default
sudo cp limb-manager.default /etc/default/limb-manager

touch subscribe.log
if [[ -f cron.subscribe.sh ]]; then
    rm cron.subscribe.sh
fi
cat <<EOF >> cron.subscribe.sh
#!/bin/bash

* * * * * bash echo $VIRTUALSKIN_LIMB_ADMIN >> /tmp/cron.log
* * * * * bash $VIRTUALSKIN_LIMB_ADMIN/subscribe.sh >> $VIRTUALSKIN_LIMB_ADMIN/subscribe.log
EOF
sudo crontab -u pi cron.subscribe.sh
sudo systemctl restart cron.service

