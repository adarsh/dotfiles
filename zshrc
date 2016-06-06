# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim
export VISUAL=vim

# load aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

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
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/texbin:~/bin'

# Enable zmv, alias to 'mmv' to allow matching like `mmv *.mp3 *.old.mp3`
autoload -U zmv
alias mmv='noglob zmv -W'

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
cdpath=($HOME $HOME/dev $HOME/devel $HOME/dev/fastly $HOME/dev/personal)

# You can hit C-X to open your $EDITOR
# with the command typed in the buffer
autoload edit-command-line
zle -N edit-command-line
bindkey '^X' edit-command-line

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# load thoughtbot/dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# Paths for Postgres.app binaries
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# unset RBENV_VERSION
# load rbenv if available
if which rbenv &>/dev/null ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Jump stuff
if which jump &>/dev/null ; then
  source `jump-bin --zsh-integration`
fi

# enable colored output from ls, etc
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Source everything in the zsh directory
BASE="$HOME/.zsh"

for file in "$BASE"/*.zsh; do
  source "$file"
done

# Add zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
