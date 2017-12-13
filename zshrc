# Source every file in this directory
source ./checks.zsh
source ./exports.zsh
source ./colors.zsh
source ./setopt.zsh
source ./functions.zsh
source ./aliases.zsh
source ./history.zsh
source ./autocomplete.zsh
source ./stty.zsh

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

source ./prompt.zsh

if [[ -d ~/.fortune ]]; then
  fortune ~/.fortune/fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1)
fi

source ./plugins.zsh
source ./keys.zsh

#eval $(gpg-agent --daemon)
