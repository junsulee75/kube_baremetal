# DB2 Warehouse auto configuration reference script  

These are scripts originally written for creating DB2 warehouse (local) environment on IBM internal test provisioned systems.   
Sharing these for users who are interested in automating the steps.   
(Refer these for test systems only, not for production system configuration usage.)      

Creating the environment is not too complicated   
but I automated as a single command for my personal usage    
for creating the env whenever I need to do test something shortly.   
These scripts assumes the following.   

- Using the environment that was created in a same cluster.  
  - created 3 hosts stack.    
  - Passworedless ssh login by root user is set already.   
  - hostnames convention is like xxxx1, xxxx2 and xxxx3.    
  - Linux only      

If you want to install things manually one by one, refer the [Steps](docs/db2wh_manual_installation.md).     
Scripts in this repoistory do all the manual steps in one go.  

## Steps    

1. Create fyre environment on the Fyre page. for example, [quickburn](https://fyre.svl.ibm.com/quick) .    
- Redhat 8.2 or later ( Tested on 8.2, 8.8 )       
- Size : 16 GB memory ( up to 8 partitions per host.), 8 GB memory (Up to 4 partitions per host.)   
  
> Script here creates 4 partitions on each hosts as I think that is enough for covering most testing purposes.       
- Quantity : 3     

=> `Create Ember` , then wait until you get the mail for the completion.    

2. SSH login to the 1st host.  

```
ssh root@xxxx1.fyre.ibm.com
```

3. Download the scripts and go to the directory.   

```
git clone https://<ibm github user id>:<ibm github token>@github.ibm.com/junsulee/db2wh_test_env
# example : git clone https://junsulee:xxxxxxxxx@github.ibm.com/junsulee/db2wh_test_env 
cd db2wh_test_env
```

> `git` command is installed in fyre VMs by default.
> If 'git' command does not exit, install manually by `yum -y install git`    


4. Edit `config.ini` file   
- Only thing you should set is your IBM_KEY. This IBM Cloud API key. This is necessary to download DB2wh containter images.  
  See the file to get new key if you don't have an existing one.   
  - Log into IBM Cloud - https://cloud.ibm.com/login. 
  - Go to Manage > Click Access > Click IBM Cloud API keys.
  - Then create. 
  - Replace the value in the line of `config.ini` file.   

```
...
IBM_KEY="XXXX"
...
```

> On fyre system, that is all you need to set.   

- The scripts expects hostnames should be like xxx1.fyre.ibm.com, xxx2.fyre.ibm.com, xxx3.fyre.ibm.com.   
  In that case, you don't need to change anything else.  
  Otherwise, you need to set hostnames manually to the varilable ALLHOST, headhost, datahost like below.  
```
#ALLHOST="db2wh1.fyre.ibm.com db2wh2.fyre.ibm.com db2wh3.fyre.ibm.com"
#headhost=db2wh1.fyre.ibm.com
#datahost="db2wh2.fyre.ibm.com db2wh3.fyre.ibm.com"
```
- Also, the script expects passwordless root login is set among hosts.  
  Configure in advance if it's not configured. ( On Fyre created systems, it's set by default. )  
  
5. Install Db2 warehouse

```
./install.sh
```

That's all.    

---

## MISC 

- For any reason, if you have to destroy and clean Db2 warehouse container to install again from scratch,   
run 
```
./db2whDestroy.sh   
```

- While trial license should be enough for test systems, if you really need to apply a permanent license, 
  run the steps.
```
cp dash_c.lic /mnt/clusterfs
podman exec -it Db2wh bash   
dashlicm -a /mnt/blumeta0/dash_c.lic  ## This command is to run within the container   
```

> The license is for IBM internal test system usage only.  

## Self notes

Db2 warehouse scripts are located in the path `/usr/lib`.   

ex) 
```
[root@db2whtest1 - Db2wh lib]# pwd
/usr/lib
[root@db2whtest1 - Db2wh lib]# ls dashDB_local_common_functions.sh
dashDB_local_common_functions.sh
```

## JS_TODO

- Hostname validation    
