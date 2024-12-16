return {
  {
    'Mofiqul/vscode.nvim',
    config = function()
      local vscode = require('vscode')

      vim.cmd.colorscheme('vscode')
    end,
  }
}
