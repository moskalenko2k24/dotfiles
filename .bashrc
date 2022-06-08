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
alias ...="cd ../.."

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

# Clear console
alias cls="clear"

# Open .vimrc
alias opvimrc="vim ~/.vimrc"

# Open .bashrc
alias opbashrc="vim ~/.bashrc"

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

# Add directory to zip
function zip-dir {
    file="$1"
    [[ "${file}" == */ ]] && file="${file: : -1}"
    zip -r "${file}.zip" "${file}"
}

function new-file {
    case "$1" in
        *.c) cp ~/Templates/C/main.c "$1" ;;
        *.cpp) cp ~/Templates/C++/main.cpp "$1" ;;
        *.pas) cp ~/Templates/Free_Pascal/program.pas "$1" ;;
        *.js) cp ~/Templates/JavaScript/index.js "$1" ;;
        *.py) cp ~/Templates/Python/main.py "$1" ;;
        *) echo "Unknown project type" ;;
    esac
}

function new-project {
    if [[ "$1" == "c" ]]
    then
        cp -r ~/Templates/C/ "$2"
    elif [[ "$1" == "cpp" ]]
    then
        cp -r ~/Templates/C++/ "$2"
    elif [[ "$1" == "fpc" ]]
    then
        cp -r ~/Templates/Free_Pascal "$2"
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

function run {
    file=$1
    out="${file%.*}"
    # out=$(date +'%Y%m%d%H%M%S')
    flags="-Wall -Wextra"
    gcc="gcc ${flags} -std=c11 ${file} -o ${out}"
    gpp="g++ ${flags} -std=c++17 ${file} -o ${out}"
    start="./${out} && rm ${out}"
    case "$1" in
        *.c) cmd="${gcc} && ${start}" ;;
        *.cpp) cmd="${gpp} && ${start}" ;;
        *.pas) cmd="fpc -l- -v0 ${file} && ${start} *.o" ;;
        *.js) cmd="node $1" ;;
        *.py) cmd="python $1" ;;
        *) echo "Unknown project type" ;;
    esac
    echo $cmd
    eval $cmd
}

# Copy file path to clipboard
function cp-path {
    realpath "${1}" | xclip -sel clip
}

# Disable bell
bind 'set bell-style none'

# Custom prompt
# [user@host dir]$ 
PS1="[\u@\H \W]$ "

# Add PATH
# tg
export PATH="/home/andrey/.local/bin:$PATH"

HISTTIMEFORMAT="%Y-%m-%d %T "
