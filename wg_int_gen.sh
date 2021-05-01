#!/usr/bin/env bash

second_octet=3
interfaces=255  # this must not exceed 255 or be less than 0

for ((i=0; i<$second_octet; i++))
do
    for((j=0; j<$interfaces; j++))
    do
        portnum=$((51822+$j))
        while [ -n "$(ss -laun | grep $portnum)" ]
        do
            echo "$portnum"
            echo "not empty"
            let portnum+=1
        done
        touch 10.$j.$i.1_32_$portnum.conf
        echo "[Interface]
        PrivateKey = WG2B3i6lWjAM4uF55aWFuDsY3KzqeJrGC3XDAgiwy2A=
        Address = 10.$j.$i.1/16
        ListenPort = $portnum

[Peer]
        PublicKey = 74dQl5ZFc4FX7FQKF5W7Ob/C0tIlr$j\BW5mXMKzJ9lwA=
        AllowedIPs = 10.$j.$i.2/32" > 10.$j.$i.1_32_$((51822+$(($interfaces*$i))+$j)).conf
    done
done
