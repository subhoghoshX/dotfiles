return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- npm i -g typescript typescript-language-server vscode-langservers-extracted @tailwindcss/language-server
      lspconfig.ts_ls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.tailwindcss.setup({})

      -- autocomplete
      vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
	  local bufnr = args.buf
	  local client = vim.lsp.get_client_by_id(args.data.client_id)
	  local methods = vim.lsp.protocol.Methods

	  if client.supports_method(methods.textDocument_completion) then
	    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
            vim.opt.completeopt = 'menu,preview,noselect'
	  end
	end
      })
    end,
  }
}
