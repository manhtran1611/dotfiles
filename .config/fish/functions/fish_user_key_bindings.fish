function fish_user_key_bindings
  # peco
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F

  # vim-like
  bind \cl forward-char

  # clear terminal
  bind \ct "printf '\033[2J\033[3J\033[H'; commandline -f repaint"

end
