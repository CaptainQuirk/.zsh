# checks
# ------

if [[ $(uname) = 'Linux' ]]; then
  IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
  IS_MAC=1
fi


# exports
# -------


export ACKRC=".ackrc"
export PATH=~/lib/npm/bin:~/Documents/System/gitextensions:~/.android/android-sdk/platform-tools:~/.android/android-sdk/tools:/opt/local/bin:/opt/local/sbin:~/bin:/~/.composer/vendor/bin:~/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export PYTHONPATH=/usr/local/bin:~/.powerline/plugins:$PYTHONPATH
export GOPATH=~/.go
export EDITOR=/usr/bin/editor

if [[ $IS_MAC -eq 1 ]]; then
  export LESSCHARSET=next
else
  export LESSCHARSET=utf-8
fi

export LC_ALL=en_GB.UTF-8


# colors
# ------

autoload colors; colors

# The variables are wrapped in %{%}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS

export CLICOLOR=1
export LS_COLORS=exfxcxdxbxegedabagacad


# setopt
# ------


# Basics #

setopt no_beep # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)


# Changing Directories #


# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt auto_cd

# if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt cdablevarS 

# cd automatically pushes new directory on the stack
setopt autopushd

# don't push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups 


# Expansion and Globbing #

# treat #, ~, and ^ as part of patterns for filename generation
setopt extended_glob


# History #


# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history

# save timestamp of command and duration
setopt extended_history

# Add comamnds as they are typed, don't wait until shell exit
setopt inc_append_history

# when trimming history, lose oldest duplicates first
setopt hist_expire_dups_first

# Do not write events to history that are duplicates of previous events
setopt hist_ignore_dups

# remove command line from history list when first character on the line is a space
setopt hist_ignore_space

# When searching history don't display results already cycled through twice
setopt hist_find_no_dups

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# don't execute, just expand history
setopt hist_verify

# imports new commands and appends typed commands to history
setopt share_history


# Correction #

# spelling correction for commands
setopt correct

# spelling correction for arguments
unsetopt correct_all


# Prompt #

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt prompt_subst

# only show the rprompt on the current prompt
setopt transient_rprompt

# Scripts and Functions #

setopt multios # perform implicit tees or cats when multiple redirections are attempted


# Functions
# ---------


function help() {
  local filepath="$PWD/README.md"
  if [[ -e $filepath ]];
  then
    pandoc -s -f markdown -t man --tab-stop=2 --toc README.md | man -l -
  else
    echo "No README.md file found in $PWD"
  fi
}

function man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

function touchme() {
  for f in "$@"; do mkdir -p "$(dirname "$f")"; done
  touch "$@"
}

# Aliases
# -------


## GENERAL ##

# Quitting with « q »
alias q='exit'

# Emptying a file
alias empty='cat /dev/null >'

## GIT ##

alias ga='git add'
alias gp='git push'
alias gl='git lg'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status -s'
alias gdc='git diff --color-words=.'
alias gd='git diff --color'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch -avv'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'
alias gbp='git pb'

alias ack="ack-grep"


## MISC ##

alias lynx='lynx -vikeys'

if [[ $IS_LINUX -eq 1 ]]; then
  alias tmux="TERM=screen-256color-bce tmux"
fi


## S ##

alias som="s -p duckduckgo \!mdn"
alias sow="s -p duckduckgo \!w"
alias sos="s -p duckduckgo \!so"
alias sogi="s -p duckduckgo \!gi"
alias sog="s -p duckduckgo \!g"
alias soh="s -p duckduckgo \!github"


# History
# -------

HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history


# autocomplete
# ------------

# When completing from the middle of a word, move the cursor to the end of the word
setopt always_to_end

# show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_menu

# any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt auto_name_dirs

# Allow completion from within a word/phrase
setopt complete_in_word

 # do not autoselect the first completion entry
unsetopt menu_complete

autoload -Uz compinit
compinit

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

if [[ $IS_MAC -eq 1 ]]; then
  export CLICOLOR=1
fi

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

if [ -f $GOPATH/src/github.com/zquestz/s/autocomplete/s-completion.bash ]; then
      . $GOPATH/src/github.com/zquestz/s/autocomplete/s-completion.bash
fi


# stty 
# ----

stty stop ''
stty start ''
stty -ixon
stty -ixoff

# Sourcing main .profile file
# in case important stuff is in there
source ~/.profile

# Source local rc.d directory if it exists
CONF_DIRECTORY="$PWD/.rc.d"
if [[ -d "$CONF_DIRECTORY" || -L "$CONF_DIRECTORY" ]]; then
  for file in $CONF_DIRECTORY/*.zsh; do
    source $file
  done
fi


# prompt
# ------

source ~/.zsh-powerline
source $POWERLINE_PATH

if [[ -d ~/.fortune ]]; then
  fortune ~/.fortune/fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1)
fi


# zplug
# -----

source ~/.zplug/init.zsh

zplug "supercrabtree/k"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


# keys
# ----

bindkey -v
export KEYTIMEOUT=1 # Don't take 0.4s to change modes

# Use 'jk' as key to switch to command mode
bindkey -s kj '\e'

# Movements
# ---------

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^b' backward-char
bindkey '^[f' forward-word
bindkey '^[b' backward-word


# Completion
# ----------

#bindkey '^I' complete-word


# History
# -------

# Move one item at a time in history
bindkey '^p' up-history
bindkey '^n' down-history

# Traditional backward and forward search in history
bindkey "^r" history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# Search every line up and down the history that starts like words
# before the cursor
bindkey "^k" up-line-or-beginning-search
bindkey "^j" down-line-or-beginning-search


# Text modifications
# ------------------

bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^[.' insert-last-word
bindkey '^w' backward-kill-word
bindkey '^o' kill-line
bindkey '^u' kill-whole-line
bindkey '^t' transpose-chars
bindkey '^[t' transpose-words

