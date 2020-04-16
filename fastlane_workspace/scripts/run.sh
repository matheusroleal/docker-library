#!/bin/bash
arquivo=$@
echo "" | sudo -S /usr/local/rvm/bin/rvm ${RUBY_VERSION}@${RVM_CLIENT_USER} exec ${arquivo}