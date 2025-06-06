-- put your general Neovim configurations here
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set({ "n" }, "<C-e>", "5<C-e>", {})
vim.keymap.set({ "n" }, "<C-y>", "5<C-y>", {})

-- add kitty-scrollback.nvim to the runtimepath to allow us to require the kitty-scrollback module
-- pick a runtimepath that corresponds with your package manager, if you are not sure leave them all it will not cause any issues
vim.opt.runtimepath:append(vim.fn.stdpath "data" .. "/lazy/kitty-scrollback.nvim") -- lazy.nvim
vim.opt.runtimepath:append(vim.fn.stdpath "data" .. "/site/pack/packer/opt/kitty-scrollback.nvim") -- packer
vim.opt.runtimepath:append(vim.fn.stdpath "data" .. "/site/pack/mikesmithgh/start/kitty-scrollback.nvim") -- pack
require("kitty-scrollback").setup {}
