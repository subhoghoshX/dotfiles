require('config/base')
require('config/lazy')

local function is_cursor_in_jsx()
  local line = vim.fn.getline(".")
  local indent = line:match("^%s*()")
  local position = vim.api.nvim_win_get_cursor(0)

  -- vim.treesitter.get_node() expects (0,0) based positions, but vim.api.nvim_win_get_cursor()
  -- returns (1,0) based positions. same for line:match("...")
  local row = position[1] - 1
  local column = indent - 1
  local node = vim.treesitter.get_node({ ignore_injections = false, pos = { row, column } })
  
  while node do
    local node_type = node:type()
    if node_type == "jsx_element" or
       node_type == "jsx_opening_element" or
       node_type == "jsx_closing_element" or
       node_type == "jsx_text" then
       return true
    elseif node_type == 'jsx_attribute' then
      return false
    end
    node = node:parent()
  end

  return false
end

local _get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  local lang = vim.treesitter.language.get_lang(filetype)

  if filetype == 'typescriptreact' and option == 'commentstring' then
    if is_cursor_in_jsx() then
      return "{/* %s */}"
    end
  end

  return _get_option(filetype, option)
end
