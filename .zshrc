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
export EDITOR="emacs -nw"

# ビープ音を消す
setopt nolistbeep



## 補完機能
autoload -U compinit
compinit -u
setopt correct           # 正しいコマンドを提示してくれる
setopt auto_list         # 補完候補が複数ある時に、一覧表示する
setopt magic_equal_subst # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt brace_ccl         # {a-c} を a b c に展開する機能を使えるようにする
setopt auto_param_slash  # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin


## cd
setopt auto_cd           # 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_pushd        # cd でTabを押すとdir list を表示
setopt pushd_ignore_dups # ディレクトリスタックに同じディレクトリを追加しないようになる



## history関係
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups   # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history      # 履歴ファイルを共有
setopt EXTENDED_HISTORY   # zshの開始終了を記録



# C-M-h でチートシートを表示する
cheat-sheet () { zle -M "`cat ~/dotfiles/.zsh/cheat-sheet`" }
zle -N cheat-sheet


## alias設定
#
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias

case "${OSTYPE}" in
# Mac(Unix)
darwin*)
    # ここに設定
    [ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
    ;;
# Linux
linux*)
    # ここに設定
    [ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
    ;;
esac

