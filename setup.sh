#!/bin/bash

DOT_FILES=( .zshrc .zprofile .bashrc .bash_profile .tmux.conf .tmux .vimrc .gitconfig .gitignore .zshrc.antigen )

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ -L $HOME/$file ]; then
      echo "既にシンボリックリンクが存在します！: $file"
    elif [ -d $HOME/$file ]; then
      echo "既にディレクトリが存在します！: $file"
    else
      echo "既にファイルが存在します！: $file"
    fi
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました！: $file"
  fi
done

# private_xml
REMAP_FILE=( private.xml )

for rfile in ${REMAP_FILE[@]}
do
  if [ -a $HOME/Library/Application\ Support/KeyRemap4MacBook/$rfile ]; then
    rm -f $HOME/Library/Application\ Support/KeyRemap4MacBook/$rfile
    ln -s $HOME/dotfiles/$rfile $HOME/Library/Application\ Support/KeyRemap4MacBook/$rfile
    echo "$rfile のシンボリックリンク貼ったよ"
  else
    echo "KeyRemap4MacBookがないでござる"
  fi
done
