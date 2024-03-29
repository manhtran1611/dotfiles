local opt = vim.opt

opt.relativenumber = true

vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="yank", timeout=100})
augroup END
]]

vim.filetype.add {
  extension = {
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
}
