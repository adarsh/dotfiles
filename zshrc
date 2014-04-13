# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# project aliases
if [ -e "$HOME/.project_aliases" ]; then
  source "$HOME/.project_aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# keep more history in a .zhistory file
export HISTSIZE=1000
export HISTFILE=~/.zhistory

# ignore duplicate history entries
setopt hist_ignore_all_dups

# add to the history incrementally, not just when the shell exits
setopt inc_append_history

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# set localhost for postgres
export PGHOST=localhost

# recommended by brew doctor
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/texbin:~/bin'

# Enable zmv, alias to 'mmv' to allow matching like `mmv *.mp3 *.old.mp3`
autoload -U zmv
alias mmv='noglob zmv -W'

#rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
export PATH="./bin/stubs:$PATH"

# Fancy bundler - checks for existing gems and installs in parallel
function b {
  if [[ $# == 0 ]]
  then
    bundle check || bundle install -j8 && bundle --binstubs=./bin/stubs -j8
  else
    bundle "$@"
  fi
}

# Just type `cd <DIRECTORY_UNDER_ONE_OF_THESE_DIRS>` to go there, without
# the full path. Autocomplete and everything! /ht @gabebw
cdpath=($HOME/dev $HOME/dev/thoughtbot $HOME)
