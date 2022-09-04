--- This module will load a random colorscheme on nvim startup process.

local utils = require('utils')

local M = {}

-- Colorscheme to its directory name mapping, because colorscheme repo name is not necessarily
-- the same as the colorscheme name itself.
M.colorscheme2dir = {
  gruvbox8 = "vim-gruvbox8",
  onedark = 'onedark.nvim',
  edge = 'edge',
  sonokai = 'sonokai',
  gruvbox_material = 'gruvbox-material',
  nord = 'nord.nvim',
  doom_one = 'doom-one.nvim',
  everforest = 'everforest',
  nightfox = 'nightfox.nvim',
  kanagawa = 'kanagawa.nvim',
  catppuccin = 'catppuccin'
}

M.gruvbox8 = function()
  -- Italic options should be put before colorscheme setting,
  -- see https://github.com/morhetz/gruvbox/wiki/Terminal-specific#1-italics-is-disabled
  vim.g.gruvbox_italics = 1
  vim.g.gruvbox_italicize_strings = 1
  vim.g.gruvbox_filetype_hi_groups = 1
  vim.g.gruvbox_plugin_hi_groups = 1

  vim.cmd [[colorscheme gruvbox8_hard]]
end

M.onedark = function()
  vim.cmd [[colorscheme onedark]]
end

M.edge = function()
  vim.g.edge_enable_italic = 1
  vim.g.edge_better_performance = 1

  vim.cmd [[colorscheme edge]]
end

M.sonokai = function()
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_better_performance = 1

  vim.cmd [[colorscheme sonokai]]
end

M.gruvbox_material = function()
  vim.g.gruvbox_material_enable_italic = 1
  vim.g.gruvbox_material_better_performance = 1

  vim.cmd [[colorscheme gruvbox-material]]
end

M.nord = function()
  vim.cmd [[colorscheme nord]]
end

M.doom_one = function()

  vim.cmd [[colorscheme doom-one]]
end

M.everforest = function()
  vim.g.everforest_enable_italic = 1
  vim.g.everforest_better_performance = 1

  vim.cmd [[colorscheme everforest]]
end

M.nightfox = function()
  vim.cmd [[colorscheme nordfox]]
end


M.kanagawa = function()
  vim.cmd [[colorscheme kanagawa]]
end

M.catppuccin = function()
  -- available option: latte, frappe, macchiato, mocha
  vim.g.catppuccin_flavour = "frappe"

  require("catppuccin").setup()

  vim.cmd [[colorscheme catppuccin]]
end

M.catppuccin()
