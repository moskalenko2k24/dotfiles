# .bashrc

# Loading base config
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Node Version Manager
# (code was added automatically)
# Load nvm & load nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="~/.local/bin:$PATH"

# flyctl => fly.io
export FLYCTL_INSTALL="/home/andrey/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# PS1="\w\n$ "               # custom prompt = "full path\n"
PS1="[\u@\H \W]$ "           # custom prompt = "[user@host dir]$ "
bind 'set bell-style none'   # disable bell

# Show date / time in history
HISTTIMEFORMAT="%Y-%m-%d %T "

# Aliases for basic commands
alias cls="clear"                      # clear screen
alias up="uptime -p"                   # show uptime(hours, minutes)
alias ls="ls --color --g"              # color ls with --group-directories-first
alias ll="ls -lA"                      # show all files, one file per row
alias lsa="ls -A"                      # show all files
alias cpr="cp -r"                      # copy directory
alias mkdir="mkdir -p"                 # create nested directories
alias nau="nautilus . &"               # open Nautilus in current dir
alias vim="vimx"                       # use vim with clipboard support
alias reload-bashrc="source ~/.bashrc" # reload .bashrc
alias mr="make && make run"            # make + run
alias cmr="clear && make && make run"  # clear + make + run

# Aliases for git commands
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitp="git push"

# Own aliases for cd
alias ..="cd .."
alias ...="cd ../.."
alias cd-music="cd ~/Music"
alias cd-downloads="cd ~/Downloads"
alias cd-telegram-downloads="cd ~/Downloads/Telegram\ Desktop"
alias cd-projects="cd ~/Projects"
alias cd-labs="cd ~/Labs"
alias cd-notes="cd ~/Notes"
alias cd-notes-private="cd ~/NotesPrivate"
alias cd-books="cd ~/Books/"
alias cd-books-new="cd ~/BooksNew/"
alias cd-giftbox="cd ~/Projects/Giftbox"
alias cd-giftbox-client="cd ~/Projects/Giftbox/ClientApp/src"

# Aliases for opening configs
alias opxterm="vim ~/XTerm"
alias opnautiterm="vim ~/.config/nautiterm.yml"
alias opvimrc="vim ~/.vimrc"
alias opbashrc="vim ~/.bashrc"
alias opinputrc="vim ~/.inputrc"
alias optmux="vim ~/.tmux.conf"
alias opzathurarc="vim ~/.config/zathura/zathurarc"

# Create directory and go there or
# Create yyyy-mm-dd directory (if no params)
function mkcd {
    newdir=$(date '+%Y-%m-%d')
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

# Copy file path to clipboard
function cp-path {
    realpath "${1}" | xclip -sel clip
}

# Create file with template
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

# Create project (directory) with template
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

# Run one-file project
function run {
    file=$1
    out="${file%.*}"
    # out=$(date +'%Y%m%d%H%M%S')
    flags="-Wall -Wextra"
    rem=""
    case "$1" in
        *.c)
            cmd="gcc ${flags} -std=c11 ${file} -o ${out} -lm && ./${out}"
            rem="rm ${out}"
            ;;
        *.cpp)
            cmd="g++ ${flags} -std=c++17 ${file} -o ${out} -lm && ./${out}"
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

# Clear screen and
# run one-file project
function cr {
    clear && run $1
}
