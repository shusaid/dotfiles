export LANG=ja_JP.UTF-8
export TERM="xterm-256color"
export MINIO_HOST=localhost

local BASIC=/usr/local/sbin:/usr/sbin:/usr/bin:/bin:/sbin
local BREW=/usr/local/bin
local RBENV=$HOME/.rbenv/shims
local NODENV=$HOME/.nodenv/bin
local MYSQL=/usr/local/opt/mysql@5.7/bin
local GO=$HOME
local GHQ=$GO/bin
local ZPLUG=$HOME/.zplug

PATH=$BREW:$BASIC:$ZPLUG:$RBENV:$NODENV:$MYSQL:$GO:$GHQ:$PATH
typeset -U path
export PATH

# rbenv
if command -v rbenv &>/dev/null; then eval "$(rbenv init - zsh)"; fi
if command -v nodenv &>/dev/null; then eval "$(nodenv init - zsh)"; fi
