eval "$(rbenv init -)"
eval "$(nodenv init -)"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig"

# see details for `brew info readline`
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export COMPOSE_FILE=docker-compose.development.yml
setopt no_beep

autoload -Uz promptinit; promptinit
prompt pure

export LSCOLORS=Gxfxcxdxbxegedabagacad

## command histroy ##
# https://mogulla3.tech/articles/2021-09-06-search-command-history-with-incremental-search
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000        # メモリ上の履歴リストに保存されるイベントの最大数
export SAVEHIST=100000        # 履歴ファイルに保存されるイベントの最大数

setopt hist_expire_dups_first # 履歴を切り詰める際に、重複する最も古いイベントから消す
setopt hist_ignore_all_dups   # 履歴が重複した場合に古い履歴を削除する
setopt hist_ignore_dups       # 前回のイベントと重複する場合、履歴に保存しない
setopt hist_save_no_dups      # 履歴ファイルに書き出す際、新しいコマンドと重複する古いコマンドは切り捨てる
setopt share_history          # 全てのセッションで履歴を共有する

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}

zle -N select-history 
bindkey '^r' select-history # `Ctrl+r` で登録したselect-historyウィジェットを呼び出す

## alias ##

# ls
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

# git
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gcmsg='git commit -m'
alias gd='git diff'
alias gs='git status'
alias gpush='git push'
alias gpull='git pull'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gsw='git switch'
alias gr='git restore'

# bundle
alias b='bundle'
alias be='bundle exec'
alias bx='bundle exec'
alias bi='bundle install'
alias bo='bundle outdated'
alias bu='bundle update'

# rails
alias r='bundle exec rails'
alias rc='bundle exec rails c'
alias rs='bundle exec rails s'
alias rr='bundle exec rails routes'
alias rdm='bundle exec rails db:migrate'
alias rdms='bundle exec rails db:migrate:status'
alias rds='rake db:seed'
alias rdsf='rake db:seed_fu'


# docker
alias dkr='docker'
alias dc='docker-compose'

# syntax highlight
source /Users/shini.yanada/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# auto compplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

