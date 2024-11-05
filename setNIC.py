#!/usr/bin/python3

'''
To modifify flannel yaml file to give master node internal interface name.

example)

apiVersion: apps/v1
kind: DaemonSet
metadata:
  labels:
    app: flannel
    k8s-app: flannel
    tier: node
  name: kube-flannel-ds
...
      containers:
      - args:
        - --ip-masq
        - --kube-subnet-mgr
        - --iface=eth0     <======

By default, this is not set, then flannel would find the interface. 
But no guarantee for finding the correct one. 

This program will help to create new modifiled yaml file.  

Jun Su Lee 
'''

import sys
import re
import glob
import yaml
from pathlib import Path

verbose = False

def usage():
  #if len(sys.argv) != 2:   
  if len(sys.argv) not in [3, 4]:   
    print("Usage: " + sys.argv[0] + " <input file name> <inteface name>  [-v|--verbose]")
    sys.exit(-1)
    #return()  # need ? 

def literal_str_presenter(dumper, data):
    """Represent multi-line strings in block style."""
    if '\n' in data:  # Checks if the string has multiple lines
        return dumper.represent_scalar('tag:yaml.org,2002:str', data, style='|')
    return dumper.represent_scalar('tag:yaml.org,2002:str', data)


yaml.add_representer(str, literal_str_presenter, Dumper=yaml.SafeDumper)


def insertNIC(inputYaml, nicName):
  print("Reading the file : " + inputYaml)

  # read
  with open(inputYaml, 'r') as yamlFile: # file will be closed after line
    data = list(yaml.safe_load_all(yamlFile))  # use safe_load_all function as there are multiple yaml in the file.    
    # "ValueError: I/O operation on closed file" => To avoid, save to 'list'
    '''
    The error ValueError: I/O operation on closed file is happening 
    because yaml.safe_load_all() reads from the file after it has already been closed in the with open(...) as yamlFile block.   
    When yaml.safe_load_all(yamlFile) returns a generator, the actual reading occurs when iterating over it later, but by that time, the file has already been closed.
    To resolve this issue, load all the YAML data while the file is still open. You can achieve this by converting data into a list
    '''

  if verbose:
    print("==============\n")
    print(data)
    print("==============\n")
    print(Path(inputYaml).stem)  # From full path file name, get file name only without the extention
    print(Path(inputYaml).with_name(Path(inputYaml).stem)) # file name with directory
  
  outputYaml = str(Path(inputYaml).with_name(Path(inputYaml).stem + "_mod.yml")) # making new full file path with the modefied name. 
  print("Output file name : " + outputYaml)

  # write
  with open(outputYaml, 'w') as newYamlFile:
    
    # PyYAML's default behavior, which doesn’t preserve the original quote style (double or single quotes) when writing YAML data back out 
    yaml.dump_all(data, newYamlFile, default_flow_style=False, Dumper=yaml.SafeDumper) # "" => ''    
    
    #yaml.dump_all(data, newYamlFile, default_flow_style=False, Dumper=CustomDumper) 


def main():
  global verbose
  usage()
  inputFile = sys.argv[1]
  ifaceName = sys.argv[2]
  
  if "-v" in sys.argv or "--verbose" in sys.argv:
    verbose = True
    
  insertNIC(inputFile, ifaceName)

if __name__ == "__main__":
  main()