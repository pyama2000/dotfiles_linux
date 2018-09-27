# Setting for greeting message
set fish_greeting ''

# Setting for anyenv
set -gx ANYENV_ROOT $HOME/.anyenv
set -x PATH $ANYENV_ROOT/bin $PATH

# Setting for pyenv
## Set enviroment valeue `PYENV_ROOT`
set -gx PYENV_ROOT $ANYENV_ROOT/envs/pyenv
set -x PATH $PYENV_ROOT/bin $PATH

## Set (pyenv init - fish)
set -x PATH $PYENV_ROOT/shims $PATH
set -gx PYENV_SHELL fish
source $PYENV_ROOT/libexec/../completions/pyenv.fish
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

# Setting for goenv
set -gx GOENV_ROOT $HOME/.anyenv/envs/goenv
set -x PATH $GOENV_ROOT/bin $PATH
set -x PATH $GOENV_ROOT/shims $PATH
command goenv rehash 2 > /dev/null

# Setting for golang
set -gx GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# Alias
# Git
alias ga 'git add .'
alias gc 'git commit'

## ghq (Manage the remote repositoty clones)
alias ghg 'ghq get'
alias ghl 'ghq list'
alias ghrm 'rm -rf (ghq root)/(ghq list | fzf)'
alias ghcd 'cd (ghq root)/(ghq list | fzf)'

## lazygit (Simple terminal UI for git commands)
alias lg 'lazygit'
