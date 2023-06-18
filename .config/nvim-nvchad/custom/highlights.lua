-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  Visual = {
    bg = "#E5C07B",
    fg = "#282c34",
  },
  TbLineBufOn = {
    bg = "#393E48",
    fg = "#E06C75",
  },
  TbLineBufOff = {
    blend = 50,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  yank = { bg = "#E5C07B" },
}

return M
