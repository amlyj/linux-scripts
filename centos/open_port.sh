#! /bin/bash

firewall-cmd --permanent --add-port=$1/tcp
firewall-cmd --reload
firewall-cmd --list-port
