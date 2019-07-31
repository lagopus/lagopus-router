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

set interfaces interface tif0 config driver local
set interfaces interface tif0 config type tunnel
set interfaces interface tif0 subinterfaces subinterface 0 config enabled true
set interfaces interface tif0 subinterfaces subinterface 0 tunnel config local-inet-address 10.10.0.1
set interfaces interface tif0 subinterfaces subinterface 0 tunnel config remote-inet-address 10.10.0.2
set interfaces interface tif0 subinterfaces subinterface 0 tunnel config encaps-method direct
set interfaces interface tif0 subinterfaces subinterface 0 tunnel config hop-limit 255
set interfaces interface tif0 subinterfaces subinterface 0 tunnel config security ipsec
set interfaces interface tif0 subinterfaces subinterface 0 tunnel config tos 0
set interfaces interface tif0 config enabled true

# network-instnace vrf1
set network-instances network-instance vrf1 config type L3VRF
set network-instances network-instance vrf1 config enabled true
set network-instances network-instance vrf1 config enabled-address-families IPV4
set network-instances network-instance vrf1 interfaces interface if0 subinterface 0
set network-instances network-instance vrf1 interfaces interface if1 subinterface 0
set network-instances network-instance vrf1 interfaces interface tif0 subinterface 0
set network-instances network-instance vrf1 security ipsec sad sad-entries 2 config sa-mode tunnel
set network-instances network-instance vrf1 security ipsec sad sad-entries 2 config life-time life-time-in-seconds 0
set network-instances network-instance vrf1 security ipsec sad sad-entries 2 config life-time life-time-in-byte 0
set network-instances network-instance vrf1 security ipsec sad sad-entries 2 config local-peer ipv4-address 10.10.0.1
set network-instances network-instance vrf1 security ipsec sad sad-entries 2 config remote-peer ipv4-address 10.10.0.2
set network-instances network-instance vrf1 security ipsec sad sad-entries 2 config esp encryption aes-128-gcm key-str 00112233445566778899aabbccddeeff11223344
set network-instances network-instance vrf1 security ipsec sad sad-entries 3 config sa-mode tunnel
set network-instances network-instance vrf1 security ipsec sad sad-entries 3 config life-time life-time-in-seconds 0
set network-instances network-instance vrf1 security ipsec sad sad-entries 3 config life-time life-time-in-byte 0
set network-instances network-instance vrf1 security ipsec sad sad-entries 3 config local-peer ipv4-address 10.10.0.2
set network-instances network-instance vrf1 security ipsec sad sad-entries 3 config remote-peer ipv4-address 10.10.0.1
set network-instances network-instance vrf1 security ipsec sad sad-entries 3 config esp encryption aes-128-gcm key-str 00112233445566778899aabbccddeeff11223343
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config spi 2
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config destination-address ipv4-address 172.16.120.0
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config destination-address prefix-length 24
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config destination-address port-number 0
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config upper-protocol any
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config direction outbound
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config security-protocol esp
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config priority 1
set network-instances network-instance vrf1 security ipsec spd spd-entries sp1 config policy protect
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config spi 3
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config destination-address ipv4-address 172.16.110.0
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config destination-address prefix-length 24
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config destination-address port-number 0
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config upper-protocol any
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config direction inbound
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config security-protocol esp
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config priority 1
set network-instances network-instance vrf1 security ipsec spd spd-entries sp2 config policy protect

commit
