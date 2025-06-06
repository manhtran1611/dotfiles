-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- local nomap = vim.keymap.del
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "gj", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })

map({ "n", "v" }, "gh", "^", { desc = "Go to start of line" })
map({ "n", "v" }, "gl", "$", { desc = "Go to end of line" })
