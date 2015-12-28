export LANG=ja_JP.UTF-8
export TERM="xterm-256color"

BASICPATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin
RBENV=$HOME/.rbenv/shims:$HOME/.rbenv/versions
HEROKU=/usr/local/heroku/bin
NODEPATH=$HOME/.nodebrew/current/bin
GOPATH=$HOME
GHQPATH=$GOPATH/bin

export PATH=$BASICPATH:$RBENV:$HEROKU:$NODEPATH:$GOPATH:$GHQPATH:$PATH
