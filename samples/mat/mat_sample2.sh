#! /bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config mtu 1518
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface if0 ethernet switched-vlan config access-vlan 100

set interfaces interface if0 subinterfaces subinterface 0 config enabled true
set interfaces interface if0 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface if0 config enabled true

set interfaces interface if1 config mtu 1518
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface if1 ethernet switched-vlan config access-vlan 200

set interfaces interface if1 subinterfaces subinterface 0 vlan config vlan-id 200
set interfaces interface if1 subinterfaces subinterface 0 config enabled true
set interfaces interface if1 config enabled true

set interfaces interface if2 config mtu 1518
set interfaces interface if2 config driver dpdk
set interfaces interface if2 config device 0000:05:00.2
set interfaces interface if2 config type ethernetCsmacd
set interfaces interface if2 ethernet switched-vlan config interface-mode TRUNK
set interfaces interface if2 ethernet switched-vlan config trunk-vlans 100
set interfaces interface if2 ethernet switched-vlan config trunk-vlans 200

set interfaces interface if2 subinterfaces subinterface 100 vlan config vlan-id 100
set interfaces interface if2 subinterfaces subinterface 100 config enabled true
set interfaces interface if2 config enabled true

set interfaces interface if2 subinterfaces subinterface 200 vlan config vlan-id 200
set interfaces interface if2 subinterfaces subinterface 200 config enabled true
set interfaces interface if2 config enabled true

# network-instnace MAT1
set network-instances network-instance MAT1 config type LagopusMAT
set network-instances network-instance MAT1 config enabled true
set network-instances network-instance MAT1 vlans vlan 100 config status ACTIVE
# set network-instances network-instance MAT1 vlans vlan 100 config status SUSPENDED
set network-instances network-instance MAT1 vlans vlan 200 config status ACTIVE
set network-instances network-instance MAT1 fdb config mac-learning true
set network-instances network-instance MAT1 fdb config mac-aging-time 300
set network-instances network-instance MAT1 fdb config maximum-entries 3000
set network-instances network-instance MAT1 interfaces interface if0 subinterface 0
set network-instances network-instance MAT1 interfaces interface if1 subinterface 0
set network-instances network-instance MAT1 interfaces interface if2 subinterface 0
set network-instances network-instance MAT1 interfaces interface if2 subinterface 1

commit
