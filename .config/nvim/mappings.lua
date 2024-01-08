---@type MappingsTable
---@class M
local M = {}
local opts = { noremap = true, silent = true }

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

M.disabled = {
  n = {
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",
    ["<leader>n"] = "",
  },
}

M.general = {
  n = {
    ["gh"] = { "^", "Go to first char of line", opts },
    ["gl"] = { "g_", "Go to end of line", opts },
    ["<leader>w"] = { "<cmd>:w<CR>", opts },
  },
  v = {
    ["<"] = { "<gv", "Continuous visual shifting left" },
    [">"] = { ">gv", "Continuous visual shifting right" },
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ["<leader>bn"] = {
      function()
        -- move buffer right
        require("nvchad.tabufline").move_buf(1)
      end,
    },

    ["<leader>bp"] = {
      function()
        -- move buffer right
        require("nvchad.tabufline").move_buf(-1)
      end,
    },
    -- new buffer
    ["<leader>bb"] = { "<cmd> enew <CR>", "new buffer" },

    -- close buffer + hide terminal buffer
    ["<S-q>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

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
      "<cmd>CodeActionMenu<CR>",
      "LSP code action",
      opts,
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

M.rest = {
  n = {
    ["<leader>cl"] = {
      "<Plug>RestNvim",
      "Run the request under the cursor",
      opts,
    },
    ["<leader>ck"] = {
      "<Plug>RestNvimLast",
      "View the last HTTP request",
      opts,
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

return M
