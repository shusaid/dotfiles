#!/bin/bash

DOT_FILES=( .gemrc .zshrc .zprofile .bashrc .bash_profile .tmux.conf .tmux .vimrc .gvimrc .gitconfig .gitignore .zshrc.antigen )
PATHES="Dropbox/src/github.com/shusaid/dotfiles"

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
    ln -fs $HOME/$PATHES/$file $HOME/$file
    echo "シンボリックリンクを貼りました！: $file"
  fi
done

# private_xml
REMAP_FILE=( private.xml )

for rfile in ${REMAP_FILE[@]}
do
  if [ -a $HOME/Library/Application\ Support/Karabiner/$rfile ]; then
    rm -f $HOME/Library/Application\ Support/Karabiner/$rfile
    ln -s $HOME/$PATHES/$rfile $HOME/Library/Application\ Support/Karabiner/$rfile
    echo "$rfile のシンボリックリンク貼ったよ"
  else
    echo "Karabinerがないでござる"
  fi
done

# karabiner-elements
REMAP_FILE_2=( karabiner.json )

for rfile2 in ${REMAP_FILE_2[@]}
do
  if [ -a $HOME/.karabiner.d/configuration/$rfile2 ]; then
    rm -f $HOME/.karabiner.d/configuration/$rfile2
    ln -s $HOME/$PATHES/$rfile2 $HOME/.karabiner.d/configuration/$rfile2
    echo "$rfile2 のシンボリックリンク貼りました！"
  else
    echo "karabiner-elementsがありません"
  fi
done

REMAP_FILE_3=( init.lua )

for rfile3 in ${REMAP_FILE_3[@]}
do
  if [ -a $HOME/.karabiner.d/configuration/$rfile3 ]; then
    rm -f $HOME/.karabiner.d/configuration/$rfile3
    ln -s $HOME/$PATHES/$rfile3 $HOME/.hammerspoon/$rfile3
    echo "$rfile3 のシンボリックリンク貼りました！"
  else
    echo "$rfile3がありません"
  fi
done
