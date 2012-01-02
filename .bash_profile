# Status line
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
PS1="$RED\u@\h:$NORMAL\w$GREEN\$$NORMAL"

# MacPorts Installer addition on 2011-06-26_at_12:43:19: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# alias to macvim
alias macvim=/Applications/MacVim.app/Contents/MacOS/Vim

# Setting PATH for EPD_free-7.1-2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH

# Use the last version of g++
export CXX=$(which g++-mp-4.6)
export CC=$(which gcc-mp-4.6)

# colorfull diff for subversion
sdiff() {
    svn diff --no-diff-deleted $@ | colordiff | less -SR
}

# default editor
export EDITOR=vim

# usefull aliases for ls
export LSCOLORS=Exfxcxdxbxegedabagacad
alias ls="ls -FG"
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# git stuff
source ~/.git-completion.bash
alias g='git'
alias gclean='git clean -d -x -n'

# aliases to tar extract and compress
alias tc='tar cvzf'
alias tx='tar xvzf'
