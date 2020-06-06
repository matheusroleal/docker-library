#!/bin/bash
arquivo=$@
gemset=2.4.0
/usr/local/rvm/bin/rvm ${gemset} exec ${arquivo}