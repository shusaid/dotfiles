export LANG=ja_JP.UTF-8
export MINIO_HOST=localhost

local BREW=/opt/homebrew/bin:/usr/local/bin
local RBENV=$HOME/.rbenv/shims
local NODENV=$HOME/.nodenv/bin

PATH=$BREW:$RBENV:$NODENV:$PATH
typeset -U PATH
export PATH

# rbenv
if command -v rbenv &>/dev/null; then eval "$(rbenv init - zsh)"; fi
if command -v nodenv &>/dev/null; then eval "$(nodenv init - zsh)"; fi
