# .bashrc

# Loading base config
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Private config
. ~/.private.sh

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

# PS1="\w\n$ "                           # custom prompt = "full path\n"
PS1="[\u@\H \W]$ "                       # custom prompt = "[user@host dir]$ "

# .inputrc
bind 'set bell-style none'               # disable bell
bind 'set completion-ignore-case on'     # ignore case for completion

# Show date / time in history
HISTTIMEFORMAT="%Y-%m-%d %T "

# Use NeoVim as default editor
export EDITOR="nvim"
alias v="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# Aliases for basic commands
alias py="python3"
alias wh="which"                                # which
alias c="clear"                                 # clear screen
alias cl="clear"                                # clear screen
alias cls="clear"                               # clear screen
alias nf="neofetch"                             # neofetch
alias sf="screenfetch"                          # screenfetch
alias up="uptime -p"                            # show uptime(hours, minutes)
alias  u="uptime -p"                            # show uptime(hours, minutes)
alias ls="ls --color --g"                       # color ls with --group-directories-first
alias l="ls -A"                                 # show all files
alias lsa="ls -A"                               # show all files
alias ll="ls -lA"                               # show all files, one file per row
alias free="free -h"                            # memory usage, human readable
alias ps-all="ps ax"                            # show all processes
alias open="xdg-open"                           # open file with default application
alias kill9="kill -9"                           # kill process
alias k9="kill -9"                              # kill process
alias du="du -sh"                               # disk usage: summary + human readable
alias cpr="cp -r"                               # copy directory
alias mkdir="mkdir -p"                          # create nested directories
alias nau="nautilus . &"                        # open Nautilus in current dir
alias reload-bashrc="source ~/.bashrc"          # reload .bashrc
alias mr="make && make run"                     # make + run
alias cmr="clear && make && make run"           # clear + make + run
alias st="git status"
alias ls-vimswap="ls ~/.vim/swapfiles/"

# Aliases for update
alias d-up="sudo dnf upgrade --refresh"
alias f-up="flatpak update"

# Aliases for git commands
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitp="git push"

# Own aliases for cd
alias ..="cd .."
alias ...="cd ../.."

# Flip video horizontally
function flip-video {
  ffmpeg -i "$1" -vf hflip -c:a copy "$2"
}

# Find process by name
function ps-find {
  ps ax | grep $1
}

alias find-viber-ps="ps ax | grep viber"

# Find Flatpak app by name
function fp-find {
  flatpak list | grep $1
}

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
  cd ~/Labs/"$(date '+%Y-%m-%d')"
}

# Print first line of --version
function ver {
  $1 --version | head -1
}

# Add directory to zip
function zip-dir {
  file="$1"
  [[ "${file}" == */ ]] && file="${file: : -1}"
  zip -r "${file}.zip" "${file}"
}

# Copy file path to clipboard using xclip
function cp-path {
  (echo -n "file://$(realpath $1)/") | xclip -sel clip
}

# Copy file to clipboard using xclip
function cp-file {
  echo "file://$(readlink -f $1)" | xclip -sel clip -t text/uri-list
}

# Copy file path to clipboard using wl-copy
# function cp-path {
#   (echo -n "file://$(realpath $1)/") | wl-copy
# }

# Copy file to clipboard using wl-copy
# function cp-file {
#   echo "file://$(readlink -f $1)" | wl-copy --type text/uri-list
# }

# Create file from template
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

# Create project (directory) from template
function new-project {
  declare -A templates
  templates=( ["c"]="C" ["cpp"]="C++" ["fpc"]="Free_Pascal" \
              ["java"]="Java" ["winapi"]="WinAPI" )
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
  elif [[ "$1" == "freeglut" ]]
  then
    cp -r ~/Templates/Freeglut/ "$2"
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
    *.hs)
      cmd="ghc $1 && ./${out}"
      rem="rm ${out} *.o *.hi"
      ;;
    *.cs) cmd="dotnet-exec $1" ;;
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

# cd && clear && echo 'My tmux sessions' && ls -1 *.sh

export TERM=xterm-256color
