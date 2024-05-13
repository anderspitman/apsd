#!/bin/bash

set -eu

function http_get {
    uri=$1
    dest=$2
    curl --fail -Lo $dest $uri
}

mkdir -p apsd/bin/

FZF_VERSION=0.52.0
http_get https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz fzf.tar.gz
tar -xf fzf.tar.gz
mv fzf apsd/bin/
rm -rf fzf.tar.gz

ZOXIDE_VERSION=0.9.4
mkdir -p zoxide
http_get https://github.com/ajeetdsouza/zoxide/releases/download/v${ZOXIDE_VERSION}/zoxide-${ZOXIDE_VERSION}-x86_64-unknown-linux-musl.tar.gz zoxide.tar.gz
tar -xf zoxide.tar.gz -C zoxide
mv zoxide/zoxide apsd/bin/
rm -rf zoxide zoxide.tar.gz

RIPGREP_VERSION=14.1.0
http_get https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl.tar.gz ripgrep.tar.gz
tar -xf ripgrep.tar.gz
mv ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/rg apsd/bin/
rm -rf ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/ ripgrep.tar.gz

#NEOVIM_VERSION=0.9.5
#curl --fail -Lo nvim https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/nvim.appimage
#chmod +x nvim
#mv nvim apsd/bin/

cp install.bash apsd/
cp install.posix apsd/
cp init.vim apsd/

APSD_VERSION=$(git describe --tags)

tar -czvf apsd_${APSD_VERSION}.tar.gz apsd/bin apsd/install.bash apsd/install.posix apsd/init.vim

rm -rf apsd
