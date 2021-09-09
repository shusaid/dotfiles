#!/bin/bash

DOT_FILES=( .gemrc .zshrc .zprofile .bashrc .bash_profile .gitconfig .gitignore )
PATHES="$HOME/src/github.com/shusaid/dotfiles"

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
    ln -fs $PATHES/$file $HOME/$file
    echo "シンボリックリンクを貼りました！: $file"
  fi
done

# karabiner-elements
REMAP_FILE_2=( karabiner.json )

for rfile2 in ${REMAP_FILE_2[@]}
do
  if [ -a $HOME/.config/karabiner/$rfile2 ]; then
    rm -f $HOME/.config/karabiner/$rfile2
    ln -s $PATHES/$rfile2 $HOME/.config/karabiner/$rfile2
    echo "$rfile2 のシンボリックリンク貼りました！"
  else
    echo "karabiner-elementsがありません"
  fi
done
