-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- One dark color scheme
  use 'navarasu/onedark.nvim'

  -- Auto pairs
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  
  -- Vim surrond
  -- TO DO: Fix strange behaviour when pressing S
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

  -- Comment plugin
  -- gcc = comment line
  -- gc = comment line in Visual mode
  use "terrortylor/nvim-comment"
  require('nvim_comment').setup()

  -- Showing marks visually
  use 'chentoast/marks.nvim'
  require('marks').setup()
  
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>f', builtin.find_files, {})
  vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
  local actions = require("telescope.actions")
  require("telescope").setup{
      defaults = {
          mappings = {
              i = {
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous
              },
          },
      }
}
  -- Markdown previewer (in browser)
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use 'dhruvasagar/vim-table-mode'

  -- LSP config & LSP manager
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
  
  require("mason").setup()
  require("mason-lspconfig").setup {
      ensure_installed = { "omnisharp", "tsserver" },
      automatic_installation = true
  }


  -- use 'hrsh7th/nvim-pasta'
  -- vim.keymap.set({ 'n', 'x' }, 'p', require('pasta.mappings').p)
  -- vim.keymap.set({ 'n', 'x' }, 'P', require('pasta.mappings').P)
  -- vim.keymap.set({ 'n' }, '<C-p>', require('pasta.mappings').toggle_pin)

  -- This is the default. You can omit `setup` call if you don't want to change this. 
  -- require('pasta').setup()
  -- require('pasta').setup {
  --     converters = {
  --         require('pasta.converters').indentation,
  --     },
  --     paste_mode = true,
  --     prevent_diagnostics = false,
  --     next_key = vim.api.nvim_replace_termcodes('<C-p>', true, true, true),
  --     prev_key = vim.api.nvim_replace_termcodes('<C-n>', true, true, true),
  -- }

  -- Simple plugins can be specified as strings
  -- use 'rstacruz/vim-closer'

  -- TO DO: try this
  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}
end)
