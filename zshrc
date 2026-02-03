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
    bundle check || bundle install && bundle --binstubs=./bin/stubs
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
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Note that these FZF options are used by fzf.vim automatically! Yay!
# Use a separate tool to smartly ignore files
export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file ~/.ignore'

# Jellybeans theme: https://github.com/junegunn/fzf/wiki/Color-schemes
export FZF_DEFAULT_OPTS='--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
--bind j:page-up,k:page-down
--reverse --tac
'
export PATH="/usr/local/sbin:$PATH"

# Disable Spring on all Rails apps
export DISABLE_SPRING=true
export PATH=/opt/homebrew/bin:/usr/local/sbin:/Applications/Postgres.app/Contents/Versions/latest/bin:.git/safe/../../bin:/Users/adarsh/.bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/texbin:~/bin

# Add zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load directory-specific shell config (https://direnv.net/)
eval "$(direnv hook zsh)"

# Created by `pipx` on 2024-10-12 01:10:59
export PATH="$PATH:/Users/adarsh/.local/bin"

# Activate mise en place for Ruby version management
eval "$(mise activate zsh)"
