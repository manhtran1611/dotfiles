local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    svelte = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier" },
    graphql = { "prettierd", "prettier" },
    java = { "google-java-format" },
    kotlin = { "ktlint" },
    ruby = { "standardrb" },
    markdown = { "prettierd", "prettier" },
    erb = { "htmlbeautifier" },
    html = { "prettierd" },
    bash = { "beautysh" },
    proto = { "buf" },
    rust = { "rustfmt" },
    -- yaml = { "yamlfix" },
    toml = { "taplo" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    fish = { "fish_indent" },
    sql = { "sqlfluff" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
