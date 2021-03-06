#!/bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config mtu 1514
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface if0 ethernet switched-vlan config access-vlan 100

set interfaces interface if0 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface if0 subinterfaces subinterface 0 config enabled true
set interfaces interface if0 config enabled true

set interfaces interface if1 config mtu 1518
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 ethernet switched-vlan config interface-mode TRUNK
set interfaces interface if1 ethernet switched-vlan config trunk-vlans 200
set interfaces interface if1 ethernet switched-vlan config trunk-vlans 201

set interfaces interface if1 subinterfaces subinterface 200 vlan config vlan-id 200
set interfaces interface if1 subinterfaces subinterface 200 ipv4 addresses address 10.0.0.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 200 config enabled true
set interfaces interface if1 subinterfaces subinterface 200 ipv4 napt config enabled true
set interfaces interface if1 subinterfaces subinterface 200 ipv4 napt config maximum-entries 10000
set interfaces interface if1 subinterfaces subinterface 200 ipv4 napt config aging-time 900
set interfaces interface if1 subinterfaces subinterface 200 ipv4 napt config port-range 49152..65535
set interfaces interface if1 subinterfaces subinterface 200 ipv4 napt config address 10.0.0.1

set interfaces interface if1 subinterfaces subinterface 201 vlan config vlan-id 201
set interfaces interface if1 subinterfaces subinterface 201 ipv4 addresses address 10.0.0.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 201 config enabled true
set interfaces interface if1 subinterfaces subinterface 201 ipv4 napt config enabled true
set interfaces interface if1 subinterfaces subinterface 201 ipv4 napt config maximum-entries 10000
set interfaces interface if1 subinterfaces subinterface 201 ipv4 napt config aging-time 900
set interfaces interface if1 subinterfaces subinterface 201 ipv4 napt config port-range 49152..65535
set interfaces interface if1 subinterfaces subinterface 201 ipv4 napt config address 10.0.0.1

set interfaces interface if1 config enabled true


set interfaces interface rif0 config mtu 1514
set interfaces interface rif0 config driver local
set interfaces interface rif0 config type ethernetCsmacd
set interfaces interface rif0 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface rif0 ethernet switched-vlan config access-vlan 100
set interfaces interface rif0 subinterfaces subinterface 0 config enabled true
set interfaces interface rif0 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface rif0 subinterfaces subinterface 0 ipv4 addresses address 192.168.0.1 config prefix-length 24
set interfaces interface rif0 config enabled true

set interfaces interface rif1 config mtu 1514
set interfaces interface rif1 config driver local
set interfaces interface rif1 config type ethernetCsmacd
set interfaces interface rif1 ethernet switched-vlan config interface-mode ACCESS
set interfaces interface rif1 ethernet switched-vlan config access-vlan 100
set interfaces interface rif1 subinterfaces subinterface 0 config enabled true
set interfaces interface rif1 subinterfaces subinterface 0 vlan config vlan-id 100
set interfaces interface rif1 subinterfaces subinterface 0 ipv4 addresses address 192.168.0.2 config prefix-length 24
set interfaces interface rif1 config enabled true


# network-instnace vsi1
set network-instances network-instance vsi1 config type L2VSI
set network-instances network-instance vsi1 config enabled true
set network-instances network-instance vsi1 vlans vlan 100 config status ACTIVE
set network-instances network-instance vsi1 fdb config mac-learning true
set network-instances network-instance vsi1 fdb config mac-aging-time 300
set network-instances network-instance vsi1 fdb config maximum-entries 3000
set network-instances network-instance vsi1 interfaces interface if0 subinterface 0
set network-instances network-instance vsi1 interfaces interface rif0 subinterface 0
set network-instances network-instance vsi1 interfaces interface rif1 subinterface 0

# network-instnace vrf1
set network-instances network-instance vrf1 config type L3VRF
set network-instances network-instance vrf1 config enabled true
set network-instances network-instance vrf1 config enabled-address-families IPV4
set network-instances network-instance vrf1 interfaces interface rif0 subinterface 0
set network-instances network-instance vrf1 interfaces interface if1 subinterface 200

# network-instnace vrf2
set network-instances network-instance vrf2 config type L3VRF
set network-instances network-instance vrf2 config enabled true
set network-instances network-instance vrf2 config enabled-address-families IPV4
set network-instances network-instance vrf2 interfaces interface rif1 subinterface 0
set network-instances network-instance vrf2 interfaces interface if1 subinterface 201

commit

