#!/bin/bash

YANG_FILE=lagopus-router.yang

MODULES=./modules
MODULES=${MODULES},modules/interfaces
MODULES=${MODULES},modules/vlan
MODULES=${MODULES},modules/network-instance
MODULES=${MODULES},modules/types
FORMAT=tree

goyang --format=${FORMAT} --path="${MODULES}" $YANG_FILE
