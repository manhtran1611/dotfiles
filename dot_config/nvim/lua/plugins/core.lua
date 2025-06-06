return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "hadolint",
        "css-lsp",
        "jq-lsp",
        "html-lsp",
        "luacheck",
        "stylelint-lsp",
        "tailwindcss-language-server",
        "terraform-ls",
        "typos",
        "vale-ls",
        "yaml-language-server",
        "prisma-language-server",
        "biome",
        "eslint_d",
        "prettierd",
        "eslint-lsp",
      },
    },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      default_mappings = false, -- setting this to false removes all the default mappings
      mappings = {
        i = {
          -- map kj to exit insert mode
          k = {
            j = "<Esc>",
          },
          -- map jk and jj  to exit insert mode
          j = {
            k = "<Esc>",
            j = "<Esc>",
          },
        },
      },
    },
  },
}
