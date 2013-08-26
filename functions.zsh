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
    if [ -z "$TMUX" ]; then
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
