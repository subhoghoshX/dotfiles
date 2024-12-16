return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.ts_ls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.tailwindcss.setup({})
    end,
  }
}
