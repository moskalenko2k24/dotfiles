# .bashrc

# Loading base config
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# NVM - Node Version Manager
# Don't change (code was added automatically)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# My own commands and aliases

# Use vimx on Fedora
# (vim with clipboard support)
alias vim="vimx"

# Move up
alias ..="cd .."

# Show all files
alias lsa="ls -A"

# Make & run
alias mr="make && make run"

# Clear & run program
alias cmr="clear && make && make run"


# Command to create directory and go there
function mkcd {
  mkdir -p -- "$1" && cd -P -- "$1"
}

# Command to show uptime
function up {
    uptime -p
}

# Disable bell
bind 'set bell-style none'

# Custom prompt
# PS1="\H \w "
