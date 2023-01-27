local sidebar = "NvimTree"

require('bufferline').setup{
  options = {
    close_command = function(bufnr)
      print(bufnr)
      vim.cmd("bdelete")
      vim.cmd("bp")
    end,
    offsets = {
      {
        filetype = "NvimTree",
        --text = "File Explorer",
      }
    }
  }
}
