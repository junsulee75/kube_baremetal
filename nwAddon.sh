#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

# Network addon 
# https://kubernetes.io/docs/concepts/cluster-administration/addons/#networking-and-network-policy   

flannel() {

    print1 "Adding flannel for network"
    
}

addon=$1
case $addon in
    flannel )
        flannel
        ;;
    * )
        echo "Unsupported option"
        ;;
esac

#### CALICO : not working well  

#curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml -O

#yaml
#             - name: CALICO_IPV4POOL_CIDR
#               value: "10.200.0.0/16"

#kubectl apply -f calico.yaml
#kubectl get pods -n kube-system ; echo ;echo ;kubectl get node

#Error   
#```
#Events:
#  Type     Reason            Age                     From     Message
#  ----     ------            ----                    ----     -------
#  Warning  DNSConfigForming  5m36s (x507 over 115m)  kubelet  Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 10.11.0.21 10.11.0.22 9.30.99.253