#!/bin/bash

source config.ini # use /bin/bash for reading from the current directory
source jscommon.sh

swapOff() {

    print1 " Swap off"
    #echo "target hosts : $ALLHOST"

    for i in $ALLHOST
    do
        print2 "$i : check swap size"
        ssh $SSH_NO_BANNER $HOST  ${i} "free -h"
        print2 "$i : Swap off"
        ssh $SSH_NO_BANNER $HOST  ${i} "sudo swapoff -a"
        if [ $? -ne 0 ]; then
            logger_error "Failure to swap off $i"
        fi
        print2 "$i : check swap size"
        ssh $SSH_NO_BANNER $HOST  ${i} "free -h"
        print2 "$i : Remove swap configuration manually if there is. "
        ssh $SSH_NO_BANNER $HOST  ${i} "grep -i swap /etc/fstab"
        ssh $SSH_NO_BANNER $HOST  ${i} "sed -i 's/^\/swap/\#\/swap/' /etc/fstab"    # On fyre, default has swap setting. comment.    
        ssh $SSH_NO_BANNER $HOST  ${i} "grep -i swap /etc/fstab"
    done

}

swapOff