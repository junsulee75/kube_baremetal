#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

# Network addon 
# https://kubernetes.io/docs/concepts/cluster-administration/addons/#networking-and-network-policy   

flannel() {

    #https://github.com/flannel-io/flannel#deploying-flannel-manually 
    print1 "Adding flannel for network"

    print2 "Downloading yaml file to /tmp/kube-flannel.yml"
    curl -L -o /tmp/kube-flannel.yml https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml 

    print2 "Installing flannel"
    kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml 
    # This will pick up the first network interface. On fyre, eth0, which is the correct one. 
    # JSTODO : Otherwise, better to set the yaml file manually.  
    #        args:
    #    - --ip-masq
    #    - --kube-subnet-mgr
    #    - --iface=eth0    # <=== mandatory ? worked fine without this.
   
    print2 "Monitoring the pods status"
    
    watch.pl -e "kubectl get pods -n kube-flannel | grep kube-flannel" -p "kube-flannel-ds.*1/1.*Running" -i 5

    # JSTODO : kube-flannel namespace pod status check 
#    NAMESPACE      NAME                                    READY   STATUS    RESTARTS   AGE
#kube-flannel   kube-flannel-ds-24vwz                   1/1     Running   0          62s
#kube-flannel   kube-flannel-ds-8cv77                   1/1     Running   0          62s
#kube-flannel   kube-flannel-ds-j7trk                   1/1     Running   0          62s

    echo "Necessary pods become 'Running'. Seems almost done. Let's wait 10 more seconds and check things."
    sleep 10
    
    print2 "Node after network addon. Check if Ready status" 
    kubectl get node -A
    kubectl get pod -A
  
    echo ""
    echo "Run the command and check kubenetes resource : export KUBECONFIG=/etc/kubernetes/admin.conf " 
    
}

addon=$1
case $addon in
    flannel )
        flannel
        ;;
    * )
        echo "Unsupported option : try nwAddon.sh flannel"
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