eval "$(starship init zsh)"

# ----- alias ----- #
alias v='vim'
alias g='git'

alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'

alias src='source'

alias ..='cd ../'

# bundle
alias be='bundle exec'
alias bi='bundle install'

# rbenv
alias re='rbenv exec'

# devcontainer
alias dvc='devcontainer'

# rをR言語向けに確保
disable r

# ghq
function peco-src() {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

HISTSIZE=1000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S'

# githubアカウント切り替え
function gitmain() {
    git config --global user.name "shusay"
    git config --global user.email "sy_tanaka@vivivit.co.jp"
}

function gitsub() {
    git config --global user.name "shusaid"
    git config --global user.email "shusay.t+account1@gmail.com"
}
