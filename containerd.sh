#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

addGPGKey() {

    print1 "Install containerd (Reference : https://docs.docker.com/engine/install/ubuntu/ "   

    for i in $ALLHOST
    do

        print2 "$i : Add Docker's official GPG key"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get update -y"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get install ca-certificates curl -y"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo install -m 0755 -d /etc/apt/keyrings"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo chmod a+r /etc/apt/keyrings/docker.asc"


    done

}

addRepo() {

    for i in $ALLHOST
    do

        print2 "$i : Add the repository to Apt sources:"
        ssh $SSH_NO_BANNER $HOST  ${i} 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null'
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get update -y"
    done
}

installContainerd() {

    for i in $ALLHOST
    do
        print2 "$i : Install containerd"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo apt-get install containerd.io"
    done
}

confCgroup(){
    
    print1 "Configure cgroup for containerd"
    for i in $ALLHOST
    do
        print2 "$i : Dump 'containerd config default' to /etc/containerd/config.toml"
        ssh $SSH_NO_BANNER $HOST  ${i} "containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1"


        # https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd
        # Starting with v1.22 and later, when creating a cluster with kubeadm, if the user does not set the cgroupDriver field under KubeletConfiguration, kubeadm defaults it to systemd.
        print2 "$i : Cgroup to use systemd"   
        echo
        echo "Current SystemdCgroup value : "
        ssh $SSH_NO_BANNER $HOST  ${i} "grep SystemdCgroup /etc/containerd/config.toml"
        ssh $SSH_NO_BANNER $HOST  ${i} 'sudo sed -i "s/SystemdCgroup = false/SystemdCgroup = true/g" /etc/containerd/config.toml'
        echo "New SystemdCgroup value : "
        ssh $SSH_NO_BANNER $HOST  ${i} "grep SystemdCgroup /etc/containerd/config.toml"
      
        echo  
        echo "Current sandbox_image value : "
        ssh $SSH_NO_BANNER $HOST  ${i} "grep sandbox_image /etc/containerd/config.toml"
        ssh $SSH_NO_BANNER $HOST  ${i} 'sudo sed -i "s/sandbox_image = \"registry.k8s.io\\/pause:3\.[0-9]\"/sandbox_image = \"registry.k8s.io\\/pause:3.9\"/" /etc/containerd/config.toml'
        echo "New sandbox_image value : "
        ssh $SSH_NO_BANNER $HOST  ${i} "grep sandbox_image /etc/containerd/config.toml"
    done
}

restartSystemd(){
   
    for i in $ALLHOST
    do  
        print2 "$i : Restart systemd"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo systemctl restart containerd"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo systemctl status containerd"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo systemctl enable containerd"
    done 
    
}
#addGPGKey
#addRepo
#installContainerd
#confCgroup
restartSystemd