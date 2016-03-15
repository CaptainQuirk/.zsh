#####################
# GENERAL           #
#####################

# Quitting with « q »
alias q='exit'

# Emptying a file
alias empty='cat /dev/null >'

#####################
# GIT               #
#####################

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


######################
# MISC               #
######################

alias lynx='lynx -vikeys'

if [[ $IS_LINUX -eq 1 ]]; then
  alias tmux="TERM=screen-256color-bce tmux"
fi


#####
# s #
#####

alias som="s -p duckduckgo \!mdn"
alias sow="s -p duckduckgo \!w"
alias sos="s -p duckduckgo \!so"
alias sogi="s -p duckduckgo \!gi"
alias sog="s -p duckduckgo \!g"
alias soh="s -p duckduckgo \!github"
