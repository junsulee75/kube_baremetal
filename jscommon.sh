#!/bin/bash
##########################################
 # program name : jscommon.sh
 # Copyright ? 2021 Jun Su Lee. All rights reserved.
 # Author : Jun Su Lee ( junsulee@au1.ibm.com )
 # Description : Common usage for all kind of shell scripts
 #               For this, I prefer not to put dependencies with other scripts.  
 #
 # Category : DB2 support
 # Usage
 # Date : Apr.09, 2021
 #
 # Revision History
 # - Nov. 30, 2018 : 
##########################################

# To avoid login message
SSH_NO_BANNER="-q -o LogLevel=QUIET -o StrictHostKeyChecking=no"  # example full ssh command : ssh -q -o LogLevel=QUIET hostname command  

#################################################
# Package manager command to use.  yum or apt 
#################################################
pkgmgr="yum"  # Linus package manager command. set this as yum as it's more popular  

if [[ -f /etc/os-release ]]; then   ## make sure to run with bash. Otherwise, will get error.   
    os=$(grep '^ID=' /etc/os-release | awk -F= '{print $2}' | tr -d '"')    # remove the quote " if there is
    
    if [[ "$os" == "rhel" || "$os" == "fedora" || "$os" == "centos" ]]; then
        pkgmgr="yum"
    elif [[ "$os" == "ubuntu" || "$os" == "debian" ]]; then
        pkgmgr="apt"
    else
        echo "Unsupported OS : $os    . Exiting !!"
        exit 1
    fi
else 
    echo "Cannot find /etc/os-release file. Is this Linux OS ? Check again. Exiting now !!"
    exit 1
fi


# Command return value check and exit 1 if non zero
cmdRetChk(){
	if [ $? -ne 0 ]; then
		echo "failure. Exit.."
        exit 1 
	else
	    echo "success !!! "
	fi
}

timestamp()
{
    date +'%Y-%m-%d %H:%M:%S.%3N'
}


stop_immediately () {
    [[ -z "$1" ]] || logger_error "REASON: $1"
    exit 1
}


logger ()
{
    if [ -z "$PRODUCT_LOGFILE" ]; then
        export PRODUCT_LOGFILE=kube_install.log.$$
    fi
    # Print caller's source file, line number and function name
    # Skip two functions that are usually top of the stack
    # i.e. logger_xxxx and logger
    echo "[$(timestamp)] - $(basename ${BASH_SOURCE[2]}):${BASH_LINENO[1]}(${FUNCNAME[2]}) - $*" >> $PRODUCT_LOGFILE
    return 0
}

logger_error ()
{
    local LEVEL="ERROR"
    if [ -n "$1" ]; then
        logger " $LEVEL: $1"
        echo " $LEVEL: $1"
    else
        while read IN
        do
            logger "$LEVEL: $IN"
            echo "$LEVEL: $IN"
        done
    fi
    return 0
}

disp_msglvl2(){
	echo
	echo "**********************************************"
	echo $1
	echo "**********************************************"
    echo
}

print2(){
	disp_msglvl2 "$1"
}

disp_msglvl1(){
	echo
	echo
	echo "###########################################################################################"
	echo $1
	echo "###########################################################################################"
	echo
}

print1(){
	disp_msglvl1 "$1"
}

# install software if the command does not exist. This is only for the current host.   
# For multiple hosts, I don't put a common function here yet as it's more complex.   
# call this function like this listing up package name split by a space 
# ex) swChk podman jq vim tmux skopeo
## jq : JSON command line
## 

swCmdChk(){

    disp_msglvl1 "Software check and install if not exist"
    for i in "$@"
    do
        disp_msglvl2 "Checking $i"
    	which $i
    	[ $? -ne 0 ] && $pkgmgr install $i -y
    done
}

pyChk(){
    which python3
    if [ $? -ne 0 ] ; then
        disp_msglvl2 "installaing python3"   
    	$pkgmgr install python3 -y
    fi
    which pip3  # On Redhat 8.10, had to install this again. Python3 install didn add this somehow.  
    if [ $? -ne 0 ] ; then
        disp_msglvl2 "installaing pip3"
            # From the previous logic, this is set when OS is ubuntu
            # To install pip3, there are some other steps in ububtu
            if [[ "$pkgmgr" == "apt" ]]; then
                sudo add-apt-repository universe -y
                sudo $pkgmgr update -y
                sudo $pkgmgr install python3-pip -y
            else  ## non ubuntu, mostly Redhat
                $pkgmgr install python3-pip -y
            fi
    fi
    disp_msglvl2 "Python necessary library installation"    
    # need to install library even if there is existing python3   
    pip3 install -U pyyaml
}    