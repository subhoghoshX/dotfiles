local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

require('lspconfig')['tsserver'].setup{
  on_attach = on_attach
}
require'lspconfig'.emmet_ls.setup{
  on_attach = on_attach
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.cssls.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.tailwindcss.setup{
  on_attach = on_attach
}
require'lspconfig'.luau_lsp.setup{
  on_attach = on_attach
}
require'lspconfig'.eslint.setup{
  on_attach = on_attach
}
