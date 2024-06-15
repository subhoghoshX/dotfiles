local null_ls = require("null-ls")

null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettierd
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.keymap.set('n', '<leader>pre', function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end)
      end
    end
})
