#!/bin/bash

set -e

cat >> /root/.bashrc << EOF

test -s /etc/mobvista/aliases.sh  && . /etc/mobvista/aliases.sh || true
test -s /etc/mobvista/ps-twtty-7.sh &&  . /etc/mobvista/ps-twtty-7.sh || true
test -s /etc/mobvista/showcolors &&  . /etc/mobvista/showcolors || true

test -s ~/aliases.sh  && . ~/aliases.sh || true

# Editor for crontab, subversion, etc, etc...
#export VISUAL=mcedit
export VISUAL=vim

EOF
