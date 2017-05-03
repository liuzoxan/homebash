#!/bin/bash

set -e

mkdir -p  /etc/skel/bin/

cat > /etc/skel/bin/update_bashrc.sh << 'EOF'
#!/bin/bash

set -e

dst_file="$HOME/.bashrc"
source mobvista_functions.sh
touch "$dst_file"
clean_mobvista "$dst_file"
print_mobvista "
test -s /etc/mobvista/aliases.sh  && . /etc/mobvista/aliases.sh || true
test -s /etc/mobvista/ps-twtty-7.sh &&  . /etc/mobvista/ps-twtty-7.sh || true
test -s /etc/mobvista/showcolors &&  . /etc/mobvista/showcolors || true

test -s ~/aliases.sh  && . ~/aliases.sh || true

# Editor for crontab, subversion, etc, etc...
#export VISUAL=mcedit
export VISUAL=vim
" >> "$dst_file"


EOF

chmod +x /etc/skel/bin/update_bashrc.sh

cat > /etc/skel/bin/mobvista_functions.sh << 'EOF'
#!/bin/bash

set -e

BEGIN_MARKER="### BEGIN Mobvista SETTINGS ###"
END_MARKER="### END Mobvista SETTINGS ###"

clean_mobvista() {
    # Delete mobvista settings
    target_file="$1"
    sed -i /"$BEGIN_MARKER"/,/"$END_MARKER"/d "$target_file"
}

print_mobvista() {
    content="$1"
    echo
    echo "$BEGIN_MARKER"
    echo "$content"
    echo "$END_MARKER"
}


EOF
