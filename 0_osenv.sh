#!/bin/bash

#source `pwd`/conf ## for /bin/ksh
source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

# For all hosts, check if the command exist. If not. install.   
swCmdChkAllHost(){

    for SWNAME in $1
        do
	    for HOST in $ALLHOST
	        do
    		disp_msglvl2 "Installing $SWNAME on $HOST..."
    		ssh $SSH_NO_BANNER root@$HOST which $SWNAME > /dev/null 
            if [ $? -ne 0 ]; then
                ssh $SSH_NO_BANNER $HOST $pkgmgr -y install $SWNAME
            else
                echo "$SWNAME is already installed on $HOST"
            fi
    	done
    done
}

setProfile(){
	disp_msglvl2 "setting set -o vi"
	echo "set -o vi" >> /etc/bashrc
	echo "set -o vi" >> ~/.bash_profile  # ubuntu may need it. adding to /etc/bashrc not working sometimes.      

	for HOST in $datahost
	do
		echo "copying to $HOST"
		scp /etc/bashrc root@$HOST:/etc
	done
}


if [[ "$pkgmgr" == "apt" ]]; then
	print1 "Ubuntu : Adding 'universe' repostiory. I prefer to do this as this is often needed. If some message pops up, just select 'OK' "     
    sudo add-apt-repository universe -y
    sudo $pkgmgr update -y
fi

swCmdChkAllHost "jq"  # install jq for test
setProfile
pyChk ## install python 

disp_msglvl1 "Copying frequently used commands to /usr/local/bin"   
for f in menu.py watch.pl 
do
	rm -f /usr/local/bin/$f
    disp_msglvl2 "Copying `pwd`/$f"
    cp `pwd`/$f /usr/local/bin
    which $f
done