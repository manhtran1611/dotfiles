# fnm
set PATH "/home/manhtran/.local/share/fnm" $PATH
fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines | source
