# kubenetes on baremetal

These are scripts for creating kubenetes environment on baremetal hosts with 1 master and multiple workers nodes,  
mainly for test purpose with few 3 ~ 5 hosts. (But no limit on the number of hosts by this script)         

These scripts assumes the following.   

- Hosts with Ubuntu 22.04 or 24.04. ( Other linux distribution such as Redhat, SLES are not supported yet. )      
- Passwordless root ssh log in among all hosts are set already.    
- hostnames convention is like xxxx1, xxxx2 and xxxx3 and those are set in /etc/hosts file of all hosts.     
  Otherwise, read config.ini and set manually target host names.   


## Contents

- [kubenetes on baremetal](#kubenetes-on-baremetal)
  - [Contents](#contents)
  - [Steps](#steps)


## Steps   

1.Preapare at least 3 or more bare metal hosts with Ubuntu 22.04 or 24.04.             
(If you are using IBM Fyre, create 3 ~ 5 hosts on quickburn with the versions.  )   

2.SSH login to the first target master node, clone this repo.    

```
git clone https://github.com/junsulee75/kube_baremetal
```

Go to the directory   

```
cd kube_baremetal
```

3.Configure config.ini 

> If your hosts are fyre environment provisioned, you can skip this step 3.

Target hostnames in config.ini    

```
# ...
# Or uncomment the following 3 lines and set the hostname values manally. (3 hosts example) 
ALLHOST="jskube1.fyre.ibm.com jskube2.fyre.ibm.com jskube3.fyre.ibm.com"
headhosts=jskube1.fyre.ibm.com
datahosts="jskube2.fyre.ibm.com jskube3.fyre.ibm.com"
```

Set 1st host internal network adpater IP address and the interface name.  (1st host will be used for master control plane node)    

Example)   
```
ipadddr="xx.xx.xx.xx"

# Internal network interface name of master node . Configure manually
iface="eth0"
```

4.Run install.sh
```
./install.sh
```

That's it. Watch until the kubenetes cluster is ready.    

If you have doubt how it works, here is the installation terminal output example page on [Ubuntu 22.04](./output_ubuntu22.md) .  

[Content](#contents)  


