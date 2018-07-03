#! /bin/bash

source /etc/bash_completion.d/cli

configure

set interfaces interface if0 config mtu 1514
set interfaces interface if0 config driver dpdk
set interfaces interface if0 config device 0000:05:00.0
set interfaces interface if0 config type ethernetCsmacd
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 config prefix-length 24
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 config virtual-address 172.16.30.3
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 config priority 200
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 config preempt true
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 config preempt-delay 100
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 config accept-mode true
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 config advertisement-interval 1000
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 interface-tracking config track-interface if0
set interfaces interface if0 subinterfaces subinterface 0 ipv4 addresses address 172.16.30.1 vrrp vrrp-group 1 interface-tracking config priority-decrement 150
set interfaces interface if0 subinterfaces subinterface 0 config enabled true
set interfaces interface if0 config enabled true

set interfaces interface if1 config mtu 1514
set interfaces interface if1 config driver dpdk
set interfaces interface if1 config device 0000:05:00.1
set interfaces interface if1 config type ethernetCsmacd
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 config prefix-length 24
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 config virtual-address 172.16.40.3
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 config priority 200
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 config preempt true
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 config preempt-delay 100
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 config accept-mode true
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 config advertisement-interval 1000
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 interface-tracking config track-interface if1
set interfaces interface if1 subinterfaces subinterface 0 ipv4 addresses address 172.16.40.1 vrrp vrrp-group 1 interface-tracking config priority-decrement 150
set interfaces interface if1 subinterfaces subinterface 0 config enabled true
set interfaces interface if1 config enabled true

# network-instnace vrf1
set network-instances network-instance vrf1 config type L3VRF
set network-instances network-instance vrf1 config enabled true
set network-instances network-instance vrf1 config enabled-address-families IPV4
set network-instances network-instance vrf1 interfaces interface if0 subinterface 0
set network-instances network-instance vrf1 interfaces interface if1 subinterface 0

commit
