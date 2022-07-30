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

# My cd aliases
alias cd-projects="cd ~/Projects"
alias cd-labs="cd ~/Labs"
alias cd-notes="cd ~/Notes"
alias cd-notesprivate="cd ~/NotesPrivate"
alias cd-giftbox="cd ~/Projects/Giftbox"
alias cd-giftboxfront="cd ~/Projects/Giftbox/ClientApp"
alias cd-telegram-downloads="cd ~/Downloads/Telegram\ Desktop"

# Open Nautilus (current dir)
alias nau="nautilus . &"

# ls aliases
alias ls="ls --color --group-directories-first"
alias ll="ls -l"
alias lsa="ls -A"

# Copy recursive
alias cpr="cp -r"

# (Clear &) make & run program
alias mr="make && make run"
alias cmr="clear && make && make run"

# Show uptime (hours & minutes)
alias up="uptime -p"

# Clear console
alias cls="clear"

# Opening configs
alias opxterm="vim ~/XTerm"
alias opvimrc="vim ~/.vimrc"
alias opbashrc="vim ~/.bashrc"
alias optmux="vim ~/.tmux.conf"

# Reload .bashrc
alias reload-bashrc="source ~/.bashrc"

# Aliases for soft
alias ff="firefox"
alias tg="telegram-desktop"

# Aliases for git
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitp="git push"

# Command to create directory and go there
function mkcd {
    newdir=$(date '+%Y-%m-%d')
    # if there is no param
    # create directory 'yyyy-mm-dd'
    if [ $# -eq 0 ]
    then
        mkdir -p "${newdir}" && cd "${newdir}"
    else
        mkdir -p -- "$1" && cd -P -- "$1"
    fi
}

# Go to dir with name yyyy-mm-dd
function cd-date {
    dir=$(date '+%Y-%m-%d')
    cd "${dir}"
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
    rem=""
    case "$1" in
        *.c)
            cmd="gcc ${flags} -std=c11 ${file} -o ${out} && ./${out}"
            rem="rm ${out}"
            ;;
        *.cpp)
            cmd="g++ ${flags} -std=c++17 ${file} -o ${out} && ./${out}"
            rem="rm ${out}"
            ;;
        *.pas)
            cmd="fpc -l- -v0 ${file} && ./${out}"
            rem="rm ${out} *.o"
            ;;
        *.js) cmd="node $1" ;;
        *.py) cmd="python $1" ;;
        *.java)
            cmd="javac ${file}" ;;
        *) echo "Unknown project type" ;;
    esac
    echo $cmd
    eval "${cmd};${rem}"
}

function cr {
    clear && run $1
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

# Alternative prompt
# full path\n
# PS1="\w\n$ "

# Show date / time in history
HISTTIMEFORMAT="%Y-%m-%d %T "
