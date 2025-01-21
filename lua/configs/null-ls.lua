local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
return {
  sources = {
    null_ls.builtins.formatting.clang_format,
  },
  on_attach = function (client, buff)
    vim.api.nvim_clear_autocmds({
      group = augroup,
      buffer = buff,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = buff,
      callback = function ()
        vim.lsp.buf.format({ bufnr = buff })
      end
    })
  end
}
