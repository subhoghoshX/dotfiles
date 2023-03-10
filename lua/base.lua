vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.hlsearch = false

vim.opt.expandtab = true -- Convert tab to spaces
vim.opt.shiftwidth = 2 -- Move two space when pressing <Shift>

vim.opt.laststatus = 3 -- One global statusline
vim.api.nvim_set_hl(0, 'WinSeparator', { guibg=None }) -- Remove thick border bg b/w splits

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = ' '

vim.opt.timeout = false -- Make leader wait

vim.keymap.set('n', '<leader>dr', ':drop **/*')
vim.opt.wildignore = vim.opt.wildignore + '**/node_modules/**'

vim.opt.signcolumn = 'yes' -- Always keep the space for lsp signs
