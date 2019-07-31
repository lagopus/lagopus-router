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


# network-instnace vrf1
set network-instances network-instance vrf1 config type L3VRF
set network-instances network-instance vrf1 config enabled true
set network-instances network-instance vrf1 config enabled-address-families IPV4
set network-instances network-instance vrf1 interfaces interface if0 subinterface 0
set network-instances network-instance vrf1 interfaces interface if1 subinterface 0
# priority 20, 192.168.0.0/24:12345 -> 192.168.0.0/24:12345..54321, TCP, input if0-0, action DROP
set network-instances network-instance vrf1 pbr-entries rule1 priority 10
set network-instances network-instance vrf1 pbr-entries rule1 ipv4 config source-address 192.168.0.0/24
set network-instances network-instance vrf1 pbr-entries rule1 ipv4 config destination-address 192.168.0.0/24
set network-instances network-instance vrf1 pbr-entries rule1 ipv4 config protocol 6
set network-instances network-instance vrf1 pbr-entries rule1 transport config source-port 12345
set network-instances network-instance vrf1 pbr-entries rule1 transport config destination-port 12345..54321
set network-instances network-instance vrf1 pbr-entries rule1 input-interface interface if0 subinterface 0
# priority 10, 192.168.0.0/24:12345 -> 192.168.0.0/24:12345, UDP, input if0-0, action PASS
set network-instances network-instance vrf1 pbr-entries rule2 priority 10
set network-instances network-instance vrf1 pbr-entries rule2 ipv4 config source-address 192.168.0.0/24
set network-instances network-instance vrf1 pbr-entries rule2 ipv4 config destination-address 192.168.0.0/24
set network-instances network-instance vrf1 pbr-entries rule2 ipv4 config protocol UDP
set network-instances network-instance vrf1 pbr-entries rule2 transport config source-port 12345
set network-instances network-instance vrf1 pbr-entries rule2 transport config destination-port 12345
set network-instances network-instance vrf1 pbr-entries rule2 input-interface interface if0 subinterface 0
set network-instances network-instance vrf1 pbr-entries rule2 action next-hops next-hop next-hop1 pass
# priority 5, 192.168.0.0/24 -> 10.0.0.0/8, input if0-0, action next-hop 10.0.0.1, 10.0.0.2
set network-instances network-instance vrf1 pbr-entries rule3 priority 5
set network-instances network-instance vrf1 pbr-entries rule3 ipv4 config source-address 192.168.0.0/24
set network-instances network-instance vrf1 pbr-entries rule3 ipv4 config destination-address 10.0.0.0/8
set network-instances network-instance vrf1 pbr-entries rule3 input-interface interface if0 subinterface 0
set network-instances network-instance vrf1 pbr-entries rule3 action next-hops next-hop next-hop1 config next-hop 10.0.0.1
set network-instances network-instance vrf1 pbr-entries rule3 action next-hops next-hop next-hop1 config weight 10
set network-instances network-instance vrf1 pbr-entries rule3 action next-hops next-hop next-hop2 config next-hop 10.0.0.2
set network-instances network-instance vrf1 pbr-entries rule3 action next-hops next-hop next-hop2 config weight 5
# priority 3, 10.0.0.0/8 -> ** , action next-hop if0-0
set network-instances network-instance vrf1 pbr-entries rule4 priority 3
set network-instances network-instance vrf1 pbr-entries rule4 ipv4 config source-address 10.0.0.0/8
set network-instances network-instance vrf1 pbr-entries rule4 action next-hops next-hop next-hop1 interface if0 subinterface 0

commit
