#! /bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config mtu 1514
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 ethernet switched-vlan config interface-mode TRUNK
set interfaces interface if0 ethernet switched-vlan config trunk-vlan 100
set interfaces interface if0 ethernet switched-vlan config trunk-vlan 200
set interfaces interface if0 subinterfaces subinterface 100 vlan config vlan-id 100
set interfaces interface if0 subinterfaces subinterface 100 config enabled true
set interfaces interface if0 subinterfaces subinterface 200 vlan config vlan-id 200
set interfaces interface if0 subinterfaces subinterface 200 config enabled true
set interfaces interface if0 config enabled true

set interfaces interface if1 config mtu 1514
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 10.10.0.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 0 config enabled true
set interfaces interface if1 config enabled true

set interfaces interface tif0 config driver local
set interfaces interface tif0 config type tunnel
set interfaces interface tif0 tunnel config local-inet-address 10.10.0.1
set interfaces interface tif0 tunnel config remote-inet-address 10.10.0.2
set interfaces interface tif0 tunnel config encaps-method gre
set interfaces interface tif0 tunnel config hop-limit 255
set interfaces interface tif0 tunnel config tos 0
set interfaces interface tif0 tunnel config network-instance vrf1
set interfaces interface tif0 ethernet switched-vlan config interface-mode TRUNK
set interfaces interface tif0 ethernet switched-vlan config trunk-vlan 100
set interfaces interface tif0 ethernet switched-vlan config trunk-vlan 200
set interfaces interface tif0 subinterfaces subinterface 100 vlan config vlan-id 100
set interfaces interface tif0 subinterfaces subinterface 100 config enabled true
set interfaces interface tif0 subinterfaces subinterface 200 vlan config vlan-id 200
set interfaces interface tif0 subinterfaces subinterface 200 config enabled true
set interfaces interface tif0 config enabled true

# network-instnace VSI1
set network-instances network-instance vsi1 config type L2VSI
set network-instances network-instance vsi1 config enabled true
set network-instances network-instance vsi1 vlans vlan 100 config status ACTIVE
set network-instances network-instance vsi1 vlans vlan 200 config status ACTIVE
set network-instances network-instance vsi1 fdb config mac-learning true
set network-instances network-instance vsi1 fdb config mac-aging-time 300
set network-instances network-instance vsi1 fdb config maximum-entries 3000
set network-instances network-instance vsi1 interfaces interface if0 subinterface 100
set network-instances network-instance vsi1 interfaces interface if0 subinterface 200
set network-instances network-instance vsi1 interfaces interface tif0 subinterface 100
set network-instances network-instance vsi1 interfaces interface tif0 subinterface 200

# network-instnace VRF1
set network-instances network-instance vrf1 config type L3VRF
set network-instances network-instance vrf1 config enabled true
set network-instances network-instance vrf1 config enabled-address-families IPV4
set network-instances network-instance vrf1 interfaces interface if1 subinterface 0

commit
