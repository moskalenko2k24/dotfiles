local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  print('Installing packer close and reopen Neovim...')
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok = pcall(require, 'packer')
if not status_ok then
  return
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim';

  -- One dark theme
  use 'navarasu/onedark.nvim';

  -- Automatically switch to English in normal mode
  use 'lyokha/vim-xkbswitch';

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  };

  -- Auto Pairs (auto insert brackets)
  use 'jiangmiao/auto-pairs';

  -- Easy Motion for NeoVim
  -- don't use know
  -- use 'phaazon/hop.nvim';

  -- Calendar (:Calendar or <Leader>cal)
  use 'mattn/calendar-vim'

  -- Terminal in Vim
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  }

  -- Tabline
  use 'mkitt/tabline.vim';

  -- Change / add surrounding
  -- S) in visual, cs)] in normal
  -- use 'tpope/vim-surround';
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
  use 'terrortylor/nvim-comment';

  -- Showing marks visually
  use 'kshenoy/vim-signature';

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  };

  -- Markdown previewer (in browser)
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' }
  };

  use 'dhruvasagar/vim-table-mode';

  -- LSP config & LSP manager
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  };

  use 'hrsh7th/nvim-cmp';
  use 'hrsh7th/cmp-nvim-lsp';

  use {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  }
  require 'luasnip'.config.setup({});

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use "nvim-tree/nvim-web-devicons"; -- not strictly required, but recommended

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Pasting with indentation adjusted to destination context
  use 'sickill/vim-pasta';

  -- Better %
  use { 'andymass/vim-matchup', event = 'VimEnter' };
  -- helps to end certain structures automatically
  use 'tpope/vim-endwise';

  use 'alec-gibson/nvim-tetris';

  -- show occurence / occurences count when search
  use 'google/vim-searchindex';

  -- syntax highlighting for kitty.conf
  use 'fladson/vim-kitty';

  -- inlay hints for NeoVim 0.9
  -- use 'simrat39/inlay-hints.nvim';
  -- require("inlay-hints").setup();

  use 'kevinhwang91/nvim-bqf';

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
