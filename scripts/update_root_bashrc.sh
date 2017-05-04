#!/bin/bash

set -e

cat >> /root/.bashrc << EOF

test -s /etc/homebash/aliases.sh  && . /etc/homebash/aliases.sh || true
test -s /etc/homebash/ps-twtty-7.sh &&  . /etc/homebash/ps-twtty-7.sh || true
test -s /etc/homebash/showcolors &&  . /etc/homebash/showcolors || true

test -s ~/aliases.sh  && . ~/aliases.sh || true

# Editor for crontab, subversion, etc, etc...
#export VISUAL=mcedit
export VISUAL=vim

EOF
