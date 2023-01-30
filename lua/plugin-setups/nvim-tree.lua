-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  view = {
    hide_root_folder = true
  },
  renderer = {
    icons = {
      git_placement = 'after'
    }
  }
})

vim.keymap.set('n', '<leader>tf', ':NvimTreeToggle<CR>')
