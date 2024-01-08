local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- diagnostics
  b.diagnostics.eslint_d,
  b.diagnostics.stylelint,
  b.diagnostics.editorconfig_checker,
  b.diagnostics.fish,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- formatting
  b.formatting.deno_fmt,
  b.formatting.eslint_d,
  b.formatting.prettierd,
  b.formatting.stylelint,
  b.formatting.stylua,
  b.formatting.shfmt,

  -- Code action
  b.code_actions.eslint_d,
  b.code_actions.refactoring,
  b.code_actions.cspell,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
