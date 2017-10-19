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
