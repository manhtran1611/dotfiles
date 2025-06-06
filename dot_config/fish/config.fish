set fish_greeting ""

starship init fish | source
pyenv init - | source
kubectl completion fish | source

# aliases
alias ll "exa -l -g --icons -a"
alias llf "exa -l -g --icons -a --total-size"
alias gg "ghq get"
alias g git
alias v nvim
alias k kubectl
alias ssh "kitten ssh"
command -qv diff-so-fancy && alias diff diff-so-fancy
command -qv nvim && alias vim nvim
command -qv ddgr && alias d ddgr

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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# set --export KUBECONFIG "$HOME/.kube/configs/config.common-web:$HOME/.kube/configs/config.gsd-dev:$HOME/.kube/configs/config.gsd-qa:$HOME/.kube/configs/config.gsd-live:$HOME/.kube/configs/config.bws-qa:$HOME/.kube/configs/config.bws-live"

set kube_configs_path "$HOME/.kube/configs"
set kube_configs ""

for file in (find $kube_configs_path -type f)
    set kube_configs "$kube_configs:$file"
end
# WARN: This won't escape letter, so becareful with file name contains special characters (i.e: '.', ',', etc)
set --export KUBECONFIG (string trim --left ":" $kube_configs)

fish_add_path /home/manhtran/.spicetify

# fzf
fzf_configure_bindings --directory= --history=\cr

set -g BROWSER firefox-developer-edition
# for copilot neovim
# set -gx NODE_TLS_REJECT_UNAUTHORIZED 0
# export REQUESTS_CA_BUNDLE=/etc/ca-certificates/extracted/cadir/vn_ssl_cert.pem

# yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
