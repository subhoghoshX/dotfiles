vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes' -- Always keep the space for lsp signs and git signs

vim.opt.expandtab = true -- Convert tab to spaces
vim.opt.shiftwidth = 2 -- Move 2 spaces when pressing <Tab>

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.opt.timeout = false -- Make leader wait
