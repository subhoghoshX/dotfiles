return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    config = function()
      local cc = require('CopilotChat')

      cc.setup({
	separator = ' ',
	show_folds = false,
	question_header = '## Subho 🗿',
	answer_header = '## Copilot 🤖',
      })

      vim.keymap.set('n', '<leader>cc', ':CopilotChatOpen<CR>')
      vim.keymap.set('n', '<leader>cs', ':CopilotChatStop<CR>')

      -- to make the chat window open on the right
      vim.opt.splitright = true

      vim.api.nvim_create_autocmd('BufEnter', {
	pattern = 'copilot-*',
	callback = function()
	  vim.opt_local.conceallevel = 0
	end
      })
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
    enabled = false,
  },
}
