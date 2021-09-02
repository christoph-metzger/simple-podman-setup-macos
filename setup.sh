#!/usr/bin/env zsh

TOOLS_DIR="$HOME/tools/podman"

mkdir -p $TOOLS_DIR
mkdir -p $TOOLS_DIR/bin

brew update
brew install virtualbox vagrant podman

cp Vagrantfile $TOOLS_DIR/Vagrantfile

cp -a scripts/. $TOOLS_DIR/bin
sed -i'.template' -e "s:__VAR__TOOLS__DIR__:$TOOLS_DIR:g" $TOOLS_DIR/bin/podman-start $TOOLS_DIR/bin/podman-stop
chmod +x $TOOLS_DIR/bin/podman-start $TOOLS_DIR/bin/podman-stop
ln -sf $TOOLS_DIR/bin/podman-start /usr/local/bin/
ln -sf $TOOLS_DIR/bin/podman-stop /usr/local/bin/

function addLineToZshrcIfNotExist {
  grep -qF -- "$1" ~/.zshrc || echo "$1" >> ~/.zshrc
}

addLineToZshrcIfNotExist "export CONTAINER_HOST=ssh://vagrant@127.0.0.1:2222/run/podman/podman.sock"
addLineToZshrcIfNotExist "export CONTAINER_SSHKEY=$TOOLS_DIR/.vagrant/machines/default/virtualbox/private_key"
#addLineToZshrcIfNotExist "alias docker=podman"
