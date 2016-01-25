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
