#!/bin/bash

mkdir -p apsd/bin

FZF_VERSION=0.52.0
curl -o fzf.tar.gz -L https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz
tar -xf fzf.tar.gz
mv fzf apsd/bin
rm -rf fzf.tar.gz


ZOXIDE_VERSION=0.9.4
mkdir -p zoxide
curl -o zoxide.tar.gz -L https://github.com/ajeetdsouza/zoxide/releases/download/v${ZOXIDE_VERSION}/zoxide-${ZOXIDE_VERSION}-x86_64-unknown-linux-musl.tar.gz
tar -xf zoxide.tar.gz -C zoxide
mv zoxide/zoxide apsd/bin
rm -rf zoxide zoxide.tar.gz

cp install.bash apsd

APSD_VERSION=$(git describe --tags)

tar -czvf apsd_${APSD_VERSION}.tar.gz apsd/bin apsd/install.bash

rm -rf apsd
