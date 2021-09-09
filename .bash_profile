PATH=/usr/local/bin:/usr/local/sbin:/Users/shusay/.rbenv/shims:/Users/shusay/.rbenv/versions:/Users/shusay/.rbenv/version:/usr/bin:$PATH

export PATH

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# VPS_alias
alias vps='ssh -p 10239 shusay@133.242.191.118'

# cmd
alias v='vim'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
