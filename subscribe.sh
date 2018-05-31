#!/usr/bin/env bash

. ~/.bash_profile
V_IP=`hostname -I`
echo ${V_IP}
V_UUID=`cat $VIRTUALSKIN_LIMB/.vlimb_id`
echo ${V_UUID}
V_AREA=`cat $VIRTUALSKIN_LIMB/.vs_module`
echo ${V_AREA}
ssh-copy-id -i `echo $VIRTUALSKIN_USER_HOME`/.ssh/id_virtualskin_rsa pi@virtualskin.local
curl http://virtualskin.local:8080/subscribe -i \
    -H "Accept: application/json" \
    -H "X-HTTP-Method-Override: POST" \
    -X POST \
    --data @<(cat <<EOF
{
  "ip": "${V_IP}",
  "name": "${V_UUID}",
  "area": "$V_AREA"
}
EOF
)
#    -X POST -d '{"ip":"'${V_IP}'","name":"${V_UUID}","area":"${V_AREA}","ssh_key":"`cat ${V_SSH_KEY}`"}' \
#    http://virtualskin.local:8080/subscribe

