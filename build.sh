#!/bin/bash

packer init ubuntu-21.04-arm64.pkr.hcl
packer build -force ubuntu-21.04-arm64.pkr.hcl
cp metadata.json output/
cd output
tar cvzf ubuntu-21.04-arm64.vmware.box ./*
md5 ubuntu-21.04-arm64.vmware.box
rm -f *.v* *.nvram metadata.json
