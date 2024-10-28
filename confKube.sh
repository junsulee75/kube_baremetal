#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh


case "$version_id" in
    "24.04"|"Some future version to add")
        echo "Wait for some time before creating kubenetes cluster....";sleep 10
        ;;
    *)
        echo "continue without sleep !!! "
        ;;

esac

initMaster() {

    which kubeadm
	if [ $? -ne 0 ]; then
        echo "kubeadm does not exist. Exiting !!"
        exit 1
    fi

    if [[ -e "/tmp/kubeinit.out" ]]; then
        print2 "master : /tmp/kubeinit.out file exists already. Master initialization might have done already. Skipping master initialization"
        return 100
    fi

    echo "master ip is : $ipaddr"
   
    # JSTODO : 3.9 -> 3.10  
    print1 "Initializing the 1st master node"
    # purposely used 10.244.0.0 to use default flannel yaml  
    sudo kubeadm init \
  --pod-network-cidr=10.244.0.0/16 \
  --apiserver-advertise-address=$ipaddr | tee /tmp/kubeinit.out
#  --control-plane-endpoint=jskube1.fyre.ibm.com 

    if [ $? -ne 0 ]; then
		echo "Master initialization failure. Check and run again : $?"
        rm -f /tmp/kubeinit.out  # let's remove the file so that the script run initialization again    
        exit 1
	else
        echo ""
	    echo "success !!! "
        echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> /root/.bash_profile
	fi
    
}

joinWorkers() {

    joincmd=`tail -2 /tmp/kubeinit.out`
    #JSTODO check command 
    for i in $workerhosts
    do
        ssh $SSH_NO_BANNER ${i} "which kubeadm"
        if [ $? -ne 0 ]; then
            print2 "$i : Can't find kubeadm command. Exiting !!! Check the environment again  " 
            exit 1
        fi

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