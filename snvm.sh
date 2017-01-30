#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SYSTEM_DIR="/usr/bin"
SYSTEM_NODE=$SYSTEM_DIR/node
SYSTEM_NPM=$SYSTEM_DIR/npm

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
WHITE='\033[0m'

case $1 in
  -h|--help | "")
    man $DIR/manpage
  ;;
  current)
    if [ -e $SYSTEM_NODE ]
      then
        SYSTEM_VERSION_PATH=$(readlink $SYSTEM_NODE)
        NVM_VERSION=${SYSTEM_VERSION_PATH%/bin*}   # remove suffix starting with "/bin"
        VERSION_NUMBER=${NVM_VERSION#*node/v}   # remove prefix ending in "node/v"
        echo "system -> $VERSION_NUMBER"
      else
        printf "system -> ${RED}unset${WHITE}\n"
    fi
  ;;
  set)
    if [ "$2" != "" ]
      then
      VERSION=${2#*v}   # remove leading "v"
      NODE_PATH="/home/dan/.nvm/versions/node/v$VERSION"
      if [ -e $NODE_PATH ]
        then
          sudo ln -sf /home/dan/.nvm/versions/node/v$2/bin/node $SYSTEM_NODE
          sudo ln -sf /home/dan/.nvm/versions/node/v$2/bin/npm  $SYSTEM_NPM
          echo "system -> $VERSION"
        else
          printf "${RED}Error:${WHITE} Unable to set system version. Node v$VERSION is not installed in nvm\n"
      fi
    else
      NVM_VERSION_PATH=$(which node)
      NVM_VERSION=${NVM_VERSION_PATH%/bin*}   # remove suffix starting with "/bin"
      VERSION_NUMBER=${NVM_VERSION#*node/v}   # remove prefix ending in "node/v"
      sudo ln -sf $NVM_VERSION/bin/node $SYSTEM_NODE
      sudo ln -sf $NVM_VERSION/bin/npm $SYSTEM_NPM
      echo "system -> $VERSION_NUMBER"
    fi
  ;;
  unset)
    if [ -e $SYSTEM_NODE ]
      then sudo rm $SYSTEM_NODE
    fi
    if [ -e $SYSTEM_NPM ]
      then sudo rm $SYSTEM_NPM
    fi
    printf "system -> ${RED}unset${WHITE}\n"
  ;;
  -v|--version)
    echo "0.0.1"
  ;;
  *)
    echo "invalid option. For help, run snvm --help."
  ;;
esac