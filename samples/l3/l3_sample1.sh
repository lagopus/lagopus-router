#! /bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config name if0
set interfaces interface if0 config mtu 1500
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 subinterfaces subinterface 0 config enabled true
set interfaces interface if0 subinterfaces subinterface 0 config index 0
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.110.1 config ip 172.16.110.1
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.110.1 config prefix-length 24
set interfaces interface if0 config enabled true

set interfaces interface if1 config name if1
set interfaces interface if1 config mtu 1500
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 subinterfaces subinterface 0 config index 0
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 10.10.0.1 config ip 10.10.0.1
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 10.10.0.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 0 config enabled true
set interfaces interface if1 config enabled true


# network-instnace VRF1
set network-instances network-instance VRF1 config name VRF1
set network-instances network-instance VRF1 config type L3VRF
set network-instances network-instance VRF1 config enabled true
set network-instances network-instance VRF1 config enabled-address-families IPV4
set network-instances network-instance VRF1 config mtu 1500
set network-instances network-instance VRF1 interfaces interface if0-0 config id if0-0
set network-instances network-instance VRF1 interfaces interface if0-0 config interface if0
set network-instances network-instance VRF1 interfaces interface if0-0 config subinterface 0
set network-instances network-instance VRF1 interfaces interface if0-0 config associated-address-families IPV4
set network-instances network-instance VRF1 interfaces interface if1-0 config id if1-0
set network-instances network-instance VRF1 interfaces interface if1-0 config interface if1
set network-instances network-instance VRF1 interfaces interface if1-0 config subinterface 0
set network-instances network-instance VRF1 interfaces interface if1-0 config associated-address-families IPV4

commit
