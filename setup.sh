#!/bin/bash

###########
# Homebrew
###########
echo -e "-----\nCheck Homebrew"
if [ -f ~/.zshrc ]; then
  if [ "`echo $PATH | grep '/opt/homebrew/bin'`" ]; then
    echo '✅ Homebrew PATH already exist'
  else
    echo '🙅 Homebrew PATH was not exist\n...update .zshrc'
    echo 'export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc
  fi
else
  echo '🙅 .zshrc was not exist\n...update .zshrc'
  echo 'export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH' >> ~/.zshrc
  source ~/.zshrc
fi

if type "brew" >/dev/null 2>&1; then
  echo -e "✅ brew already exist"
else
  echo -e "🙅 Homebrew was not exist\nPlease install Homebrew"
  open "https://brew.sh"
  exit
fi

##########
# Ansible
##########
echo -e "-----\nCheck Ansible"
if type "ansible" >/dev/null 2>&1; then
  echo -e "✅ Ansible already exist"
else
  echo -e "🙅 ansible was not installed"
  brew install ansible
fi

echo -e "-----\nAnsible Deploy"
cd ~
curl -O -sfSL https://raw.githubusercontent.com/shusaid/dotfiles/master/ansible_arm64_mac.yml

if [ -f ~/ansible_arm64_mac.yml ]; then
  ansible-galaxy collection install community.general
  ansible-playbook ansible_arm64_mac.yml --ask-become-pass
  rm ansible_arm64_mac.yml
else
  echo -e "🙅 ansible-playbook was not downloaded"
fi

###########
# dotfiles
###########
DOT_FILES=(.zshrc .zprofile .gitconfig .gitignore)
PATHES="$HOME/src/github.com/shusaid/dotfiles"

for file in ${DOT_FILES[@]}; do
  if [ -a $HOME/$file ]; then
    if [ -L $HOME/$file ]; then
      echo "既にシンボリックリンクが存在します！: $file"
    elif [ -d $HOME/$file ]; then
      echo "既にディレクトリが存在します！: $file"
    else
      echo "既にファイルが存在します！: $file"
    fi
  else
    ln -fs $PATHES/$file $HOME/$file
    echo "シンボリックリンクを貼りました！: $file"
  fi
done

# karabiner-elements
REMAP_FILE_2=(karabiner.json)

for rfile2 in ${REMAP_FILE_2[@]}; do
  if [ -a $HOME/.config/karabiner/$rfile2 ]; then
    rm -f $HOME/.config/karabiner/$rfile2
    ln -s $PATHES/$rfile2 $HOME/.config/karabiner/$rfile2
    echo "$rfile2 のシンボリックリンク貼りました！"
  else
    echo "karabiner-elementsがありません"
  fi
done

# starship
REMAP_FILE_3=(starship.toml)

for rfile3 in ${REMAP_FILE_3[@]}; do
  if [ -a $HOME/.config/$rfile3 ]; then
    rm -f $HOME/.config/$rfile3
    ln -s $PATHES/$rfile3 $HOME/.config/$rfile3
    echo "$rfile3 のシンボリックリンク貼りました！"
  else
    echo "starship.tomlがありません"
  fi
done
