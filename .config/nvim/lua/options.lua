require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

-- fold
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="curSearch", timeout=100})
augroup END
]]
