#!/bin/bash

set -e

mkdir -p  /etc/skel/bin/

cat > /etc/skel/bin/update_bashrc.sh << 'EOF'
#!/bin/bash

set -e

dst_file="$HOME/.bashrc"
source homebash_functions.sh
touch "$dst_file"
clean_homebash "$dst_file"
print_homebash "
test -s /etc/homebash/aliases.sh  && . /etc/homebash/aliases.sh || true
test -s /etc/homebash/ps-twtty-7.sh &&  . /etc/homebash/ps-twtty-7.sh || true
test -s /etc/homebash/showcolors &&  . /etc/homebash/showcolors || true

test -s ~/aliases.sh  && . ~/aliases.sh || true

# Editor for crontab, subversion, etc, etc...
#export VISUAL=mcedit
export VISUAL=vim
" >> "$dst_file"


EOF

chmod +x /etc/skel/bin/update_bashrc.sh

cat > /etc/skel/bin/homebash_functions.sh << 'EOF'
#!/bin/bash

set -e

BEGIN_MARKER="### BEGIN homebash SETTINGS ###"
END_MARKER="### END homebash SETTINGS ###"

clean_homebash() {
    # Delete homebash settings
    target_file="$1"
    sed -i /"$BEGIN_MARKER"/,/"$END_MARKER"/d "$target_file"
}

print_homebash() {
    content="$1"
    echo
    echo "$BEGIN_MARKER"
    echo "$content"
    echo "$END_MARKER"
}


EOF
