local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "css_variables",
  "cssls",
  "cssmodules_ls",
  "eslint",
  "tsserver",
  "dockerls",
  "dotls",
  "graphql",
  "grammarly",
  "jsonls",
  "vimls",
  "yamlls",
  "prismals",
  "textlsp",
  "stylelint_lsp",
  "docker_compose_language_service",
  "sqlls",
  "terraform_lsp",
  "terraformls",
  "tailwindcss",
  "gitlab_ci_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.yamlls.setup = {
  schemas = {
    ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
  },
}

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
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
  capabilities = capabilities,
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

lspconfig.cssmodules_ls.setup {
  filetypes = { "css", "scss", "less" },
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}
