local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({})
lspconfig.emmet_language_server.setup({})
lspconfig.eslint.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.astro.setup({})
lspconfig.biome.setup({})
lspconfig.jsonls.setup{}

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format({
      filter = function(client)
        return client.name == 'biome'
      end
    })
  end
})

-- Set the global shortcuts
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}), -- I don't understand what this does
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts) -- ?
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts) -- ?
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts) -- ?
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
  end
})
