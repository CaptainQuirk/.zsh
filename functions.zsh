# load_teamocil
#
# 
function load_teamocil(){ 

  # Looking for .teamocil.yml file in the current
  # directory
  if [ -f ".teamocil.yml" ]; then

    # make project_name according to directory
    project_name=`basename \`pwd\``
          
    # If no session, creating it
    tmux has-session -t $project_name > /dev/null 2>&1
    if [ "$?" -eq 1 ] ; then
      read -p "No Session « $project_name » found. Press [enter] to create."
      tmux new-session -s $project_name 'teamocil --layout .teamocil.yml'
    else
      read -p "Session « $project_name » found. Press [enter] to connect."
      tmux attach-session -t $project_name
    fi

    # Attaching project session
    #tmux attach-session -t $project_name
  fi
}

function d () { builtin cd "$@" && load_teamocil; }
