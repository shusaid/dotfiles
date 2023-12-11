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

# 自動cd&ls
function cd() {
    builtin cd $@
    ls
}

setopt AUTO_CD
cdpath=(.. ~ ~/src)

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### end

zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

# starship
eval "$(starship init zsh)"