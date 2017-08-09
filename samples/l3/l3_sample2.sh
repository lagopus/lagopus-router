#!/bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config name if0
set interfaces interface if0 config mtu 1518
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface if0 ethernet switched-vlan config access-vlan 100

set interfaces interface if0 subinterfaces subinterface 0 config enabled true
set interfaces interface if0 subinterfaces subinterface 0 config index 0
set interfaces interface if0 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface if0 config enabled true

set interfaces interface if1 config name if1
set interfaces interface if1 config mtu 1518
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface if1 ethernet switched-vlan config access-vlan 200

set interfaces interface if1 subinterfaces subinterface 0 config index 0
set interfaces interface if1 subinterfaces subinterface 0 vlan config vlan-id 200
set interfaces interface if1 subinterfaces subinterface 0 config enabled true
set interfaces interface if1 config enabled true

set interfaces interface if2 config name if2
set interfaces interface if2 config mtu 1518
set interfaces interface if2 config driver dpdk
set interfaces interface if2 config device 0000:05:00.2
set interfaces interface if2 config type ethernetCsmacd
set interfaces interface if2 ethernet switched-vlan config interface-mode TRUNK
set interfaces interface if2 ethernet switched-vlan config trunk-vlans 100
set interfaces interface if2 ethernet switched-vlan config trunk-vlans 200

set interfaces interface if2 subinterfaces subinterface 100 config index 100
set interfaces interface if2 subinterfaces subinterface 100 vlan config vlan-id 100
set interfaces interface if2 subinterfaces subinterface 100 config enabled true
set interfaces interface if2 config enabled true

set interfaces interface if2 subinterfaces subinterface 200 config index 200
set interfaces interface if2 subinterfaces subinterface 200 vlan config vlan-id 200
set interfaces interface if2 subinterfaces subinterface 200 config enabled true
set interfaces interface if2 config enabled true


set interfaces interface rif0 config name rif0
set interfaces interface rif0 config mtu 1518
set interfaces interface rif0 config driver local
set interfaces interface rif0 config type ethernetCsmacd
set interfaces interface rif0 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface rif0 ethernet switched-vlan config access-vlan 100

set interfaces interface rif0 subinterfaces subinterface 0 config enabled true
set interfaces interface rif0 subinterfaces subinterface 0 config index 0
set interfaces interface rif0 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface rif0 subinterfaces subinterface 0 ipv4 addresses address 10.0.0.1 config ip 10.0.0.1
set interfaces interface rif0 subinterfaces subinterface 0 ipv4 addresses address 10.0.0.1 config prefix-length 24
set interfaces interface rif0 config enabled true

set interfaces interface rif1 config name rif1
set interfaces interface rif1 config mtu 1518
set interfaces interface rif1 config driver local
set interfaces interface rif1 config type ethernetCsmacd
set interfaces interface rif1 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface rif1 ethernet switched-vlan config access-vlan 200

set interfaces interface rif1 subinterfaces subinterface 0 config enabled true
set interfaces interface rif1 subinterfaces subinterface 0 config index 0
set interfaces interface rif1 subinterfaces subinterface 0 vlan config vlan-id 200
set interfaces interface rif1 subinterfaces subinterface 0 ipv4 addresses address 10.1.0.1 config ip 10.1.0.1
set interfaces interface rif1 subinterfaces subinterface 0 ipv4 addresses address 10.1.0.1 config prefix-length 24
set interfaces interface rif1 config enabled true


# network-instance VSI1
set network-instances network-instance VSI1 config name VSI1
set network-instances network-instance VSI1 config type L2VSI
set network-instances network-instance VSI1 config enabled true
set network-instances network-instance VSI1 config mtu 1500
set network-instances network-instance VSI1 vlans vlan 100 config vlan-id 100
set network-instances network-instance VSI1 vlans vlan 100 config status ACTIVE
set network-instances network-instance VSI1 vlans vlan 200 config vlan-id 200
set network-instances network-instance VSI1 vlans vlan 200 config status ACTIVE
set network-instances network-instance VSI1 fdb config mac-learning true
set network-instances network-instance VSI1 fdb config mac-aging-time 300
set network-instances network-instance VSI1 fdb config maximum-entries 3000
set network-instances network-instance VSI1 interfaces interface if0-0 config id if0-0
set network-instances network-instance VSI1 interfaces interface if0-0 config interface if0
set network-instances network-instance VSI1 interfaces interface if0-0 config subinterface 0
set network-instances network-instance VSI1 interfaces interface if1-0 config id if1-0
set network-instances network-instance VSI1 interfaces interface if1-0 config interface if1
set network-instances network-instance VSI1 interfaces interface if1-0 config subinterface 0
set network-instances network-instance VSI1 interfaces interface if2-0 config id if2-0
set network-instances network-instance VSI1 interfaces interface if2-0 config interface if2
set network-instances network-instance VSI1 interfaces interface if2-0 config subinterface 0
set network-instances network-instance VSI1 interfaces interface if2-1 config id if2-1
set network-instances network-instance VSI1 interfaces interface if2-1 config interface if2
set network-instances network-instance VSI1 interfaces interface if2-1 config subinterface 1
set network-instances network-instance VSI1 interfaces interface rif0-0 config id rif0-0
set network-instances network-instance VSI1 interfaces interface rif0-0 config interface rif0
set network-instances network-instance VSI1 interfaces interface rif0-0 config subinterface 0
set network-instances network-instance VSI1 interfaces interface rif1-0 config id rif1-0
set network-instances network-instance VSI1 interfaces interface rif1-0 config interface rif1
set network-instances network-instance VSI1 interfaces interface rif1-0 config subinterface 0


# network-instnace VRF1
set network-instances network-instance VRF1 config name VRF1
set network-instances network-instance VRF1 config type L3VRF
set network-instances network-instance VRF1 config enabled true
set network-instances network-instance VRF1 config enabled-address-families IPV4
set network-instances network-instance VRF1 config mtu 1500
set network-instances network-instance VRF1 interfaces interface rif0-0 config id rif0-0
set network-instances network-instance VRF1 interfaces interface rif0-0 config interface rif0
set network-instances network-instance VRF1 interfaces interface rif0-0 config subinterface 0
set network-instances network-instance VRF1 interfaces interface rif0-0 config associated-address-families IPV4
set network-instances network-instance VRF1 interfaces interface rif1-0 config id rif1-0
set network-instances network-instance VRF1 interfaces interface rif1-0 config interface rif1
set network-instances network-instance VRF1 interfaces interface rif1-0 config subinterface 0
set network-instances network-instance VRF1 interfaces interface rif1-0 config associated-address-families IPV4



commit
