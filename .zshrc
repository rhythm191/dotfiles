# PROMPT
autoload colors
colors

# vcsの設定をする
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:svn:*' formats 's)[%b]'
zstyle ':vcs_info:svn:*' actionformats 's)[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  # この check-for-changes が今回の設定するところ
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "?"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats 'g)[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats 'g)[%b|%a] %c%u'
fi


PROMPT="[%n@%m]%(!.#.$) "
PROMPT2="_> "
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%1(v|%F{green}%1v%f|) %{${fg[cyan]}%}[%~]%{${reset_color}%}"
setopt prompt_subst
bindkey -e                         # emacsライクなキーバインド

# C-p, C-nを検索つきコマンドヒストリ探索に変更
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

export LANG=ja_JP.UTF-8
export EDITOR="vim"

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
# git alias g
compdef g='git'


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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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

# local専用設定を読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

