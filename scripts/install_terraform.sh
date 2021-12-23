#!/bin/bash

mkdir tmp
cd tmp
wget https://releases.hashicorp.com/terraform/"${TF_VERSION}"/terraform_"${TF_VERSION}"_linux_amd64.zip
unzip -u terraform_"${TF_VERSION}"_linux_amd64
sudo mv terraform /usr/local/bin
cd ..