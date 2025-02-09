# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH=$PATH:/usr/bin

# 環境変数
export LANG=ja_JP.UTF-8
autoload -Uz colors && colors
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
# ----------
#    補完
# ----------
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

## 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 日本語ファイルを扱えるようにする
setopt print_eight_bit

# ----------
#    履歴
# ----------
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

alias python="python3"
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export CLICOLOR=1
export TERM=xterm-256color

#export DOCKER_HOST=unix://$HOME/.lima/docker/sock/docker.sock

eval "$(rbenv init -)"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi
#PROMPT="%n ($(arch)):%~"$'\n'"%# "

# postgres dir
export PGDATA="$HOMEBREW_REPOSITORY/var/postgres"
# asdf
 . /opt/Homebrew/opt/asdf/libexec/asdf.sh

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
# java
export JAVA_HOME=`/usr/libexec/java_home -v "19.0.2"`
export PATH="$JAVA_HOME/bin:$PATH"
# flutter pub
export PATH="$PATH":"$HOME/.pub-cache/bin"
# php
export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"

# pnpm
export PNPM_HOME="/Users/yajima/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"

export DISABLE_SPRING=true
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

PATH=~/.console-ninja/.bin:$PATH

git_prompt() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    PROMPT="%F{047}%n%f:%F{009}%~%f $(git_super_status)"$'\n'"%# "
  else
    PROMPT="%F{047}%n%f:%F{009}%~%f "$'\n'"%# "
  fi
}

precmd() {
  git_prompt
}
autoload -Uz colors && colors
PROMPT="%F{047}%n%f:%F{009}%~%f $(git_super_status)"$'\n'"%# "

PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
