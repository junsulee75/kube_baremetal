#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

enable_portforwarding() {

    print1 " Enable port forwarding kernel OS setting. If the parameter is set in /etc/sysctl.conf, this script will check and change there too. "
    #echo "target hosts : $ALLHOST"

    for i in $ALLHOST
    do
        print2 "$i : Live change only : sysctl -w net.ipv4.ip_forward=1"
        ssh $SSH_NO_BANNER $HOST  ${i} "sysctl -w net.ipv4.ip_forward=1"
        if [ $? -ne 0 ]; then
            logger_error "Failure to enable port forwarding on the host $i"
        fi
        ssh $SSH_NO_BANNER $HOST  ${i} "printf \"The current value           \";sysctl net.ipv4.ip_forward"
        ssh $SSH_NO_BANNER $HOST  ${i} "printf \"Value in /etc/sysctl.conf   \" ;grep \"net.ipv4.ip_forward =\" /etc/sysctl.conf"
        print2 "$i : permanent change to /etc/sysctl.conf. /etc/sysctl.conf is the last file to run during next reboot"
        ssh $SSH_NO_BANNER $HOST  ${i} "sed -i 's/^net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/' /etc/sysctl.conf"
        ssh $SSH_NO_BANNER $HOST  ${i} "printf \"Value in /etc/sysctl.conf   \" ;grep \"net.ipv4.ip_forward =\" /etc/sysctl.conf"
       
        # For fresh ubuntu installated systems, /etc/sysctl.conf is not configured.
        # Therefore, safely add the parameters permenantly and refresh again. 
        # https://kubernetes.io/docs/setup/production-environment/container-runtimes/  says only net.ipv4.ip_forward = 1. 
        # Just put other 2 parameters from other old references. I think no harm to add those together.  
        print2 "$i : Put the configuration to /etc/sysctl.d/ for next reboots" 
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo tee /etc/sysctl.d/k8s.conf <<EOF
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF" 
        print2 "$i : Apply sysctl params without reboot"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo sysctl --system" # Apply sysctl params without reboot
    done

}

enable_portforwarding  

## JSTODO : 
## Ubuntu 24.04 or fresh installed systems may not have net.ipv4.ip_forward in  /etc/sysctl.conf 
## Maybe that's why Putting file /etc/sysctl.d/k8s.conf.  
## So let's just do it and also replace /etc/sysctl.conf   
## Or maybe, fyre provisioned Linux might configure /etc/sysctl.conf       
