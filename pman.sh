#!/bin/bash

export VAGRANT_CWD=__VAR__TOOLS__DIR__

ACTION=$1

case $ACTION in
  "down")
    echo "Shutting down podman"
    vagrant halt
    ;;

  "up")
    echo "STARTING podman"
    vagrant up
    ;;

esac
