#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

kernelModule() {

    print1 "Kernel module configuration for containerd"
    #echo "target hosts : $ALLHOST"

    for i in $ALLHOST
    do

        print2 "$i : Automatic load at boot"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
"

        print2 "$i Load Kernel Modules Manually"
        ssh $SSH_NO_BANNER $HOST  ${i}  "sudo modprobe overlay"
        ssh $SSH_NO_BANNER $HOST  ${i}  "sudo modprobe br_netfilter"

        print2 "$i Verify if the Modules are Loaded:"
        ssh $SSH_NO_BANNER $HOST  ${i}  "lsmod |grep overlay"
        ssh $SSH_NO_BANNER $HOST  ${i}  "lsmod |grep br_netfilter"            

        print2 "$i : iptables configuration "
        ssh $SSH_NO_BANNER $HOST  ${i} "sysctl -w net.bridge.bridge-nf-call-ip6tables=1"
        ssh $SSH_NO_BANNER $HOST  ${i} "sysctl -w net.bridge.bridge-nf-call-iptables=1"
        print2 "$i : Permanent configurations"  
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF"

        print2 "$i : Refresh kernel parameters"   
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo sysctl --system"

    done

}

kernelModule