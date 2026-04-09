-- base config
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.cmd.colorscheme('catppuccin')

-- plugins and their setups
vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/folke/snacks.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/stevearc/conform.nvim',
})

-- gitsigns
require('gitsigns').setup({
  signcolumn = false,
  linehl = true,
  on_attach = function()
    local gitsigns = require('gitsigns')
    vim.keymap.set('n', '<leader>d', gitsigns.preview_hunk)
  end
})

-- snacks picker
require('snacks').setup()
vim.keymap.set('n', '<leader>a', function() Snacks.picker() end)
vim.keymap.set('n', '<leader>f', function() Snacks.picker.files({ hidden = true }) end)
vim.keymap.set('n', '<leader>b', function() Snacks.picker.buffers() end)
vim.keymap.set('n', '<leader>gr', function() Snacks.picker.grep() end)
vim.keymap.set('n', '<leader>~', function() Snacks.picker.files({ cwd = '~', hidden = true }) end)
vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end)

-- treesitter
require('nvim-treesitter').install({'astro', 'bash', 'c', 'css', 'html', 'javascript', 'json', 'json5', 'lua', 'markdown', 'sql', 'todotxt', 'tsx', 'typescript', 'zig'})

-- lsp: npm i -g typescript typescript-language-server vscode-langservers-extracted @tailwindcss/language-server
vim.lsp.enable({'ts_ls', 'eslint', 'tailwindcss'})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local methods = vim.lsp.protocol.Methods

    if client:supports_method(methods.textDocument_completion) then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true }) -- autocomplete
      vim.opt.completeopt = 'menu,preview,noselect'
    end
  end
})

-- conform: npm install -g @fsouza/prettierd
require("conform").setup({
  formatters_by_ft = {
    html = { "prettierd" },
    css = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" }, -- tsconfig.json is detected as jsonc. check with `:set ft?`
    yaml = { "prettierd" },
    markdown = { "prettierd" },
  },
  format_on_save = {},
})
