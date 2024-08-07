export LANG=ja_JP.UTF-8
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
autoload -U colors && colors
typeset -U path PATH
# マッチしなければ大文字を小文字に変えつつ補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# history検索で戻る<C-s>を有効
stty stop undef
setopt append_history
setopt share_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt correct
setopt auto_pushd
setopt list_packed
setopt nobeep
setopt ignore_eof

# prompt
PROMPT="%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%c %{${fg[red]}%}%# %{${reset_color}%}"

# delete
bindkey "^[[3~" delete-char

# gitのbranch名を表示
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

# ls 
export LSCOLORS=gxfxcxdxbxhghdabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;37:cd=43;37:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;37' 'cd=43;37'
alias ls="ls -GFA"
alias gls="gls --color"
alias grep='grep --color=auto'
alias vf='vim +VimFilerExplorer'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias k=kubectl

# curl
setopt nonomatch

# memo
memofile=~/Dropbox/memo.txt
function g() { grep -in $1 $memofile }
function m() { vim $memofile }

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-src
bindkey '^]' peco-src

# alc
function alc () {
  if [ $# != 0 ]; then
    w3m "https://eow.alc.co.jp/$*/UTF-8/?ref=sa" | less +37
  else
    echo 'usage: alc word'
  fi
}

# PATH
export GOPATH=$HOME/dev/go
export PGDATA="/usr/local/var/postgres"
export VOLTA_HOME="$HOME/.volta"
#export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
#export HOMEBREW_CASK_OPTS="--appdir=/Applications"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export PATH="$GOPATH/bin:$HOME/.nodebrew/current/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$GOPATH/bin:$VOLTA_HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# asdf
#. /usr/local/opt/asdf/libexec/asdf.sh


# Customize
[ -f $HOME/.zshrc.mine ] && source $HOME/.zshrc.mine

# zshrc reload : exec zsh
# command not found: rehash