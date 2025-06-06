return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        svelte = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "biome", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier" },
        graphql = { "prettierd", "prettier" },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        ruby = { "standardrb" },
        markdown = { "prettierd", "vale", "prettier" },
        erb = { "htmlbeautifier" },
        html = { "prettierd" },
        bash = { "beautysh" },
        proto = { "buf" },
        rust = { "rustfmt" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        fish = { "fish_indent" },
        sql = { "sleek" },
      },
      formatters = {
        yamlfix = {
          -- Adds environment args to the yamlfix formatter
          env = {
            YAMLFIX_SEQUENCE_STYLE = "block_style",
          },
        },
      },
    },
  },
}
