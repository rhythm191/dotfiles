# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

### alias
alias ll='ls -l'
alias la='ls -a'
alias lf='ls -F'

# git
alias g='git'


# Source local definitions
if [ -f .bashrc.local ]; then
	source .bashrc.local
fi


# User specific aliases and functions

