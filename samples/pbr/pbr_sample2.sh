#! /bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config mtu 1514
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 subinterfaces subinterface 0 config enabled true
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.110.1 config prefix-length 24
set interfaces interface if0 config enabled true

set interfaces interface if1 config mtu 1514
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 10.10.0.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 0 config enabled true
set interfaces interface if1 config enabled true

set interfaces interface if2 config mtu 1514
set interfaces interface if2 config driver dpdk
set interfaces interface if2 config device 0000:05:00.2
set interfaces interface if2 config type ethernetCsmacd
set interfaces interface if2 subinterfaces subinterface 0 ipv4 addresses address 10.10.0.1 config prefix-length 24
set interfaces interface if2 subinterfaces subinterface 0 config enabled true
set interfaces interface if2 config enabled true

# network-instnace vrf1
set network-instances network-instance vrf1 config type L3VRF
set network-instances network-instance vrf1 config enabled true
set network-instances network-instance vrf1 config enabled-address-families IPV4
set network-instances network-instance vrf1 interfaces interface if0 subinterface 0
set network-instances network-instance vrf1 interfaces interface if1 subinterface 0
# priority 10, 172.16.110.0/24 -> *:80, input if0-0, action next-hop vrf2
set network-instances network-instance vrf1 pbr-entries rule1 priority 10
set network-instances network-instance vrf1 pbr-entries rule1 ipv4 config source-address 172.16.110.0/24
set network-instances network-instance vrf1 pbr-entries rule1 ipv4 config protocol 6
set network-instances network-instance vrf1 pbr-entries rule1 transport config destination-port 80
set network-instances network-instance vrf1 pbr-entries rule1 input-interface interface if0 subinterface 0
set network-instances network-instance vrf1 pbr-entries rule1 action next-hops next-hop next-hop1 network-instance vrf2
set network-instances network-instance vrf1 pbr-entries rule1 action next-hops next-hop next-hop1 config weight 10

# network-instnace vrf2
set network-instances network-instance vrf2 config type L3VRF
set network-instances network-instance vrf2 config enabled true
set network-instances network-instance vrf2 config enabled-address-families IPV4
set network-instances network-instance vrf2 interfaces interface if2 subinterface 0
# priority 10, input if2-0, action next-hop vrf1
set network-instances network-instance vrf2 pbr-entries rule1 priority 10
set network-instances network-instance vrf2 pbr-entries rule1 input-interface interface if2 subinterface 0
set network-instances network-instance vrf2 pbr-entries rule1 action next-hops next-hop next-hop1 network-instance vrf1
set network-instances network-instance vrf2 pbr-entries rule1 action next-hops next-hop next-hop1 config weight 10

commit
