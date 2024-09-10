---@type MappingsTable
---@class M
local M = {}
local opts = { noremap = true, silent = true }

local map = vim.keymap.set

map("n", "gh", "^", opts, { desc = "Go to first char of line" })
map("n", "gl", "g_", opts, { desc = "Go to end of line" })

map("n", "<leader>w", "<cmd>:w<CR>", opts, { desc = "Save file" })
map("n", "<C-s>", "<cmd>:w<CR>", opts, { desc = "Save file" })

map("v", "<", "<gv", opts, { desc = "Continuous visual shifting left" })
map("v", ">", ">gv", opts, { desc = "Continuous visual shifting right" })
map("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts, { silent = true, desc = "Paste without yank" })

map("n", "<S-l>", "<cmd>:lua require('nvchad.tabufline').tabuflineNext()<CR>", opts)
map("n", "<S-h>", "<cmd>:lua require('nvchad.tabufline').tabuflinePrev()<CR>", opts)

map("n", "<leader>bn", "<cmd>:lua require('nvchad.tabufline').move_buf(1)<CR>", opts)
map("n", "<leader>bp", "<cmd>:lua require('nvchad.tabufline').move_buf(-1)<CR>", opts)

M.lspconfig = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
      opts,
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        require("actions-preview").code_actions()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["gj"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

M.telescope = {
  n = {
    -- Git conflict
    ["<leader>gl"] = { "<cmd> Gitsigns blame_line <CR>", "Show blame line" },
    ["<leader>Go"] = { "<cmd> DiffviewOpen <CR>", "Diff view open" },
    ["<leader>Gc"] = { "<cmd> DiffviewClose <CR>", "Diff view close" },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
    ["<leader>sf"] = {
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      "Search on current file",
    },
  },
  v = {
    ["<leader>sw"] = { "<esc><cmd>lua require('spectre').open_visual()<CR>", "Search current word" },
  },
}

M.peepsight = {
  n = {
    ["<leader>pe"] = { "<cmd>PeepsightEnable<CR>", "Enable highlight current function", opts },
    ["<leader>pd"] = { "<cmd>PeepsightDisable<CR>", "Disable highlight current function", opts },
  },
}

M.noice = {
  n = {
    ["<leader>nl"] = { "<cmd>Noice last<CR>", "Show last message in a popup", opts },
    ["<leader>nd"] = { "<cmd>Noice dismiss<CR>", "Dismiss all visible messages", opts },
  },
}

M.log = {
  n = {
    ["<leader>lg"] = { "<cmd>:lua require('logsitter').log()<CR>", "Show log", opts },
  },
}

M.tabufline = {
  n = {
    ["<S-q>"] = { "<cmd>:lua require('nvchad.tabufline').close_buffer()<CR>", "Close buffer", opts },
  },
}

M.kulala = {

  n = {
    ["<leader>cl"] = {
      "<cmd>:lua require('kulala').run()<CR>",
      "Run request",
      opts,
    },
  },
}

return M
