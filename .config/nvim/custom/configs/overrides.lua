local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "tsx",
    "typescript",
    "javascript",
    "graphql",
    "fish",
    "c",
    "markdown",
    "markdown_inline",
    "http",
    "json",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "luacheck",
    "docker-compose-language-service",
    "dockerfile-language-server",


    -- web dev stuff
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "editorconfig-checker",
    "cssmodules-language-server",
    "json-to-struct",
    "prettierd",
    "eslint_d",

    -- vim
    "vim-language-server",

    -- dotfiles
    "dot-language-server",
    "bash-language-server",
    "shellcheck",

    -- misc
    "misspell",
    "grammarly-languageserver",
  },
}

return M
