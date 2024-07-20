local chat = require("CopilotChat")

chat.setup({
  separator = ' ',
  show_folds = false,
  show_help = false,
  question_header = '## Subho 🗿',
  answer_header = '## Copilot 🤖',
  mappings = {
    complete = {
      insert = '',
    }
  }
})

vim.keymap.set("n", "<leader>cco", ":CopilotChatOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ccs", ":CopilotChatStop<CR>", { noremap = true, silent = true })

-- to make the chat window open on the right
vim.opt.splitright = true

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = 'copilot-*',
    callback = function()
        vim.opt_local.conceallevel = 0
    end
})
