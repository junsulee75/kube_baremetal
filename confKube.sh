#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh



initMaster() {

    which kubeadm
	if [ $? -ne 0 ]; then
        echo "kubeadm does not exist. Exiting !!"
        exit 1
    fi
    echo "master ip is : $ipaddr"
    
    print1 "Initializing the 1st master node"
    # purposely used 10.244.0.0 to use default flannel yaml  
    sudo kubeadm init \
  --pod-network-cidr=10.244.0.0/16 \
  --apiserver-advertise-address=$ipaddr | tee /tmp/kubeinit.out
#  --control-plane-endpoint=jskube1.fyre.ibm.com 

    if [ $? -ne 0 ]; then
		echo "Master initialization failure. Check and run again : $?"
        exit 1
	else
	    echo "success !!! "
        echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> /root/.bash_profile
	fi
    
}

joinWorkers() {

    joincmd=`tail -2 /tmp/kubeinit.out`
    for i in $workerhosts
    do

        print2 "$i : Join workers"
        ssh $SSH_NO_BANNER ${i} "$joincmd"
    done
}

chkKube() {

    export KUBECONFIG=/etc/kubernetes/admin.conf 
    print2 "/var/lib/kubelet/kubeadm-flags.env "
    cat /var/lib/kubelet/kubeadm-flags.env 
    print2 "cluster-info"
    kubectl cluster-info
    print2 "nodes"
    kubectl get node -o wide
    
}

initMaster
joinWorkers
chkKube