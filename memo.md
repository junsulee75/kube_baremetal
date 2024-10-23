# temporary meo 

## Contents

- [DB2wh reference](#db2wh-reference)
  - [Contents](#contents)
  - [Command reference](#command-reference)
    - [LDAP](#ldap)
  - [Logs](#logs)
    - [collect DB2 warehouse logs](#collect-db2-warehouse-logs)
  - [Debug status](#debug-status)
  - [Files](#files)


## network addon

### flannel

Download the file 
https://github.com/flannel-io/flannel#deploying-flannel-manually   


```yaml

  net-conf.json: |
    {
      "Network": "10.200.0.0/16",  # <===
      "EnableNFTables": false,
      "Backend": {
        "Type": "vxlan"
      }
    }
...
      containers:
      - name: kube-flannel
        image: docker.io/flannel/flannel:v0.25.7
        command:
        - /opt/bin/flanneld
        args:
        - --ip-masq
        - --kube-subnet-mgr
        - --iface=eth0    # <=== mandatory ? worked fine without this. 
```

```
# kubectl apply -f kube-flannel.yml
Warning: resource namespaces/kube-flannel is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
namespace/kube-flannel configured
clusterrole.rbac.authorization.k8s.io/flannel created
clusterrolebinding.rbac.authorization.k8s.io/flannel created
serviceaccount/flannel created
configmap/kube-flannel-cfg created
daemonset.apps/kube-flannel-ds created

```


```
root@jskube1:~/kube_baremetal# kubectl get pod -A
NAMESPACE      NAME                                           READY   STATUS                  RESTARTS   AGE
kube-flannel   kube-flannel-ds-dswbd                          1/1     Running                 0          59s
kube-flannel   kube-flannel-ds-sphct                          1/1     Running                 0          59s
kube-flannel   kube-flannel-ds-tp7s7                          1/1     Running                 0          59s
kube-system    calico-kube-controllers-6879d4fcdc-85scm       0/1     ErrImagePull            0          132m
kube-system    calico-node-6zlpl                              0/1     Init:ImagePullBackOff   0          132m
kube-system    calico-node-ld9mk                              0/1     Init:ImagePullBackOff   0          132m
kube-system    calico-node-rr48k                              0/1     Init:ImagePullBackOff   0          132m
kube-system    coredns-7c65d6cfc9-49d9w                       1/1     Running                 0          156m
kube-system    coredns-7c65d6cfc9-h9gnz                       1/1     Running                 0          156m
kube-system    etcd-jskube1.fyre.ibm.com                      1/1     Running                 0          156m
kube-system    kube-apiserver-jskube1.fyre.ibm.com            1/1     Running                 0          156m
kube-system    kube-controller-manager-jskube1.fyre.ibm.com   1/1     Running                 0          156m
kube-system    kube-proxy-pkcq6                               1/1     Running                 0          156m
kube-system    kube-proxy-sm6cx                               1/1     Running                 0          150m
kube-system    kube-proxy-xckh6                               1/1     Running                 0          150m
kube-system    kube-scheduler-jskube1.fyre.ibm.com            1/1     Running                 0          156m
```

```
# kubectl get node 
NAME                   STATUS   ROLES           AGE    VERSION
jskube1.fyre.ibm.com   Ready    control-plane   156m   v1.31.1
jskube2.fyre.ibm.com   Ready    <none>          151m   v1.31.1
jskube3.fyre.ibm.com   Ready    <none>          150m   v1.31.1
```

```
root@jskube1:~/kube_baremetal# kubectl get pod -A -o wide
NAMESPACE      NAME                                           READY   STATUS    RESTARTS   AGE     IP            NODE                   NOMINATED NODE   READINESS GATES
kube-flannel   kube-flannel-ds-dswbd                          1/1     Running   0          9m39s   10.11.11.73   jskube2.fyre.ibm.com   <none>           <none>
kube-flannel   kube-flannel-ds-sphct                          1/1     Running   0          9m39s   10.11.11.66   jskube1.fyre.ibm.com   <none>           <none>
kube-flannel   kube-flannel-ds-tp7s7                          1/1     Running   0          9m39s   10.11.11.98   jskube3.fyre.ibm.com   <none>           <none>
kube-system    calico-kube-controllers-6879d4fcdc-85scm       1/1     Running   0          140m    10.200.2.2    jskube3.fyre.ibm.com   <none>           <none>
kube-system    calico-node-6zlpl                              0/1     Running   0          140m    10.11.11.66   jskube1.fyre.ibm.com   <none>           <none>
kube-system    calico-node-ld9mk                              1/1     Running   0          140m    10.11.11.73   jskube2.fyre.ibm.com   <none>           <none>
kube-system    calico-node-rr48k                              1/1     Running   0          140m    10.11.11.98   jskube3.fyre.ibm.com   <none>           <none>
kube-system    coredns-7c65d6cfc9-49d9w                       1/1     Running   0          164m    10.200.2.4    jskube3.fyre.ibm.com   <none>           <none>
kube-system    coredns-7c65d6cfc9-h9gnz                       1/1     Running   0          164m    10.200.2.3    jskube3.fyre.ibm.com   <none>           <none>
kube-system    etcd-jskube1.fyre.ibm.com                      1/1     Running   0          164m    10.11.11.66   jskube1.fyre.ibm.com   <none>           <none>
kube-system    kube-apiserver-jskube1.fyre.ibm.com            1/1     Running   0          164m    10.11.11.66   jskube1.fyre.ibm.com   <none>           <none>
kube-system    kube-controller-manager-jskube1.fyre.ibm.com   1/1     Running   0          164m    10.11.11.66   jskube1.fyre.ibm.com   <none>           <none>
kube-system    kube-proxy-pkcq6                               1/1     Running   0          164m    10.11.11.66   jskube1.fyre.ibm.com   <none>           <none>
kube-system    kube-proxy-sm6cx                               1/1     Running   0          158m    10.11.11.98   jskube3.fyre.ibm.com   <none>           <none>
kube-system    kube-proxy-xckh6                               1/1     Running   0          158m    10.11.11.73   jskube2.fyre.ibm.com   <none>           <none>
kube-system    kube-scheduler-jskube1.fyre.ibm.com            1/1     Running   0          164m    10.11.11.66   jskube1.fyre.ibm.com   <none>           <none>
root@jskube1:~/kube_baremetal# ifconfig -a
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.11.11.66  netmask 255.255.240.0  broadcast 10.11.15.255
        ether 00:00:0a:0b:0b:42  txqueuelen 1000  (Ethernet)
        RX packets 35446325  bytes 4099136194 (4.0 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 21823  bytes 13161897 (13.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 9.30.180.237  netmask 255.255.254.0  broadcast 9.30.181.255
        ether 00:00:09:1e:b4:ed  txqueuelen 1000  (Ethernet)
        RX packets 1890050  bytes 762047310 (762.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 41450  bytes 8185832 (8.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

flannel.1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1450
        inet 10.200.0.0  netmask 255.255.255.255  broadcast 0.0.0.0
        ether da:e3:28:4f:dc:0e  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 1679484  bytes 285808678 (285.8 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1679484  bytes 285808678 (285.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

tunl0: flags=193<UP,RUNNING,NOARP>  mtu 1480
        inet 10.200.83.128  netmask 255.255.255.255
        tunnel   txqueuelen 1000  (IPIP Tunnel)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```



[Content](#contents) 


## Reference

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/   
https://nvtienanh.info/blog/cai-dat-kubernetes-cluster-tren-ubuntu-server-22-04     

[Content](#contents) 
