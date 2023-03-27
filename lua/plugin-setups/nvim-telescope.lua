local actions = require "telescope.actions"
local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<Enter>"] = actions.select_tab_drop,
        ["<C-l>"] = actions.select_default
      },
      n = {
        ["<Enter>"] = actions.select_tab_drop,
        ["<C-l>"] = actions.select_default
      },
    }
  }
}

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- ripgrep binary needs to be installed for this to work
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
