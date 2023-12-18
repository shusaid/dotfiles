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

###########
# Install
###########
# Homebrewを使用してzshをインストール
brew install zsh git wget starship tree trash ghq

# Homebrewでインストールされたzshのパスを取得
zsh_path="$(brew --prefix)/bin/zsh"

# シェルが利用可能なリストにzshのパスを追加（必要な場合のみ）
if ! grep -q "$zsh_path" /etc/shells; then
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

# デフォルトのシェルをHomebrew経由のzshに変更
chsh -s "$zsh_path"

echo "shellを $zsh_path に設定しました。"

###########
# dotfiles
###########
ghq get https://github.com/shusaid/dotfiles.git

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
REMAP_FILE=(karabiner.json)

for rfile in ${REMAP_FILE[@]}; do
  if [ -a $HOME/.config/karabiner/$rfile ]; then
    rm -f $HOME/.config/karabiner/$rfile
    ln -s $PATHES/$rfile $HOME/.config/karabiner/$rfile
    echo "$rfile のシンボリックリンク貼りました！"
  else
    echo "$rfile がありません"
  fi
done

# starship
STARSHIP=(starship.toml)

for starship in ${STARSHIP[@]}; do
  if [ -a $HOME/.config/$starship ]; then
    rm -f $HOME/.config/$starship
    ln -s $PATHES/$starship $HOME/.config/$starship
    echo "$starship のシンボリックリンク貼りました！"
  else
    echo "$starship がありません"
  fi
done
