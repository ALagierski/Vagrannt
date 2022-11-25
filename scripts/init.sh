#!/bin/bash

sudo apt install bash-completion &>/dev/null
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash &>/dev/null


grep "git-completion" /home/panda/.bashrc || cat << EOF >> /home/panda/.bashrc
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
EOF

chmod +x /home/panda/.git-completion.bash
sudo wget https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-completion.bash &>/dev/null
sudo mv ansible-completion.bash /etc/bash_completion.d/

for file in doc galaxy playbook pull vault
do
    sudo wget https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-$file-completion.bash &>/dev/null
    sudo mv ansible-$file-completion.bash /etc/bash_completion.d/
done