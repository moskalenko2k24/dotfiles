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

# Copy recursive
alias cpr="cp -r"

# Make & run
alias mr="make && make run"

# Clear & run program
alias cmr="clear && make && make run"

# Show uptime (hours & minutes)
alias up="uptime -p"

# Open .bashrc
alias open-bashrc="vim ~/.bashrc"

# Reload .bashrc
alias reload-bashrc="source ~/.bashrc"

alias gits="git status"

alias gita="git add"

alias gitc="git commit"

alias gitp="git push"

# Command to create directory and go there
function mkcd {
    mkdir -p -- "$1" && cd -P -- "$1"
}

function new-project {
    if [[ "$1" == "c" ]]
    then
        cp -r ~/Templates/C/ "$2"
    elif [[ "$1" == "cpp" ]]
    then
        cp -r ~/Templates/C++/ "$2"
    elif [[ "$1" == "java" ]]
    then
        cp -r ~/Templates/Java/ "$2"
    elif [[ "$1" == "winapi" ]]
    then
        cp -r ~/Templates/WinAPI "$2"
    else
        echo "Unknown project type"
    fi
}

# Disable bell
bind 'set bell-style none'

# Custom prompt
# [user@host dir]$ 
PS1="[\u@\H \W]$ "
