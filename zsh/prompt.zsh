# autoload docs:
# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html colors
# provides `$fg_bold` etc:
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Other-Functions
autoload -U colors && colors

# Expand functions in the prompt
setopt prompt_subst

# Hey, colors
prompt_color() {
  [[ -n "$1" ]] && print "%{$fg_bold[$2]%}$1%{$reset_color%}"
}

prompt_gray()   { print "$(prompt_color "$1" grey)"  }
prompt_yellow() { print "$(prompt_color "$1" yellow)"  }
prompt_green()  { print "$(prompt_color "$1" green)"  }
prompt_red()    { print "$(prompt_color "$1" red)"  }
prompt_cyan()   { print "$(prompt_color "$1" cyan)"  }
prompt_blue()   { print "$(prompt_color "$1" blue)"  }
prompt_magenta(){ print "$(prompt_color "$1" magenta)"  }

# If passing this a non-empty string, it will print prefix with a space.
prompt_spaced() { [[ -n "$1" ]] && print " $@" }

# Adds the current branch name
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)

  if [[ -n "$ref" ]]; then
    branchname=${ref#refs/heads/}
    colored_branchname=$(prompt_cyan "$branchname")

    echo "[$colored_branchname]"
  fi
}

#######################
#  GIT (branch, vcs)  #
#######################
#
# vcs_info docs: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats $(prompt_yellow "%b")
zstyle ':vcs_info:git*' actionformats $(prompt_red "%b|%a")

prompt_git_status() {
  local git_status="$(cat "/tmp/git-status-$$")"
  if print "$git_status" | grep -qF "Changes not staged" ; then
    print "changed"
  elif print "$git_status" | grep -qF "Changes to be committed"; then
    print "staged"
  elif print "$git_status" | grep -qF "Untracked files"; then
    print "untracked"
  elif print "$git_status" | grep -qF "working directory clean"; then
    print "unchanged"
  fi
}

prompt_git_status_symbol() {
  local letter
  # http://www.fileformat.info/info/unicode/char/2718/index.htm
  local x_mark="\u2718"
  # http://www.fileformat.info/info/unicode/char/2714/index.htm
  local checkmark="\u2714"

  case $(prompt_git_status) in
    changed) letter=$(prompt_red $x_mark);;
    staged) letter=$(prompt_yellow "S");;
    untracked) letter=$(prompt_cyan "UT");;
    unchanged) letter=$(prompt_green $checkmark);;
  esac

  prompt_spaced "$letter"
}

#######################
# This is the prompt  #
#######################
export PS1='$(git_prompt_info)[$(prompt_magenta "%1~")]$(prompt_git_status_symbol) '

# `precmd` is a magic function that's run right before the prompt is evaluated
# on each line.  Here, it's used to capture the git status to show in the
# prompt.
function precmd {
  vcs_info
  git status 2> /dev/null >! "/tmp/git-status-$$"
}

# Clear the screen before each command using the preexec hook function.
# http://zsh.sourceforge.net/Doc/Release/Functions.html
function preexec {
  clear
}

#
# http://zsh.sourceforge.net/Doc/Release/Functions.html
# function chpwd {
  # tree -atrAC -L 2
# }
