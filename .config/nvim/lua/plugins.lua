local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok = pcall(require, "packer")
if not status_ok then
  return
end



vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim';

  -- One dark theme
  use 'navarasu/onedark.nvim'
  require('onedark').setup {
    style = 'deep',
    code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
  }

  -- Automatically switch to English in normal mode
  use 'lyokha/vim-xkbswitch';
  vim.g.XkbSwitchEnabled = 1;
  vim.g.XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so';

  -- Status line
  -- MODE filename[modified] encoding[line ending], line:column percentage
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
-- MODE filename[modified] encoding[line ending], line:column percentage
  sections = {
      lualine_a = {'mode'},
      lualine_b = {
          'filename', 'encoding',
          {
              'fileformat',
              icons_enabled = true,
              symbols = {
                  unix = 'unix',
                  dos = 'dos',
                  mac = 'mac',
              },
          },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {'location'},
      lualine_z = {'progress'}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

  -- Auto pairs
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- Tabline
  use 'mkitt/tabline.vim'

  -- Vim surrond
  -- use({
  --     "kylechui/nvim-surround",
  --     tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  --     config = function()
  --         require("nvim-surround").setup({
  --             -- Configuration here, or leave empty to use defaults
  --         })
  --     end
  -- })
  use 'tpope/vim-surround'

  -- Comment plugin
  -- gcc = comment line
  -- gc = comment line in Visual mode
  use "terrortylor/nvim-comment"
  require('nvim_comment').setup()

  -- Showing marks visually
  -- use 'chentoast/marks.nvim'
  -- require('marks').setup()
  use 'kshenoy/vim-signature'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>f', builtin.find_files, {})
  vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
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
      ensure_installed = { "omnisharp", "tsserver", "clangd" },
      automatic_installation = true
  }

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  require("cmp").setup {
      sources = {
          { name = 'nvim_lsp' }
      }
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  require'nvim-treesitter.configs'.setup{
      highlight = {
          enable = true
      },
  }

  use 'sickill/vim-pasta'
  use 'editorconfig/editorconfig-vim'
  -- use 'hrsh7th/nvim-pasta'
  -- require('pasta').setup()
  -- vim.keymap.set({ 'n', 'x' }, 'p', require('pasta.mappings').p)
  -- vim.keymap.set({ 'n', 'x' }, 'P', require('pasta.mappings').P)
  -- vim.keymap.set({ 'n' }, '<C-p>', require('pasta.mappings').toggle_pin)

  -- TO DO: try this
  -- use 'rstacruz/vim-closer'
  -- use 'tpope/vim-endwise'

  -- TO DO: try this
  -- Load on an autocommand event

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end -- use {'andymass/vim-matchup', event = 'VimEnter'}
end)
