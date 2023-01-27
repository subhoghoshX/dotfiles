-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup({
  view = {
    hide_root_folder = true
  },
  tab = {
    sync = {
      open = true,
      close = true
    }
  },
  renderer = {
    icons = {
      git_placement = "after"
    },
  }
})

