Lagopus software router YANG
============================

How to run openconfigd for Lagopus software router
--------------------------------------------------

Move to directory containing file "lagopus-router.yang" and run openconfigd with options below.

```bash
cd yang
openconfigd --yang-paths=modules:modules/interfaces:modules/vlan:modules/network-instance:modules/types lagopus-router.yang &
```

How to validate YANG files
--------------------------

Install python-setuptools and pyang.
Check [README in mbj4668/pyang](https://github.com/mbj4668/pyang/blob/master/README) for the latest information.

```bash
$ sudo apt-get install python-setuptools
$ git clone https://github.com/mbj4668/pyang.git
$ cd pyang
$ sudo python setup.py install
```

Run below script to validate all YANG files under current directory.

```bash
$ ./lint.sh -a
```

How to see configuration tree
------------------------------

Install `goyang` following https://github.com/openconfig/goyang/blob/master/README.md

Run script.

```bash
$ ./showtree.sh
```
