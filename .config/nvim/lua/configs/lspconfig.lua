-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "css_variables",
  "cssls",
  "eslint",
  "ts_ls",
  "dockerls",
  "dotls",
  "graphql",
  "jsonls",
  "vimls",
  "yamlls",
  "prismals",
  "textlsp",
  "stylelint_lsp",
  "docker_compose_language_service",
  "sqlls",
  "terraformls",
  "tailwindcss",
  "gitlab_ci_ls",
  -- markdown
  "vale_ls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.yamlls.setup = {
  settings = {
    yaml = {
      keyOrdering = false,
      schemas = {
        kubernetes = "k8s-*.yaml",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/manifest/**/*.yaml",
      },
    },
  },
}

lspconfig.eslint.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

lspconfig.stylelint_lsp.setup {
  filetypes = { "css", "scss", "less" },
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
    },
  },
}

lspconfig.cssls.setup {
  filetypes = { "css", "scss", "less" },
  capabilities = nvlsp.capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}

vim.diagnostic.config { virtual_text = false }
