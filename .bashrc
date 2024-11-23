# .bashrc

# Base config
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Private config
if [ -f ~/.private.sh ]; then
  . ~/.private.sh
fi

prompt_marker() {
    printf '\e]133;A\e\\'
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }prompt_marker

# flyctl => fly.io
export FLYCTL_INSTALL="/home/andrey/.fly"
export PATH="$FLYCTL_INSTALL/bin:/opt/lampp/bin:$PATH"

# PS1="\w\n$ "                           # custom prompt = "full path\n"
PS1="[\u@\H \W]$ "                       # custom prompt = "[user@host dir]$ "

# .inputrc
bind 'set bell-style none'               # disable bell
bind 'set completion-ignore-case on'     # ignore case for completion

# Show date / time in history
HISTTIMEFORMAT="%Y-%m-%d %T "

# Use NeoVim as default editor
export EDITOR="nvim"
alias vimx="/bin/vim"
alias v="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# Aliases for basic commands
alias tm="tmux"
alias py="python3"
alias wh="which"                                # which
alias cl="clear"                                # clear screen
alias cls="clear"                               # clear screen
alias ff="fastfetch"                            # fastfetch
alias up="uptime -p"                            # show uptime(hours, minutes)
alias ls="ls --color --g"                       # color ls with --group-directories-first
alias lsa="ls -A"                               # show all files
alias ll="ls -lA"                               # show all files, one file per line
alias l1="ls -1"                                # show all files, one file per line (short)
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
alias icat="kitty icat"                         # show image in kitty
alias st="git status"
alias ls-vimswap="ls ~/.vim/swapfiles/"

# One-letter aliases
alias t="tmux"
alias c="clear"
alias l="ls -A"
alias u="uptime -p"
alias r="run"
alias s="git status"
alias f="fastfetch"
alias n="nautilus . &"
alias q="exit"

# Replacing standard utilities
alias cat="bat --paging=never"
alias less="bat --paging=always"

# Aliases for update
alias fup="flatpak update"
alias dup="sudo dnf upgrade --refresh"

# Aliases for git commands
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitp="git push"

# Aliases for cd
alias ..="cd .."
alias ...="cd ../.."
alias cdfonts="cd ~/.local/share/fonts/"
alias cdnautilus-ext="cd ~/.local/share/nautilus-python/extensions"

# Aliases for opening configs
alias optmuxconf="$EDITOR ~/.tmux.conf"
alias opbashrc="$EDITOR ~/.bashrc"
alias opbashrcprivate="$EDITOR ~/.private.sh"
alias opxterm="$EDITOR ~/XTerm"
alias opfootini="$EDITOR ~/.config/foot/foot.ini"
alias opkittyconf="$EDITOR ~/.config/kitty/kitty.conf"
alias opzathurarc="$EDITOR ~/.config/zathura/zathurarc"
alias opnautiterm="$EDITOR ~/.config/nautiterm.yml"
alias opctags="$EDITOR ~/.ctags"
alias opgitconfig="$EDITOR ~/.gitconfig"
alias opgitignore="$EDITOR ~/.gitignore"

alias cdnvimconf="cd ~/.config/nvim/"
alias cdnvimswap="cd ~/.local/state/nvim/swap"
alias cdtgconf="cd ~/.local/share/TelegramDesktop/tdata"
alias cdgtkconf="cd /home/andrey/.config/gtk-4.0"

# Flip video horizontally
function flip-video {
  ffmpeg -i "$1" -vf hflip -c:a copy "$2"
}

# Find process by name
function ps-find {
  ps ax | grep $1
}

alias kill-viber="killall -9 Viber"

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
function cddate {
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
  templatePath="$(realpath ~/dotfiles/DevTemplates/$1)"
  projectPath="$(realpath $2)"

  if [ -d $templatePath ]; then
    cp -r $templatePath $projectPath
    echo "OK! Project was created!"
  else
    echo "Error! Template not found: $1"
  fi
}

# Run one-file project
# TO DO: refactor, change output filename + use flag for time
function run {
  file=$1
  out="${file%.*}"
  # out=$(date +'%Y%m%d%H%M%S')
  flags="-Wall -Wextra"
  rem=""
  case "$1" in
    *.c)
      cmd="gcc ${flags} -std=c11 ${file} -o ${out} -lm && time ./${out}"
      rem="rm ${out}"
      ;;
    *.cpp)
      cmd="g++ ${flags} -std=c++20 ${file} -o ${out} -lm && time ./${out}"
      rem="rm ${out}"
      ;;
    *.pas)
      cmd="fpc -l- -v0 ${file} && time ./${out}"
      rem="rm ${out} *.o"
      ;;
    *.js) cmd="time node $1" ;;
    *.ts)
      out="__${out}.js"
      cmd="tsc ${file} --outfile ${out} && time node ${out}"
      rem="rm ${out}"
      ;;
    *.py) cmd="time python $1" ;;
    *.cs) cmd="time dotnet-exec $1" ;;
    *.lua) cmd="time lua $1" ;;
    *.java) cmd="time java $1" ;;
    *.hs)
      cmd="ghc $1 && time ./${out}"
      rem="rm ${out} *.o *.hi"
      ;;
    *.go)
      cmd="time go run $1"
      ;;
    *.rs)
      cmd="rustc $1 && time ./${out}"
      rem="rm ${out}"
      ;;
    *) echo "Unknown project type" ;;
  esac
  echo $cmd
  eval "${cmd}; ${rem}"
  # eval "time (${cmd}; ${rem})"
}

# Clear screen and
# run one-file project
function cr {
  clear && run $1
}

# cd && clear && echo 'My tmux sessions' && ls -1 *.sh

export TERM=xterm-256color

# Search with google / open browser
function @google {
    xdg-open "https://google.com/search?q=$*"
}
