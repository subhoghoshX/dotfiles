-- base config
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'

-- plugins
vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim', -- dep of telescope
  'https://github.com/Mofiqul/vscode.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/neovim/nvim-lspconfig',
})

-- plugin setups

-- gitsigns
require('gitsigns').setup()

-- telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files)

vim.keymap.set('n', '<leader>gr', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- vscode theme
local vscode = require('vscode')
vim.cmd.colorscheme('vscode')

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  auto_install = false,
  highlight = {
    enable = true,

    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    additional_vim_regex_highlighting = false,
  },
}

-- lsp
local lspconfig = require('lspconfig')

-- npm i -g typescript typescript-language-server vscode-langservers-extracted @tailwindcss/language-server
lspconfig.ts_ls.setup({})
lspconfig.eslint.setup({})
lspconfig.tailwindcss.setup({})

-- autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local methods = vim.lsp.protocol.Methods

    if client:supports_method(methods.textDocument_completion) then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      vim.opt.completeopt = 'menu,preview,noselect'
    end
  end
})
