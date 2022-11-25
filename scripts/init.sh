#!/bin/bash

sudo apt install bash-completion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

cat << EOF >> ~/.bashrc
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
EOF

chmod +x ~/.git-completion.bash
sudo wget https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-completion.bash -P /etc/bash_completion.d/

for file in doc galaxy playbook pull vault
do
    sudo wget https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-$file-completion.bash -P /etc/bash_completion.d/
done