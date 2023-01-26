vim.g.neoformat_try_node_exe = 1

--vim.api.nvim_command("autocmd BufWritePre *.ts Neoformat")
local cmd = vim.cmd

cmd [[
  autogroup fmt
    autocmd!
    autocmd BufWritePre *.ts Neoformat
  autogroup END
]]
