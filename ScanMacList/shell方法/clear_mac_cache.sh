#!/bin/bash

arp -n|awk '/^[1-9]/{print "arp -d  " $1}'|sh -x

