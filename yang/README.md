Lagopus software router YANG
============================

How to see configuration tree
------------------------------

```bash
$ showtree.sh
```

How to execution with openconfigd
---------------------------------

```bash
cd vrouter-yang
openconfigd --yang-paths=modules:modules/interfaces:modules/vlan:modules/network-instance:modules/types lagopus-router.yang &
```

