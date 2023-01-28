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

-- From: https://github.com/nvim-tree/nvim-tree.lua/discussions/1517
vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
  callback = function(args)
    if vim.fn.expand "%:p" ~= "" then
      vim.api.nvim_del_autocmd(args.id)
      vim.cmd "noautocmd NvimTreeOpen"
      vim.cmd "noautocmd wincmd p"
      vim.cmd("e") -- Reload the opened file bcz syntax highlighting & other stuff doesn't work
    end
  end,
})

