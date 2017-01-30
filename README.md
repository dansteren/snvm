# System Node Version Manager

A utility to set your system version of node.

## About

System Node Version Manager (snvm) is a utility to set your system version of node. All it does is set symbolic links in /usr/bin/ pointing to nvm versions of node and npm. It is to be used in conjunction with nvm.

## History

Ever since I started using [nvm](https://github.com/creationix/nvm) I haven't had an actual system version of node. Then, one day an application I was using needed a system version of node. I subsequently wrote this utility to make it easy to set and unset your system wide version of node.

## System Requirements

1. nvm
2. no global installation of node

## Installation

1. `git clone git@github.com:dansteren/snvm.git`
2. Add an alias to your bashrc `alias snvm="path/to/snvm.sh"`

## Disclaimers

This probably isn't the most secure utitlity. Since it points the root version of node to a user account it opens up security vulnerabilities. This script is intended for low security risk applications. I'm mostly using it to get that program that doesn't recognize nvm to work. Don't use it on a production sever!
