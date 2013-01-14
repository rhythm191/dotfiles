# PROMPT
autoload colors
colors
PROMPT="[%n@%m]%(!.#.$) "
PROMPT2="_> "
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
setopt prompt_subst
bindkey -e                         # emacsライクなキーバインド

# C-p, C-nを検索つきコマンドヒストリ探索に変更
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

export LANG=ja_JP.UTF-8
export EDITOR=emacs

# ビープ音を消す
setopt nolistbeep

# 補完機能
autoload -U compinit
compinit -u

# 正しいコマンドを提示してくれる
setopt correct

# cdの履歴を表示
setopt autocd
setopt autopushd

# history関係
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups   # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history      # 履歴ファイルを共有
setopt EXTENDED_HISTORY   # zshの開始終了を記録

# alias
setopt complete_aliases
export LSCOLORS=ExFxCxdxBxegedabagacad
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
;;
linux*)
  alias ls="ls --color"
;;
esac
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"

# rubyの設定
alias r="rails"
eval "$(rbenv init - zsh)"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

