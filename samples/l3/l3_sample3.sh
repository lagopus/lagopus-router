#!/bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config name if0
set interfaces interface if0 config mtu 1500
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 subinterfaces subinterface 0 config enabled true
set interfaces interface if0 subinterfaces subinterface 0 config index 0
set interfaces interface if0 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface if0 config enabled true

set interfaces interface if1 config name if1
set interfaces interface if1 config mtu 1500
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 ethernet switched-vlan config interface-mode TRUNK
set interfaces interface if1 ethernet switched-vlan config trunk-vlans 200
set interfaces interface if1 ethernet switched-vlan config trunk-vlans 201

set interfaces interface if1 subinterfaces subinterface 200 config index 200
set interfaces interface if1 subinterfaces subinterface 200 vlan config vlan-id 200
set interfaces interface if1 subinterfaces subinterface 200 ipv4 addresses address 10.0.0.1 config ip 10.0.0.1
set interfaces interface if1 subinterfaces subinterface 200 ipv4 addresses address 10.0.0.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 200 config enabled true

set interfaces interface if1 subinterfaces subinterface 201 config index 201
set interfaces interface if1 subinterfaces subinterface 201 vlan config vlan-id 201
set interfaces interface if1 subinterfaces subinterface 201 ipv4 addresses address 10.0.0.1 config ip 10.0.0.1
set interfaces interface if1 subinterfaces subinterface 201 ipv4 addresses address 10.0.0.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 201 config enabled true

set interfaces interface if1 config enabled true


set interfaces interface rif0 config name rif0
set interfaces interface rif0 config mtu 1500
set interfaces interface rif0 config driver local
set interfaces interface rif0 config type ethernetCsmacd
set interfaces interface rif0 subinterfaces subinterface 0 config enabled true
set interfaces interface rif0 subinterfaces subinterface 0 config index 0
set interfaces interface rif0 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface rif0 subinterfaces subinterface 0 ipv4 addresses address 192.168.0.1 config ip 192.168.0.1
set interfaces interface rif0 subinterfaces subinterface 0 ipv4 addresses address 192.168.0.1 config prefix-length 24
set interfaces interface rif0 config enabled true

set interfaces interface rif1 config name rif1
set interfaces interface rif1 config mtu 1500
set interfaces interface rif1 config driver local
set interfaces interface rif1 config type ethernetCsmacd
set interfaces interface rif1 subinterfaces subinterface 0 config enabled true
set interfaces interface rif1 subinterfaces subinterface 0 config index 0
set interfaces interface rif1 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface rif1 subinterfaces subinterface 0 ipv4 addresses address 192.168.0.2 config ip 192.168.0.2
set interfaces interface rif1 subinterfaces subinterface 0 ipv4 addresses address 192.168.0.2 config prefix-length 24
set interfaces interface rif1 config enabled true


# network-instnace VSI1
set network-instances network-instance VSI1 config name VSI1
set network-instances network-instance VSI1 config type L2VSI
set network-instances network-instance VSI1 config enabled true
set network-instances network-instance VSI1 config mtu 1500
set network-instances network-instance VSI1 vlans vlan 100 config vlan-id 100
set network-instances network-instance VSI1 vlans vlan 100 config status ACTIVE
set network-instances network-instance VSI1 fdb config mac-learning true
set network-instances network-instance VSI1 fdb config mac-aging-time 300
set network-instances network-instance VSI1 fdb config maximum-entries 3000
set network-instances network-instance VSI1 interfaces interface if0-0 config id if0-0
set network-instances network-instance VSI1 interfaces interface if0-0 config interface if0
set network-instances network-instance VSI1 interfaces interface if0-0 config subinterface 0
set network-instances network-instance VSI1 interfaces interface rif0-0 config id rif0-0
set network-instances network-instance VSI1 interfaces interface rif0-0 config interface rif0
set network-instances network-instance VSI1 interfaces interface rif0-0 config subinterface 100
set network-instances network-instance VSI1 interfaces interface rif1-0 config id rif1-0
set network-instances network-instance VSI1 interfaces interface rif1-0 config interface rif1
set network-instances network-instance VSI1 interfaces interface rif1-0 config subinterface 200


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
set network-instances network-instance VRF1 interfaces interface if1-200 config id if1-200
set network-instances network-instance VRF1 interfaces interface if1-200 config interface if1
set network-instances network-instance VRF1 interfaces interface if1-200 config subinterface 200
set network-instances network-instance VRF1 interfaces interface if1-200 config associated-address-families IPV4

# network-instnace VRF2
set network-instances network-instance VRF2 config name VRF2
set network-instances network-instance VRF2 config type L3VRF
set network-instances network-instance VRF2 config enabled true
set network-instances network-instance VRF2 config enabled-address-families IPV4
set network-instances network-instance VRF2 config mtu 1500
set network-instances network-instance VRF2 interfaces interface rif1-0 config id rif1-0
set network-instances network-instance VRF2 interfaces interface rif1-0 config interface rif1
set network-instances network-instance VRF2 interfaces interface rif1-0 config subinterface 0
set network-instances network-instance VRF2 interfaces interface rif1-0 config associated-address-families IPV4
set network-instances network-instance VRF2 interfaces interface if1-201 config id if1-201
set network-instances network-instance VRF2 interfaces interface if1-201 config interface if1
set network-instances network-instance VRF2 interfaces interface if1-201 config subinterface 201
set network-instances network-instance VRF2 interfaces interface if1-201 config associated-address-families IPV4

commit
