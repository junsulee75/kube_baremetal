# Installation output on Ubuntu 22.04

This is installation scripts output example to see how it works.   

## Contents

- [Installation output on Ubuntu 22.04](#installation-output-on-ubuntu-2204)
  - [Contents](#contents)
  - [Output](#output)


## Output

```
root@jskube221:~/kube_baremetal# ./setup.sh
Keystrokes ['1', '1', '8']


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
  [ 0 ] : .. 
  [ 1 ] : Kubenetes install *
  [ 2 ] : quit 


Auto pick : option=1, delay=0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=1, delay=0
prompt=0  parsing : swapOff.sh


###########################################################################################
Swap off
###########################################################################################


**********************************************
jskube221.fyre.ibm.com : check swap size
**********************************************

               total        used        free      shared  buff/cache   available
Mem:           7.8Gi       511Mi       6.3Gi       2.0Mi       995Mi       7.0Gi
Swap:           15Gi          0B        15Gi

**********************************************
jskube221.fyre.ibm.com : Swap off
**********************************************


**********************************************
jskube221.fyre.ibm.com : check swap size
**********************************************

               total        used        free      shared  buff/cache   available
Mem:           7.8Gi       503Mi       6.3Gi       2.0Mi       995Mi       7.0Gi
Swap:             0B          0B          0B

**********************************************
jskube221.fyre.ibm.com : Remove swap configuration manually if there is.
**********************************************

current : 
/swap.img	none	swap	sw	0	0
after change : 
#/swap.img	none	swap	sw	0	0

**********************************************
jskube222.fyre.ibm.com : check swap size
**********************************************

               total        used        free      shared  buff/cache   available
Mem:           7.8Gi       474Mi       7.0Gi       2.0Mi       330Mi       7.0Gi
Swap:           15Gi          0B        15Gi

**********************************************
jskube222.fyre.ibm.com : Swap off
**********************************************


**********************************************
jskube222.fyre.ibm.com : check swap size
**********************************************

               total        used        free      shared  buff/cache   available
Mem:           7.8Gi       470Mi       7.0Gi       2.0Mi       331Mi       7.1Gi
Swap:             0B          0B          0B

**********************************************
jskube222.fyre.ibm.com : Remove swap configuration manually if there is.
**********************************************

current : 
/swap.img	none	swap	sw	0	0
after change : 
#/swap.img	none	swap	sw	0	0

**********************************************
jskube223.fyre.ibm.com : check swap size
**********************************************

               total        used        free      shared  buff/cache   available
Mem:           7.8Gi       471Mi       7.0Gi       2.0Mi       330Mi       7.1Gi
Swap:           15Gi          0B        15Gi

**********************************************
jskube223.fyre.ibm.com : Swap off
**********************************************


**********************************************
jskube223.fyre.ibm.com : check swap size
**********************************************

               total        used        free      shared  buff/cache   available
Mem:           7.8Gi       467Mi       7.0Gi       2.0Mi       331Mi       7.1Gi
Swap:             0B          0B          0B

**********************************************
jskube223.fyre.ibm.com : Remove swap configuration manually if there is.
**********************************************

current : 
/swap.img	none	swap	sw	0	0
after change : 
#/swap.img	none	swap	sw	0	0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
Last Command : [1] swap off => swapOff.sh
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=8, delay=0
Keystrokes ['1', '2', '8']


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
  [ 0 ] : .. 
  [ 1 ] : Kubenetes install *
  [ 2 ] : quit 


Auto pick : option=1, delay=0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=2, delay=0
prompt=0  parsing : enablePortFwrd.sh


###########################################################################################
Enable port forwarding kernel OS setting. For permanent change, you should change /etc/sysctl.conf. Putting file /etc/sysctl.d/k8s.conf won't achieve it
###########################################################################################


**********************************************
jskube221.fyre.ibm.com : Live change only : sysctl -w net.ipv4.ip_forward=1
**********************************************

net.ipv4.ip_forward = 1
The current value           net.ipv4.ip_forward = 1
Value in /etc/sysctl.conf   net.ipv4.ip_forward = 0

**********************************************
jskube221.fyre.ibm.com : permanent change to /etc/sysctl.conf. /etc/sysctl.conf is the last file to run during next reboot
**********************************************

Value in /etc/sysctl.conf   net.ipv4.ip_forward = 1

**********************************************
jskube221.fyre.ibm.com : Put the configuration to /etc/sysctl.d/ for next reboots
**********************************************

net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube221.fyre.ibm.com : Apply sysctl params without reboot
**********************************************

* Applying /etc/sysctl.d/10-console-messages.conf ...
kernel.printk = 4 4 1 7
* Applying /etc/sysctl.d/10-ipv6-privacy.conf ...
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
* Applying /etc/sysctl.d/10-kernel-hardening.conf ...
kernel.kptr_restrict = 1
* Applying /etc/sysctl.d/10-magic-sysrq.conf ...
kernel.sysrq = 176
* Applying /etc/sysctl.d/10-network-security.conf ...
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.all.rp_filter = 0
* Applying /etc/sysctl.d/10-ptrace.conf ...
kernel.yama.ptrace_scope = 1
* Applying /etc/sysctl.d/10-zeropage.conf ...
vm.mmap_min_addr = 65536
* Applying /usr/lib/sysctl.d/50-default.conf ...
kernel.core_uses_pid = 1
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.default.accept_source_route = 0
sysctl: setting key "net.ipv4.conf.all.accept_source_route": Invalid argument
net.ipv4.conf.default.promote_secondaries = 1
sysctl: setting key "net.ipv4.conf.all.promote_secondaries": Invalid argument
net.ipv4.ping_group_range = 0 2147483647
net.core.default_qdisc = fq_codel
fs.protected_hardlinks = 1
fs.protected_symlinks = 1
fs.protected_regular = 1
fs.protected_fifos = 1
* Applying /usr/lib/sysctl.d/50-pid-max.conf ...
kernel.pid_max = 4194304
* Applying /usr/lib/sysctl.d/99-protect-links.conf ...
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
* Applying /etc/sysctl.d/99-sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
* Applying /etc/sysctl.d/k8s.conf ...
net.ipv4.ip_forward = 1
* Applying /etc/sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

**********************************************
jskube222.fyre.ibm.com : Live change only : sysctl -w net.ipv4.ip_forward=1
**********************************************

net.ipv4.ip_forward = 1
The current value           net.ipv4.ip_forward = 1
Value in /etc/sysctl.conf   net.ipv4.ip_forward = 0

**********************************************
jskube222.fyre.ibm.com : permanent change to /etc/sysctl.conf. /etc/sysctl.conf is the last file to run during next reboot
**********************************************

Value in /etc/sysctl.conf   net.ipv4.ip_forward = 1

**********************************************
jskube222.fyre.ibm.com : Put the configuration to /etc/sysctl.d/ for next reboots
**********************************************

net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube222.fyre.ibm.com : Apply sysctl params without reboot
**********************************************

* Applying /etc/sysctl.d/10-console-messages.conf ...
kernel.printk = 4 4 1 7
* Applying /etc/sysctl.d/10-ipv6-privacy.conf ...
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
* Applying /etc/sysctl.d/10-kernel-hardening.conf ...
kernel.kptr_restrict = 1
* Applying /etc/sysctl.d/10-magic-sysrq.conf ...
kernel.sysrq = 176
* Applying /etc/sysctl.d/10-network-security.conf ...
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.all.rp_filter = 0
* Applying /etc/sysctl.d/10-ptrace.conf ...
kernel.yama.ptrace_scope = 1
* Applying /etc/sysctl.d/10-zeropage.conf ...
vm.mmap_min_addr = 65536
* Applying /usr/lib/sysctl.d/50-default.conf ...
kernel.core_uses_pid = 1
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.default.promote_secondaries = 1
sysctl: setting key "net.ipv4.conf.all.accept_source_route": Invalid argument
sysctl: setting key "net.ipv4.conf.all.promote_secondaries": Invalid argument
net.ipv4.ping_group_range = 0 2147483647
net.core.default_qdisc = fq_codel
fs.protected_hardlinks = 1
fs.protected_symlinks = 1
fs.protected_regular = 1
fs.protected_fifos = 1
* Applying /usr/lib/sysctl.d/50-pid-max.conf ...
kernel.pid_max = 4194304
* Applying /usr/lib/sysctl.d/99-protect-links.conf ...
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
* Applying /etc/sysctl.d/99-sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
* Applying /etc/sysctl.d/k8s.conf ...
net.ipv4.ip_forward = 1
* Applying /etc/sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

**********************************************
jskube223.fyre.ibm.com : Live change only : sysctl -w net.ipv4.ip_forward=1
**********************************************

net.ipv4.ip_forward = 1
The current value           net.ipv4.ip_forward = 1
Value in /etc/sysctl.conf   net.ipv4.ip_forward = 0

**********************************************
jskube223.fyre.ibm.com : permanent change to /etc/sysctl.conf. /etc/sysctl.conf is the last file to run during next reboot
**********************************************

Value in /etc/sysctl.conf   net.ipv4.ip_forward = 1

**********************************************
jskube223.fyre.ibm.com : Put the configuration to /etc/sysctl.d/ for next reboots
**********************************************

net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube223.fyre.ibm.com : Apply sysctl params without reboot
**********************************************

* Applying /etc/sysctl.d/10-console-messages.conf ...
kernel.printk = 4 4 1 7
* Applying /etc/sysctl.d/10-ipv6-privacy.conf ...
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
* Applying /etc/sysctl.d/10-kernel-hardening.conf ...
kernel.kptr_restrict = 1
* Applying /etc/sysctl.d/10-magic-sysrq.conf ...
kernel.sysrq = 176
* Applying /etc/sysctl.d/10-network-security.conf ...
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.all.rp_filter = 0
* Applying /etc/sysctl.d/10-ptrace.conf ...
kernel.yama.ptrace_scope = 1
* Applying /etc/sysctl.d/10-zeropage.conf ...
vm.mmap_min_addr = 65536
* Applying /usr/lib/sysctl.d/50-default.conf ...
kernel.core_uses_pid = 1
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.default.promote_secondaries = 1
sysctl: setting key "net.ipv4.conf.all.accept_source_route": Invalid argument
sysctl: setting key "net.ipv4.conf.all.promote_secondaries": Invalid argument
net.ipv4.ping_group_range = 0 2147483647
net.core.default_qdisc = fq_codel
fs.protected_hardlinks = 1
fs.protected_symlinks = 1
fs.protected_regular = 1
fs.protected_fifos = 1
* Applying /usr/lib/sysctl.d/50-pid-max.conf ...
kernel.pid_max = 4194304
* Applying /usr/lib/sysctl.d/99-protect-links.conf ...
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
* Applying /etc/sysctl.d/99-sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
* Applying /etc/sysctl.d/k8s.conf ...
net.ipv4.ip_forward = 1
* Applying /etc/sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
Last Command : [2] enable port forward => enablePortFwrd.sh
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=8, delay=0
Keystrokes ['1', '3', '8']


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
  [ 0 ] : .. 
  [ 1 ] : Kubenetes install *
  [ 2 ] : quit 


Auto pick : option=1, delay=0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=3, delay=0
prompt=0  parsing : kernelModule.sh


###########################################################################################
Kernel module configuration for containerd
###########################################################################################


**********************************************
jskube221.fyre.ibm.com : Automatic load at boot
**********************************************

overlay
br_netfilter

**********************************************
jskube221.fyre.ibm.com Load Kernel Modules Manually
**********************************************


**********************************************
jskube221.fyre.ibm.com Verify if the Modules are Loaded:
**********************************************

overlay               151552  0
br_netfilter           32768  0
bridge                311296  1 br_netfilter

**********************************************
jskube221.fyre.ibm.com : iptables configuration
**********************************************

net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube221.fyre.ibm.com : Permanent configurations
**********************************************

net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube221.fyre.ibm.com : Refresh kernel parameters
**********************************************

* Applying /etc/sysctl.d/10-console-messages.conf ...
kernel.printk = 4 4 1 7
* Applying /etc/sysctl.d/10-ipv6-privacy.conf ...
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
* Applying /etc/sysctl.d/10-kernel-hardening.conf ...
kernel.kptr_restrict = 1
* Applying /etc/sysctl.d/10-magic-sysrq.conf ...
kernel.sysrq = 176
* Applying /etc/sysctl.d/10-network-security.conf ...
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.all.rp_filter = 0
* Applying /etc/sysctl.d/10-ptrace.conf ...
kernel.yama.ptrace_scope = 1
* Applying /etc/sysctl.d/10-zeropage.conf ...
vm.mmap_min_addr = 65536
* Applying /usr/lib/sysctl.d/50-default.conf ...
kernel.core_uses_pid = 1
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.default.promote_secondaries = 1
sysctl: setting key "net.ipv4.conf.all.accept_source_route": Invalid argument
sysctl: setting key "net.ipv4.conf.all.promote_secondaries": Invalid argument
net.ipv4.ping_group_range = 0 2147483647
net.core.default_qdisc = fq_codel
fs.protected_hardlinks = 1
fs.protected_symlinks = 1
fs.protected_regular = 1
fs.protected_fifos = 1
* Applying /usr/lib/sysctl.d/50-pid-max.conf ...
kernel.pid_max = 4194304
* Applying /usr/lib/sysctl.d/99-protect-links.conf ...
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
* Applying /etc/sysctl.d/99-sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
* Applying /etc/sysctl.d/k8s.conf ...
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
* Applying /etc/sysctl.d/kubernetes.conf ...
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
* Applying /etc/sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

**********************************************
jskube222.fyre.ibm.com : Automatic load at boot
**********************************************

overlay
br_netfilter

**********************************************
jskube222.fyre.ibm.com Load Kernel Modules Manually
**********************************************


**********************************************
jskube222.fyre.ibm.com Verify if the Modules are Loaded:
**********************************************

overlay               151552  0
br_netfilter           32768  0
bridge                311296  1 br_netfilter

**********************************************
jskube222.fyre.ibm.com : iptables configuration
**********************************************

net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube222.fyre.ibm.com : Permanent configurations
**********************************************

net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube222.fyre.ibm.com : Refresh kernel parameters
**********************************************

* Applying /etc/sysctl.d/10-console-messages.conf ...
kernel.printk = 4 4 1 7
* Applying /etc/sysctl.d/10-ipv6-privacy.conf ...
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
* Applying /etc/sysctl.d/10-kernel-hardening.conf ...
kernel.kptr_restrict = 1
* Applying /etc/sysctl.d/10-magic-sysrq.conf ...
kernel.sysrq = 176
* Applying /etc/sysctl.d/10-network-security.conf ...
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.all.rp_filter = 0
* Applying /etc/sysctl.d/10-ptrace.conf ...
kernel.yama.ptrace_scope = 1
* Applying /etc/sysctl.d/10-zeropage.conf ...
vm.mmap_min_addr = 65536
* Applying /usr/lib/sysctl.d/50-default.conf ...
kernel.core_uses_pid = 1
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.default.accept_source_route = 0
sysctl: setting key "net.ipv4.conf.all.accept_source_route": Invalid argument
net.ipv4.conf.default.promote_secondaries = 1
sysctl: setting key "net.ipv4.conf.all.promote_secondaries": Invalid argument
net.ipv4.ping_group_range = 0 2147483647
net.core.default_qdisc = fq_codel
fs.protected_hardlinks = 1
fs.protected_symlinks = 1
fs.protected_regular = 1
fs.protected_fifos = 1
* Applying /usr/lib/sysctl.d/50-pid-max.conf ...
kernel.pid_max = 4194304
* Applying /usr/lib/sysctl.d/99-protect-links.conf ...
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
* Applying /etc/sysctl.d/99-sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
* Applying /etc/sysctl.d/k8s.conf ...
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
* Applying /etc/sysctl.d/kubernetes.conf ...
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
* Applying /etc/sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

**********************************************
jskube223.fyre.ibm.com : Automatic load at boot
**********************************************

overlay
br_netfilter

**********************************************
jskube223.fyre.ibm.com Load Kernel Modules Manually
**********************************************


**********************************************
jskube223.fyre.ibm.com Verify if the Modules are Loaded:
**********************************************

overlay               151552  0
br_netfilter           32768  0
bridge                311296  1 br_netfilter

**********************************************
jskube223.fyre.ibm.com : iptables configuration
**********************************************

net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube223.fyre.ibm.com : Permanent configurations
**********************************************

net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

**********************************************
jskube223.fyre.ibm.com : Refresh kernel parameters
**********************************************

* Applying /etc/sysctl.d/10-console-messages.conf ...
kernel.printk = 4 4 1 7
* Applying /etc/sysctl.d/10-ipv6-privacy.conf ...
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
* Applying /etc/sysctl.d/10-kernel-hardening.conf ...
kernel.kptr_restrict = 1
* Applying /etc/sysctl.d/10-magic-sysrq.conf ...
kernel.sysrq = 176
* Applying /etc/sysctl.d/10-network-security.conf ...
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.all.rp_filter = 0
* Applying /etc/sysctl.d/10-ptrace.conf ...
kernel.yama.ptrace_scope = 1
* Applying /etc/sysctl.d/10-zeropage.conf ...
vm.mmap_min_addr = 65536
* Applying /usr/lib/sysctl.d/50-default.conf ...
kernel.core_uses_pid = 1
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.default.promote_secondaries = 1
sysctl: setting key "net.ipv4.conf.all.accept_source_route": Invalid argument
sysctl: setting key "net.ipv4.conf.all.promote_secondaries": Invalid argument
net.ipv4.ping_group_range = 0 2147483647
net.core.default_qdisc = fq_codel
fs.protected_hardlinks = 1
fs.protected_symlinks = 1
fs.protected_regular = 1
fs.protected_fifos = 1
* Applying /usr/lib/sysctl.d/50-pid-max.conf ...
kernel.pid_max = 4194304
* Applying /usr/lib/sysctl.d/99-protect-links.conf ...
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
* Applying /etc/sysctl.d/99-sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
* Applying /etc/sysctl.d/k8s.conf ...
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
* Applying /etc/sysctl.d/kubernetes.conf ...
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
* Applying /etc/sysctl.conf ...
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv4.ip_forward = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
Last Command : [3] Kernel module load configuration for containerd => kernelModule.sh
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=8, delay=0
Keystrokes ['1', '4', '8']


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
  [ 0 ] : .. 
  [ 1 ] : Kubenetes install *
  [ 2 ] : quit 


Auto pick : option=1, delay=0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=4, delay=0
prompt=0  parsing : containerd.sh


###########################################################################################
Install containerd (Reference : https://docs.docker.com/engine/install/ubuntu/
###########################################################################################


**********************************************
jskube221.fyre.ibm.com : Add Docker's official GPG key
**********************************************

Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libcurl4
The following packages will be upgraded:
  ca-certificates curl libcurl4
3 upgraded, 0 newly installed, 0 to remove and 52 not upgraded.
Need to get 645 kB of archives.
After this operation, 11.3 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ca-certificates all 20240203~22.04.1 [162 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.18 [194 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.18 [289 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 645 kB in 1s (893 kB/s)
(Reading database ... 115810 files and directories currently installed.)
Preparing to unpack .../ca-certificates_20240203~22.04.1_all.deb ...
Unpacking ca-certificates (20240203~22.04.1) over (20230311ubuntu0.22.04.1) ...
Preparing to unpack .../curl_7.81.0-1ubuntu1.18_amd64.deb ...
Unpacking curl (7.81.0-1ubuntu1.18) over (7.81.0-1ubuntu1.17) ...
Preparing to unpack .../libcurl4_7.81.0-1ubuntu1.18_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.18) over (7.81.0-1ubuntu1.17) ...
Setting up ca-certificates (20240203~22.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
Updating certificates in /etc/ssl/certs...
rehash: warning: skipping ca-certificates.crt,it does not contain exactly one certificate or CRL
rehash: warning: skipping local-ca.pem,it does not contain exactly one certificate or CRL
14 added, 5 removed; done.
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.18) ...
Setting up curl (7.81.0-1ubuntu1.18) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.8) ...
Processing triggers for ca-certificates (20240203~22.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.

Running kernel seems to be up-to-date.

Restarting services...

Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart networkd-dispatcher.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube222.fyre.ibm.com : Add Docker's official GPG key
**********************************************

Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:4 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:5 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [2,112 kB]
Get:6 http://us.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [363 kB]
Get:7 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [17.9 kB]
Get:8 http://us.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [67.7 kB]
Get:9 http://us.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.1 kB]
Get:10 http://us.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [388 B]
Get:11 http://us.archive.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1,896 kB]
Get:12 http://us.archive.ubuntu.com/ubuntu jammy-security/main Translation-en [305 kB]
Get:13 http://us.archive.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [13.3 kB]
Fetched 5,171 kB in 2s (2,656 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libcurl4
The following packages will be upgraded:
  ca-certificates curl libcurl4
3 upgraded, 0 newly installed, 0 to remove and 61 not upgraded.
Need to get 645 kB of archives.
After this operation, 11.3 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ca-certificates all 20240203~22.04.1 [162 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.18 [194 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.18 [289 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 645 kB in 1s (929 kB/s)
(Reading database ... 109024 files and directories currently installed.)
Preparing to unpack .../ca-certificates_20240203~22.04.1_all.deb ...
Unpacking ca-certificates (20240203~22.04.1) over (20230311ubuntu0.22.04.1) ...
Preparing to unpack .../curl_7.81.0-1ubuntu1.18_amd64.deb ...
Unpacking curl (7.81.0-1ubuntu1.18) over (7.81.0-1ubuntu1.17) ...
Preparing to unpack .../libcurl4_7.81.0-1ubuntu1.18_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.18) over (7.81.0-1ubuntu1.17) ...
Setting up ca-certificates (20240203~22.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
Updating certificates in /etc/ssl/certs...
rehash: warning: skipping ca-certificates.crt,it does not contain exactly one certificate or CRL
rehash: warning: skipping local-ca.pem,it does not contain exactly one certificate or CRL
14 added, 5 removed; done.
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.18) ...
Setting up curl (7.81.0-1ubuntu1.18) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.8) ...
Processing triggers for ca-certificates (20240203~22.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube223.fyre.ibm.com : Add Docker's official GPG key
**********************************************

Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:4 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:5 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [2,112 kB]
Get:6 http://us.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [363 kB]
Get:7 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [17.9 kB]
Get:8 http://us.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [67.7 kB]
Get:9 http://us.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.1 kB]
Get:10 http://us.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [388 B]
Get:11 http://us.archive.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1,896 kB]
Get:12 http://us.archive.ubuntu.com/ubuntu jammy-security/main Translation-en [305 kB]
Get:13 http://us.archive.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [13.3 kB]
Fetched 5,171 kB in 2s (2,597 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libcurl4
The following packages will be upgraded:
  ca-certificates curl libcurl4
3 upgraded, 0 newly installed, 0 to remove and 61 not upgraded.
Need to get 645 kB of archives.
After this operation, 11.3 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ca-certificates all 20240203~22.04.1 [162 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.18 [194 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.18 [289 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 645 kB in 1s (581 kB/s)
(Reading database ... 109024 files and directories currently installed.)
Preparing to unpack .../ca-certificates_20240203~22.04.1_all.deb ...
Unpacking ca-certificates (20240203~22.04.1) over (20230311ubuntu0.22.04.1) ...
Preparing to unpack .../curl_7.81.0-1ubuntu1.18_amd64.deb ...
Unpacking curl (7.81.0-1ubuntu1.18) over (7.81.0-1ubuntu1.17) ...
Preparing to unpack .../libcurl4_7.81.0-1ubuntu1.18_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.18) over (7.81.0-1ubuntu1.17) ...
Setting up ca-certificates (20240203~22.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
Updating certificates in /etc/ssl/certs...
rehash: warning: skipping ca-certificates.crt,it does not contain exactly one certificate or CRL
rehash: warning: skipping local-ca.pem,it does not contain exactly one certificate or CRL
14 added, 5 removed; done.
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.18) ...
Setting up curl (7.81.0-1ubuntu1.18) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.8) ...
Processing triggers for ca-certificates (20240203~22.04.1) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube221.fyre.ibm.com : Add the repository to Apt sources:
**********************************************

Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 https://download.docker.com/linux/ubuntu jammy InRelease [48.8 kB]
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:6 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages [40.7 kB]
Fetched 89.5 kB in 1s (99.8 kB/s)
Reading package lists...

**********************************************
jskube222.fyre.ibm.com : Add the repository to Apt sources:
**********************************************

Get:1 https://download.docker.com/linux/ubuntu jammy InRelease [48.8 kB]
Hit:2 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:6 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages [40.7 kB]
Fetched 89.5 kB in 1s (99.1 kB/s)
Reading package lists...

**********************************************
jskube223.fyre.ibm.com : Add the repository to Apt sources:
**********************************************

Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 https://download.docker.com/linux/ubuntu jammy InRelease [48.8 kB]
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:6 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages [40.7 kB]
Fetched 89.5 kB in 1s (85.1 kB/s)
Reading package lists...

**********************************************
jskube221.fyre.ibm.com : Install containerd
**********************************************

Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  containerd.io
0 upgraded, 1 newly installed, 0 to remove and 52 not upgraded.
Need to get 29.5 MB of archives.
After this operation, 121 MB of additional disk space will be used.
Get:1 https://download.docker.com/linux/ubuntu jammy/stable amd64 containerd.io amd64 1.7.22-1 [29.5 MB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 29.5 MB in 1s (32.7 MB/s)
Selecting previously unselected package containerd.io.
(Reading database ... 115819 files and directories currently installed.)
Preparing to unpack .../containerd.io_1.7.22-1_amd64.deb ...
Unpacking containerd.io (1.7.22-1) ...
Setting up containerd.io (1.7.22-1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Processing triggers for man-db (2.10.2-1) ...

Running kernel seems to be up-to-date.

Restarting services...

Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart networkd-dispatcher.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube222.fyre.ibm.com : Install containerd
**********************************************

Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  containerd.io
0 upgraded, 1 newly installed, 0 to remove and 61 not upgraded.
Need to get 29.5 MB of archives.
After this operation, 121 MB of additional disk space will be used.
Get:1 https://download.docker.com/linux/ubuntu jammy/stable amd64 containerd.io amd64 1.7.22-1 [29.5 MB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 29.5 MB in 1s (37.4 MB/s)
Selecting previously unselected package containerd.io.
(Reading database ... 109033 files and directories currently installed.)
Preparing to unpack .../containerd.io_1.7.22-1_amd64.deb ...
Unpacking containerd.io (1.7.22-1) ...
Setting up containerd.io (1.7.22-1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Processing triggers for man-db (2.10.2-1) ...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube223.fyre.ibm.com : Install containerd
**********************************************

Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  containerd.io
0 upgraded, 1 newly installed, 0 to remove and 61 not upgraded.
Need to get 29.5 MB of archives.
After this operation, 121 MB of additional disk space will be used.
Get:1 https://download.docker.com/linux/ubuntu jammy/stable amd64 containerd.io amd64 1.7.22-1 [29.5 MB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 29.5 MB in 1s (34.7 MB/s)
Selecting previously unselected package containerd.io.
(Reading database ... 109033 files and directories currently installed.)
Preparing to unpack .../containerd.io_1.7.22-1_amd64.deb ...
Unpacking containerd.io (1.7.22-1) ...
Setting up containerd.io (1.7.22-1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Processing triggers for man-db (2.10.2-1) ...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.


###########################################################################################
Configure cgroup for containerd
###########################################################################################


**********************************************
jskube221.fyre.ibm.com : Dump 'containerd config default' to /etc/containerd/config.toml
**********************************************


**********************************************
jskube221.fyre.ibm.com : Cgroup to use systemd
**********************************************


Current SystemdCgroup value : 
            SystemdCgroup = false
New SystemdCgroup value : 
            SystemdCgroup = true

Current sandbox_image value : 
    sandbox_image = "registry.k8s.io/pause:3.8"
New sandbox_image value : 
    sandbox_image = "registry.k8s.io/pause:3.9"

**********************************************
jskube222.fyre.ibm.com : Dump 'containerd config default' to /etc/containerd/config.toml
**********************************************


**********************************************
jskube222.fyre.ibm.com : Cgroup to use systemd
**********************************************


Current SystemdCgroup value : 
            SystemdCgroup = false
New SystemdCgroup value : 
            SystemdCgroup = true

Current sandbox_image value : 
    sandbox_image = "registry.k8s.io/pause:3.8"
New sandbox_image value : 
    sandbox_image = "registry.k8s.io/pause:3.9"

**********************************************
jskube223.fyre.ibm.com : Dump 'containerd config default' to /etc/containerd/config.toml
**********************************************


**********************************************
jskube223.fyre.ibm.com : Cgroup to use systemd
**********************************************


Current SystemdCgroup value : 
            SystemdCgroup = false
New SystemdCgroup value : 
            SystemdCgroup = true

Current sandbox_image value : 
    sandbox_image = "registry.k8s.io/pause:3.8"
New sandbox_image value : 
    sandbox_image = "registry.k8s.io/pause:3.9"

**********************************************
jskube221.fyre.ibm.com : Restart systemd
**********************************************

● containerd.service - containerd container runtime
     Loaded: loaded (/lib/systemd/system/containerd.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2024-10-26 08:49:27 PDT; 225ms ago
       Docs: https://containerd.io
    Process: 10368 ExecStartPre=/sbin/modprobe overlay (code=exited, status=0/SUCCESS)
   Main PID: 10369 (containerd)
      Tasks: 9
     Memory: 13.9M
        CPU: 140ms
     CGroup: /system.slice/containerd.service
             └─10369 /usr/bin/containerd

Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.687446786-07:00" level=info msg="Start subscribing containerd event"
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.687468966-07:00" level=info msg=serving... address=/run/containerd/containerd.sock.ttrpc
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.687604853-07:00" level=info msg="Start recovering state"
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.687648043-07:00" level=info msg=serving... address=/run/containerd/containerd.sock
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.687794431-07:00" level=info msg="Start event monitor"
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.688058487-07:00" level=info msg="Start snapshots syncer"
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.688093286-07:00" level=info msg="Start cni network conf syncer for default"
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.688113016-07:00" level=info msg="Start streaming server"
Oct 26 08:49:27 jskube221.fyre.ibm.com systemd[1]: Started containerd container runtime.
Oct 26 08:49:27 jskube221.fyre.ibm.com containerd[10369]: time="2024-10-26T08:49:27.689576864-07:00" level=info msg="containerd successfully booted in 0.073596s"

**********************************************
jskube222.fyre.ibm.com : Restart systemd
**********************************************

● containerd.service - containerd container runtime
     Loaded: loaded (/lib/systemd/system/containerd.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2024-10-26 08:49:28 PDT; 230ms ago
       Docs: https://containerd.io
    Process: 7526 ExecStartPre=/sbin/modprobe overlay (code=exited, status=0/SUCCESS)
   Main PID: 7527 (containerd)
      Tasks: 9
     Memory: 13.6M
        CPU: 107ms
     CGroup: /system.slice/containerd.service
             └─7527 /usr/bin/containerd

Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.837505406-07:00" level=info msg="Start subscribing containerd event"
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.837607615-07:00" level=info msg="Start recovering state"
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.837784626-07:00" level=info msg="Start event monitor"
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.837827965-07:00" level=info msg="Start snapshots syncer"
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.837848086-07:00" level=info msg="Start cni network conf syncer for default"
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.837905525-07:00" level=info msg="Start streaming server"
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.838377736-07:00" level=info msg=serving... address=/run/containerd/containerd.sock.ttrpc
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.838602336-07:00" level=info msg=serving... address=/run/containerd/containerd.sock
Oct 26 08:49:28 jskube222.fyre.ibm.com containerd[7527]: time="2024-10-26T08:49:28.838860866-07:00" level=info msg="containerd successfully booted in 0.057514s"
Oct 26 08:49:28 jskube222.fyre.ibm.com systemd[1]: Started containerd container runtime.

**********************************************
jskube223.fyre.ibm.com : Restart systemd
**********************************************

● containerd.service - containerd container runtime
     Loaded: loaded (/lib/systemd/system/containerd.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2024-10-26 08:49:30 PDT; 237ms ago
       Docs: https://containerd.io
    Process: 7482 ExecStartPre=/sbin/modprobe overlay (code=exited, status=0/SUCCESS)
   Main PID: 7483 (containerd)
      Tasks: 9
     Memory: 14.1M
        CPU: 166ms
     CGroup: /system.slice/containerd.service
             └─7483 /usr/bin/containerd

Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.091152745-07:00" level=info msg="Start subscribing containerd event"
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.091282862-07:00" level=info msg="Start recovering state"
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.091477999-07:00" level=info msg="Start event monitor"
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.091550797-07:00" level=info msg="Start snapshots syncer"
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.091584946-07:00" level=info msg="Start cni network conf syncer for default"
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.091623626-07:00" level=info msg="Start streaming server"
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.092686195-07:00" level=info msg=serving... address=/run/containerd/containerd.sock.ttrpc
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.092896621-07:00" level=info msg=serving... address=/run/containerd/containerd.sock
Oct 26 08:49:30 jskube223.fyre.ibm.com systemd[1]: Started containerd container runtime.
Oct 26 08:49:30 jskube223.fyre.ibm.com containerd[7483]: time="2024-10-26T08:49:30.097266394-07:00" level=info msg="containerd successfully booted in 0.077284s"


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
Last Command : [4] Install containerd => containerd.sh
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=8, delay=0
Keystrokes ['1', '5', '8']


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
  [ 0 ] : .. 
  [ 1 ] : Kubenetes install *
  [ 2 ] : quit 


Auto pick : option=1, delay=0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=5, delay=0
prompt=0  parsing : installKube.sh


###########################################################################################
Install kubeadm, kubelet and kubectl (Reference : https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/ )
###########################################################################################


**********************************************
jskube221.fyre.ibm.com : Add GPG key
**********************************************

Hit:1 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:2 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
ca-certificates is already the newest version (20240203~22.04.1).
ca-certificates set to manually installed.
curl is already the newest version (7.81.0-1ubuntu1.18).
curl set to manually installed.
gpg is already the newest version (2.2.27-3ubuntu2.1).
gpg set to manually installed.
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 52 not upgraded.
Need to get 1,510 B of archives.
After this operation, 170 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 apt-transport-https all 2.4.13 [1,510 B]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 1,510 B in 0s (9,456 B/s)
Selecting previously unselected package apt-transport-https.
(Reading database ... 115835 files and directories currently installed.)
Preparing to unpack .../apt-transport-https_2.4.13_all.deb ...
Unpacking apt-transport-https (2.4.13) ...
Setting up apt-transport-https (2.4.13) ...

Running kernel seems to be up-to-date.

Restarting services...

Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart networkd-dispatcher.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube222.fyre.ibm.com : Add GPG key
**********************************************

Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
ca-certificates is already the newest version (20240203~22.04.1).
ca-certificates set to manually installed.
curl is already the newest version (7.81.0-1ubuntu1.18).
curl set to manually installed.
gpg is already the newest version (2.2.27-3ubuntu2.1).
gpg set to manually installed.
The following additional packages will be installed:
  apt-utils libapt-pkg6.0
Suggested packages:
  apt-doc aptitude | synaptic | wajig dpkg-dev
The following packages will be upgraded:
  apt apt-utils libapt-pkg6.0
3 upgraded, 0 newly installed, 0 to remove and 58 not upgraded.
Need to get 2,486 kB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapt-pkg6.0 amd64 2.4.13 [912 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apt amd64 2.4.13 [1,363 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apt-utils amd64 2.4.13 [211 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 2,486 kB in 1s (3,020 kB/s)
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../libapt-pkg6.0_2.4.13_amd64.deb ...
Unpacking libapt-pkg6.0:amd64 (2.4.13) over (2.4.12) ...
Setting up libapt-pkg6.0:amd64 (2.4.13) ...
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../archives/apt_2.4.13_amd64.deb ...
Unpacking apt (2.4.13) over (2.4.12) ...
Setting up apt (2.4.13) ...
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../apt-utils_2.4.13_amd64.deb ...
Unpacking apt-utils (2.4.13) over (2.4.12) ...
Setting up apt-utils (2.4.13) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.8) ...

Running kernel seems to be up-to-date.

Services to be restarted:
 systemctl restart packagekit.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube223.fyre.ibm.com : Add GPG key
**********************************************

Hit:1 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
ca-certificates is already the newest version (20240203~22.04.1).
ca-certificates set to manually installed.
curl is already the newest version (7.81.0-1ubuntu1.18).
curl set to manually installed.
gpg is already the newest version (2.2.27-3ubuntu2.1).
gpg set to manually installed.
The following additional packages will be installed:
  apt-utils libapt-pkg6.0
Suggested packages:
  apt-doc aptitude | synaptic | wajig dpkg-dev
The following packages will be upgraded:
  apt apt-utils libapt-pkg6.0
3 upgraded, 0 newly installed, 0 to remove and 58 not upgraded.
Need to get 2,486 kB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapt-pkg6.0 amd64 2.4.13 [912 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apt amd64 2.4.13 [1,363 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apt-utils amd64 2.4.13 [211 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 2,486 kB in 1s (3,014 kB/s)
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../libapt-pkg6.0_2.4.13_amd64.deb ...
Unpacking libapt-pkg6.0:amd64 (2.4.13) over (2.4.12) ...
Setting up libapt-pkg6.0:amd64 (2.4.13) ...
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../archives/apt_2.4.13_amd64.deb ...
Unpacking apt (2.4.13) over (2.4.12) ...
Setting up apt (2.4.13) ...
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../apt-utils_2.4.13_amd64.deb ...
Unpacking apt-utils (2.4.13) over (2.4.12) ...
Setting up apt-utils (2.4.13) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.8) ...

Running kernel seems to be up-to-date.

Services to be restarted:
 systemctl restart packagekit.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.

**********************************************
jskube221.fyre.ibm.com : Add the kubenetes repository to Apt sources:
**********************************************

deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /
Hit:1 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Get:2 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  InRelease [1,186 B]
Hit:6 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:7 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  Packages [6,097 B]
Fetched 7,283 B in 1s (6,387 B/s)
Reading package lists...

**********************************************
jskube222.fyre.ibm.com : Add the kubenetes repository to Apt sources:
**********************************************

deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /
Hit:2 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Get:1 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  InRelease [1,186 B]
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Get:6 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  Packages [6,097 B]
Hit:7 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Fetched 7,283 B in 1s (6,636 B/s)
Reading package lists...

**********************************************
jskube223.fyre.ibm.com : Add the kubenetes repository to Apt sources:
**********************************************

deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /
Hit:2 https://download.docker.com/linux/ubuntu jammy InRelease
Hit:3 http://us.archive.ubuntu.com/ubuntu jammy InRelease
Hit:4 http://us.archive.ubuntu.com/ubuntu jammy-updates InRelease
Get:1 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  InRelease [1,186 B]
Hit:5 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:6 http://us.archive.ubuntu.com/ubuntu jammy-security InRelease
Get:7 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  Packages [6,097 B]
Fetched 7,283 B in 1s (7,437 B/s)
Reading package lists...

**********************************************
jskube221.fyre.ibm.com : Install kubelet kubeadm kubectl
**********************************************

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  conntrack cri-tools kubernetes-cni
The following NEW packages will be installed:
  conntrack cri-tools kubeadm kubectl kubelet kubernetes-cni
0 upgraded, 6 newly installed, 0 to remove and 52 not upgraded.
Need to get 87.4 MB of archives.
After this operation, 314 MB of additional disk space will be used.
Get:4 http://us.archive.ubuntu.com/ubuntu jammy/main amd64 conntrack amd64 1:1.4.6-2build2 [33.5 kB]
Get:1 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  cri-tools 1.31.1-1.1 [15.7 MB]
Get:2 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubeadm 1.31.2-1.1 [11.4 MB]
Get:3 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubectl 1.31.2-1.1 [11.2 MB]
Get:5 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubernetes-cni 1.5.1-1.1 [33.9 MB]
Get:6 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubelet 1.31.2-1.1 [15.2 MB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 87.4 MB in 2s (48.9 MB/s)
Selecting previously unselected package conntrack.
(Reading database ... 115839 files and directories currently installed.)
Preparing to unpack .../0-conntrack_1%3a1.4.6-2build2_amd64.deb ...
Unpacking conntrack (1:1.4.6-2build2) ...
Selecting previously unselected package cri-tools.
Preparing to unpack .../1-cri-tools_1.31.1-1.1_amd64.deb ...
Unpacking cri-tools (1.31.1-1.1) ...
Selecting previously unselected package kubeadm.
Preparing to unpack .../2-kubeadm_1.31.2-1.1_amd64.deb ...
Unpacking kubeadm (1.31.2-1.1) ...
Selecting previously unselected package kubectl.
Preparing to unpack .../3-kubectl_1.31.2-1.1_amd64.deb ...
Unpacking kubectl (1.31.2-1.1) ...
Selecting previously unselected package kubernetes-cni.
Preparing to unpack .../4-kubernetes-cni_1.5.1-1.1_amd64.deb ...
Unpacking kubernetes-cni (1.5.1-1.1) ...
Selecting previously unselected package kubelet.
Preparing to unpack .../5-kubelet_1.31.2-1.1_amd64.deb ...
Unpacking kubelet (1.31.2-1.1) ...
Setting up conntrack (1:1.4.6-2build2) ...
Setting up kubectl (1.31.2-1.1) ...
Setting up cri-tools (1.31.1-1.1) ...
Setting up kubernetes-cni (1.5.1-1.1) ...
Setting up kubeadm (1.31.2-1.1) ...
Setting up kubelet (1.31.2-1.1) ...
Processing triggers for man-db (2.10.2-1) ...

Running kernel seems to be up-to-date.

Restarting services...

Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart networkd-dispatcher.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
kubelet set on hold.
kubeadm set on hold.
kubectl set on hold.

**********************************************
jskube222.fyre.ibm.com : Install kubelet kubeadm kubectl
**********************************************

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  conntrack cri-tools kubernetes-cni
The following NEW packages will be installed:
  conntrack cri-tools kubeadm kubectl kubelet kubernetes-cni
0 upgraded, 6 newly installed, 0 to remove and 58 not upgraded.
Need to get 87.4 MB of archives.
After this operation, 314 MB of additional disk space will be used.
Get:2 http://us.archive.ubuntu.com/ubuntu jammy/main amd64 conntrack amd64 1:1.4.6-2build2 [33.5 kB]
Get:1 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  cri-tools 1.31.1-1.1 [15.7 MB]
Get:3 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubeadm 1.31.2-1.1 [11.4 MB]
Get:4 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubectl 1.31.2-1.1 [11.2 MB]
Get:5 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubernetes-cni 1.5.1-1.1 [33.9 MB]
Get:6 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubelet 1.31.2-1.1 [15.2 MB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 87.4 MB in 2s (51.6 MB/s)
Selecting previously unselected package conntrack.
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../0-conntrack_1%3a1.4.6-2build2_amd64.deb ...
Unpacking conntrack (1:1.4.6-2build2) ...
Selecting previously unselected package cri-tools.
Preparing to unpack .../1-cri-tools_1.31.1-1.1_amd64.deb ...
Unpacking cri-tools (1.31.1-1.1) ...
Selecting previously unselected package kubeadm.
Preparing to unpack .../2-kubeadm_1.31.2-1.1_amd64.deb ...
Unpacking kubeadm (1.31.2-1.1) ...
Selecting previously unselected package kubectl.
Preparing to unpack .../3-kubectl_1.31.2-1.1_amd64.deb ...
Unpacking kubectl (1.31.2-1.1) ...
Selecting previously unselected package kubernetes-cni.
Preparing to unpack .../4-kubernetes-cni_1.5.1-1.1_amd64.deb ...
Unpacking kubernetes-cni (1.5.1-1.1) ...
Selecting previously unselected package kubelet.
Preparing to unpack .../5-kubelet_1.31.2-1.1_amd64.deb ...
Unpacking kubelet (1.31.2-1.1) ...
Setting up conntrack (1:1.4.6-2build2) ...
Setting up kubectl (1.31.2-1.1) ...
Setting up cri-tools (1.31.1-1.1) ...
Setting up kubernetes-cni (1.5.1-1.1) ...
Setting up kubeadm (1.31.2-1.1) ...
Setting up kubelet (1.31.2-1.1) ...
Processing triggers for man-db (2.10.2-1) ...

Running kernel seems to be up-to-date.

Services to be restarted:
 systemctl restart packagekit.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
kubelet set on hold.
kubeadm set on hold.
kubectl set on hold.

**********************************************
jskube223.fyre.ibm.com : Install kubelet kubeadm kubectl
**********************************************

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  conntrack cri-tools kubernetes-cni
The following NEW packages will be installed:
  conntrack cri-tools kubeadm kubectl kubelet kubernetes-cni
0 upgraded, 6 newly installed, 0 to remove and 58 not upgraded.
Need to get 87.4 MB of archives.
After this operation, 314 MB of additional disk space will be used.
Get:3 http://us.archive.ubuntu.com/ubuntu jammy/main amd64 conntrack amd64 1:1.4.6-2build2 [33.5 kB]
Get:1 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  cri-tools 1.31.1-1.1 [15.7 MB]
Get:2 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubeadm 1.31.2-1.1 [11.4 MB]
Get:4 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubectl 1.31.2-1.1 [11.2 MB]
Get:5 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubernetes-cni 1.5.1-1.1 [33.9 MB]
Get:6 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.31/deb  kubelet 1.31.2-1.1 [15.2 MB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 87.4 MB in 2s (44.2 MB/s)
Selecting previously unselected package conntrack.
(Reading database ... 109049 files and directories currently installed.)
Preparing to unpack .../0-conntrack_1%3a1.4.6-2build2_amd64.deb ...
Unpacking conntrack (1:1.4.6-2build2) ...
Selecting previously unselected package cri-tools.
Preparing to unpack .../1-cri-tools_1.31.1-1.1_amd64.deb ...
Unpacking cri-tools (1.31.1-1.1) ...
Selecting previously unselected package kubeadm.
Preparing to unpack .../2-kubeadm_1.31.2-1.1_amd64.deb ...
Unpacking kubeadm (1.31.2-1.1) ...
Selecting previously unselected package kubectl.
Preparing to unpack .../3-kubectl_1.31.2-1.1_amd64.deb ...
Unpacking kubectl (1.31.2-1.1) ...
Selecting previously unselected package kubernetes-cni.
Preparing to unpack .../4-kubernetes-cni_1.5.1-1.1_amd64.deb ...
Unpacking kubernetes-cni (1.5.1-1.1) ...
Selecting previously unselected package kubelet.
Preparing to unpack .../5-kubelet_1.31.2-1.1_amd64.deb ...
Unpacking kubelet (1.31.2-1.1) ...
Setting up conntrack (1:1.4.6-2build2) ...
Setting up kubectl (1.31.2-1.1) ...
Setting up cri-tools (1.31.1-1.1) ...
Setting up kubernetes-cni (1.5.1-1.1) ...
Setting up kubeadm (1.31.2-1.1) ...
Setting up kubelet (1.31.2-1.1) ...
Processing triggers for man-db (2.10.2-1) ...

Running kernel seems to be up-to-date.

Services to be restarted:
 systemctl restart packagekit.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
kubelet set on hold.
kubeadm set on hold.
kubectl set on hold.


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
Last Command : [5] Install kubeadm, kubelet and kubectl => installKube.sh
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=8, delay=0
Keystrokes ['1', '6', '8']


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
  [ 0 ] : .. 
  [ 1 ] : Kubenetes install *
  [ 2 ] : quit 


Auto pick : option=1, delay=0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=6, delay=0
prompt=0  parsing : confKube.sh
/usr/bin/kubeadm
master ip is : 10.11.3.240


###########################################################################################
Initializing the 1st master node
###########################################################################################

[init] Using Kubernetes version: v1.31.2
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action beforehand using 'kubeadm config images pull'
W1026 08:51:04.335750   11705 checks.go:846] detected that the sandbox image "registry.k8s.io/pause:3.9" of the container runtime is inconsistent with that used by kubeadm.It is recommended to use "registry.k8s.io/pause:3.10" as the CRI sandbox image.
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [jskube221.fyre.ibm.com kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 10.11.3.240]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [jskube221.fyre.ibm.com localhost] and IPs [10.11.3.240 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [jskube221.fyre.ibm.com localhost] and IPs [10.11.3.240 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "super-admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
[control-plane] Creating static Pod manifest for "kube-scheduler"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests"
[kubelet-check] Waiting for a healthy kubelet at http://127.0.0.1:10248/healthz. This can take up to 4m0s
[kubelet-check] The kubelet is healthy after 1.002935572s
[api-check] Waiting for a healthy API server. This can take up to 4m0s
[api-check] The API server is healthy after 11.502101482s
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Skipping phase. Please see --upload-certs
[mark-control-plane] Marking the node jskube221.fyre.ibm.com as control-plane by adding the labels: [node-role.kubernetes.io/control-plane node.kubernetes.io/exclude-from-external-load-balancers]
[mark-control-plane] Marking the node jskube221.fyre.ibm.com as control-plane by adding the taints [node-role.kubernetes.io/control-plane:NoSchedule]
[bootstrap-token] Using token: wbdu9e.364t4jaaasb26mv5
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] Configured RBAC rules to allow Node Bootstrap tokens to get nodes
[bootstrap-token] Configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] Configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] Configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 10.11.3.240:6443 --token wbdu9e.364t4jaaasb26mv5 \
	--discovery-token-ca-cert-hash sha256:f87cb20ed78d42dd0c37d94ca4c72472662b08fa9b50b598567e1847271b1f8b 
success !!! 

**********************************************
jskube222.fyre.ibm.com : Join workers
**********************************************

[preflight] Running pre-flight checks
[preflight] Reading configuration from the cluster...
[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Starting the kubelet
[kubelet-check] Waiting for a healthy kubelet at http://127.0.0.1:10248/healthz. This can take up to 4m0s
[kubelet-check] The kubelet is healthy after 503.193423ms
[kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap

This node has joined the cluster:
* Certificate signing request was sent to apiserver and a response was received.
* The Kubelet was informed of the new secure connection details.

Run 'kubectl get nodes' on the control-plane to see this node join the cluster.


**********************************************
jskube223.fyre.ibm.com : Join workers
**********************************************

[preflight] Running pre-flight checks
[preflight] Reading configuration from the cluster...
[preflight] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Starting the kubelet
[kubelet-check] Waiting for a healthy kubelet at http://127.0.0.1:10248/healthz. This can take up to 4m0s
[kubelet-check] The kubelet is healthy after 1.002098832s
[kubelet-start] Waiting for the kubelet to perform the TLS Bootstrap

This node has joined the cluster:
* Certificate signing request was sent to apiserver and a response was received.
* The Kubelet was informed of the new secure connection details.

Run 'kubectl get nodes' on the control-plane to see this node join the cluster.


**********************************************
/var/lib/kubelet/kubeadm-flags.env
**********************************************

KUBELET_KUBEADM_ARGS="--container-runtime-endpoint=unix:///var/run/containerd/containerd.sock --pod-infra-container-image=registry.k8s.io/pause:3.10"

**********************************************
cluster-info
**********************************************

Kubernetes control plane is running at https://10.11.3.240:6443
CoreDNS is running at https://10.11.3.240:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

**********************************************
nodes
**********************************************

NAME                     STATUS     ROLES           AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION       CONTAINER-RUNTIME
jskube221.fyre.ibm.com   NotReady   control-plane   16s   v1.31.2   10.11.3.240   <none>        Ubuntu 22.04.4 LTS   5.15.0-118-generic   containerd://1.7.22
jskube222.fyre.ibm.com   NotReady   <none>          3s    v1.31.2   10.11.4.206   <none>        Ubuntu 22.04.4 LTS   5.15.0-118-generic   containerd://1.7.22
jskube223.fyre.ibm.com   NotReady   <none>          1s    v1.31.2   10.11.6.158   <none>        Ubuntu 22.04.4 LTS   5.15.0-118-generic   containerd://1.7.22


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
Last Command : [6] Initialize master and join workers => confKube.sh
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=8, delay=0
Keystrokes ['1', '7', '8']


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
  [ 0 ] : .. 
  [ 1 ] : Kubenetes install *
  [ 2 ] : quit 


Auto pick : option=1, delay=0


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=7, delay=0
prompt=0  parsing : nwAddon.sh flannel


###########################################################################################
Adding flannel for network
###########################################################################################


**********************************************
Downloading yaml file to /tmp/kube-flannel.yml
**********************************************

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  4406  100  4406    0     0   4709      0 --:--:-- --:--:-- --:--:--     0

**********************************************
Installing flannel
**********************************************

namespace/kube-flannel created
serviceaccount/flannel created
clusterrole.rbac.authorization.k8s.io/flannel created
clusterrolebinding.rbac.authorization.k8s.io/flannel created
configmap/kube-flannel-cfg created
daemonset.apps/kube-flannel-ds created

**********************************************
Monitoring the pods status
**********************************************

kube-flannel-ds-cflh7   0/1     Init:0/2   0          0s
kube-flannel-ds-fspdl   0/1     Init:0/2   0          0s
kube-flannel-ds-phqqv   0/1     Init:0/2   0          0s
Running [kubectl get pods -n kube-flannel | grep kube-flannel] to watch for [kube-flannel-ds.*1/1.*Running] - interval 5 , count = 0 s
kube-flannel-ds-cflh7   0/1     Init:0/2   0          5s
kube-flannel-ds-fspdl   0/1     Init:1/2   0          5s
kube-flannel-ds-phqqv   0/1     Init:0/2   0          5s
Running [kubectl get pods -n kube-flannel | grep kube-flannel] to watch for [kube-flannel-ds.*1/1.*Running] - interval 5 , count = 5 s
kube-flannel-ds-cflh7   0/1     Init:1/2   0          10s
kube-flannel-ds-fspdl   0/1     Init:1/2   0          10s
kube-flannel-ds-phqqv   0/1     Init:1/2   0          10s
Running [kubectl get pods -n kube-flannel | grep kube-flannel] to watch for [kube-flannel-ds.*1/1.*Running] - interval 5 , count = 10 s
kube-flannel-ds-cflh7   0/1     Init:1/2   0          16s
kube-flannel-ds-fspdl   1/1     Running    0          16s
kube-flannel-ds-phqqv   1/1     Running    0          16s
Necessary pods become 'Running'. Seems almost done. Let's wait 10 more seconds and check things.

**********************************************
Node after network addon. Check if Ready status
**********************************************

NAME                     STATUS   ROLES           AGE   VERSION
jskube221.fyre.ibm.com   Ready    control-plane   45s   v1.31.2
jskube222.fyre.ibm.com   Ready    <none>          32s   v1.31.2
jskube223.fyre.ibm.com   Ready    <none>          30s   v1.31.2
NAMESPACE      NAME                                             READY   STATUS    RESTARTS   AGE
kube-flannel   kube-flannel-ds-cflh7                            1/1     Running   0          26s
kube-flannel   kube-flannel-ds-fspdl                            1/1     Running   0          26s
kube-flannel   kube-flannel-ds-phqqv                            1/1     Running   0          26s
kube-system    coredns-7c65d6cfc9-9szsh                         1/1     Running   0          35s
kube-system    coredns-7c65d6cfc9-jhlq9                         1/1     Running   0          35s
kube-system    etcd-jskube221.fyre.ibm.com                      1/1     Running   0          42s
kube-system    kube-apiserver-jskube221.fyre.ibm.com            1/1     Running   0          43s
kube-system    kube-controller-manager-jskube221.fyre.ibm.com   1/1     Running   0          40s
kube-system    kube-proxy-m98l7                                 1/1     Running   0          35s
kube-system    kube-proxy-smm4c                                 1/1     Running   0          30s
kube-system    kube-proxy-sn78v                                 1/1     Running   0          32s
kube-system    kube-scheduler-jskube221.fyre.ibm.com            1/1     Running   0          42s
run the command and check kubenetes resource : export KUBECONFIG=/etc/kubernetes/admin.conf 


YAML [1.0.0] : menu.yaml , Current working directory = /root/kube_baremetal
Note : Kebenetes installation
Last Command : [7] Install network addon => nwAddon.sh flannel
  [ 0 ] : .. 
  [ 1 ] : swap off 
  [ 2 ] : enable port forward 
  [ 3 ] : Kernel module load configuration for containerd 
  [ 4 ] : Install containerd 
  [ 5 ] : Install kubeadm, kubelet and kubectl 
  [ 6 ] : Initialize master and join workers 
  [ 7 ] : Install network addon 
  [ 8 ] : quit 


Auto pick : option=8, delay=0
```