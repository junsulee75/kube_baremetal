# kubenetes on baremetal

These are scripts for creating kubenetes environment on baremetal hosts with one master and 2 workers nodes.   

These scripts assumes the following.   

- 3 hosts with Ubuntu 22.04 OS ( For simplicity, not supporting Redhat yet. )       
- Passwordless root ssh log in among all hosts are set already.    
- hostnames convention is like xxxx1, xxxx2 and xxxx3 and those are set in /etc/hosts file of all hosts.     
  Otherwise, read config.ini and set manually target host names.   


## Contents

- [kubenetes on baremetal](#kubenetes-on-baremetal)
  - [Contents](#contents)
  - [Steps](#steps)


## Steps   

1.Preapare 3 bare metal hosts with Ubunutu 22.04.    
(If you are using IBM Fyre, create 3 hosts on quickburn with the versions.  )   

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
# Or uncomment the followint 3 lines and set the hostname values manally. (example) 
ALLHOST="jskube1.fyre.ibm.com jskube2.fyre.ibm.com jskube3.fyre.ibm.com"
headhosts=jskube1.fyre.ibm.com
datahosts="jskube2.fyre.ibm.com db2wh3.fyre.ibm.com"
```

Set Master node IP address internal IP address.  
```
ipadddr="xx.xx.xx.xx"
```

4.Run install.sh
```
./install.sh
```

That's it. Watch until the kubenetes cluster is ready.    


[Content](#contents)  


