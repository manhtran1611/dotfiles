-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- filetype
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.filetype.add({
  filename = {
    [".kbd"] = "lisp",
  },
  pattern = { [".*/kmonad/*.kbd"] = "lisp" },
})
