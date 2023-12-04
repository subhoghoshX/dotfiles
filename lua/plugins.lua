local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin
  {'nvim-treesitter/nvim-treesitter', build = 'TSUpdate'},
  'Mofiqul/vscode.nvim',
  'lewis6991/gitsigns.nvim',
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }}
})

-- Load plugin setups
require('plugin-setups')
