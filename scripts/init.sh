#!/bin/bash

sudo apt install bash-completion &>/dev/null
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash &>/dev/null


grep "git-cimpletion" $HOME/.bashrc || cat << EOF >> $HOME/.bashrc
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
EOF

chmod +x $HOME~/.git-completion.bash
sudo wget https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-completion.bash -P /etc/bash_completion.d/ &>/dev/null

for file in doc galaxy playbook pull vault
do
    sudo wget https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-$file-completion.bash -P /etc/bash_completion.d/ &>/dev/null
done