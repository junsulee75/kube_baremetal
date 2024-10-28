#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

case "$version_id" in
    "24.04"|"Some future version to add")
        echo "Wait for some time before creating kubenetes cluster.... ( 2 minutes to avoid dpkg lock release from all systems)  ";sleep 120
        ;;
    *)
        echo "continue without sleep !!! "
        ;;

esac

# kubemetal_002 : common function to wait until there is no lock on the file "/var/lib/dpkg/lock-frontend"   
# To avoid the error "Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 3199 (unattended-upgr)"  

waitDpkgLockRelease() {
    
    remote_host="$1"
    
    while true; do
        ssh $SSH_NO_BANNER $remote_host "lsof 2>/dev/null | grep /var/lib/dpkg/lock-frontend"
        lockCnt=$(ssh $SSH_NO_BANNER $remote_host "lsof 2>/dev/null | grep /var/lib/dpkg/lock-frontend | wc -l")  # Ensure no spaces around = in lockCnt=$(...)
        
        if [[ "$lockCnt" -eq 0 ]]; then
            echo "$remote_host : No lock on the file /var/lib/dpkg/lock-frontend. Continue ..."
            break
        else
            echo "$remote_host : $lockCnt locks on the file /var/lib/dpkg/lock-frontend. Wait for 5 seconds and try again !!"
        fi
    done

}


addGPGKey() {

    print1 "Install kubeadm, kubelet and kubectl (Reference : https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/  ) "   

    for i in $ALLHOST
    do

        print2 "$i : check file lock on /var/lib/dpkg/lock-frontend by lsof on the target systems. "
        waitDpkgLockRelease "${i}"
        print2 "$i : Add GPG key"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get update -y"
        # apt-transport-https may be a dummy package; if so, you can skip that package
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get install -y apt-transport-https ca-certificates curl gpg"
        # If the directory `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo mkdir -p -m 755 /etc/apt/keyrings"
        ssh $SSH_NO_BANNER $HOST  ${i} "curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg"

    done

}

addRepo() {

    for i in $ALLHOST
    do

        print2 "$i : Add the kubenetes repository to Apt sources:"
        ssh $SSH_NO_BANNER $HOST  ${i} "echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get update -y"
    done
}

installKube() {

    for i in $ALLHOST
    do
        print2 "$i : check file lock on /var/lib/dpkg/lock-frontend by lsof on the target systems. "
        waitDpkgLockRelease "${i}"
        print2 "$i : Install kubelet kubeadm kubectl"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get install -y kubelet kubeadm kubectl"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-mark hold kubelet kubeadm kubectl"
        #sudo systemctl enable --now kubelet #no need to do . optional
    done
}

addGPGKey
addRepo
installKube