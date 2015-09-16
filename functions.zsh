# load_teamocil
#
#
function load_teamocil(){

  # Looking for .teamocil.yml file in the current
  # directory
  if [ -f ".teamocil.yml" ]; then

    # make project_name according to directory
    project_name=`basename \`pwd\``

    # If already in a tmux session ...
    if [ ! -z "$TMUX" ]; then
      # If the session does not exit
      # → creating the session
      tmux has-session -t $project_name > /dev/null 2>&1
      if [ "$?" -eq 1 ]; then
        echo "No Session « $project_name » found."
        tmux new-session -d -s $project_name 'teamocil --layout .teamocil.yml'
      else
        echo "Session « $project_name » found."
      fi

      # Switching to it in current client
      tmux switch-client -c $TTY -t $project_name

    # ... Not in a tmux session
    else

      # If the session doesn't exist
      # → creating it
      tmux has-session -t $project_name > /dev/null 2>&1
      if [ "$?" -eq 1 ]; then
        echo "No Session « $project_name » found."
        tmux new-session -d -s $project_name 'teamocil --layout .teamocil.yml'

      # Else, the session exists
      # → attaching to it
      else
        echo "Session « $project_name » found."
      fi

      tmux attach-session -t $project_name
    fi
  fi
}

function d () { builtin cd "$@" && load_teamocil; }

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
