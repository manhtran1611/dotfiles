set fish_greeting ""

starship init fish | source
pyenv init - | source

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l" 
alias lla "ll -A"
alias gg "ghq get"
alias g git
alias v nvim
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.deno/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

switch (uname)
  case Darwin
  source (dirname (status --current-filename))/config-osx.fish
  case Linux
  source (dirname (status --current-filename))/config-linux.fish
  case '*'
  source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

if type -q afx
  afx completion fish | source
end
