require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  sync_install = false,
  ignore_isntall = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  }
}
