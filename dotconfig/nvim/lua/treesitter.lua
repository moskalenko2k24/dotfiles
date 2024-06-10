-- https://github.com/nvim-treesitter/nvim-treesitter

local treesitters = require('languages').treesitters

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  },
  ensure_installed = treesitters
}
