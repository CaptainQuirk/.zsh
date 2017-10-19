source ~/.zplug/init.zsh

zplug "supercrabtree/k"
source ~/.zsh/bundle/caniuse.plugin.zsh
#source ~/.zsh/bundle/colored-man-pages_mod.plugin.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
