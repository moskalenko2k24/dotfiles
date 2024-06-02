-- https://github.com/nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  },
  ensure_installed = { 'lua', 'vimdoc', 'c_sharp', 'c', 'cpp', 'python', 'markdown', 'markdown_inline', 'javascript', 'typescript', 'bash' }
}
