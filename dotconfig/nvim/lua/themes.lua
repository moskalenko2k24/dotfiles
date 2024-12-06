-- https://github.com/catppuccin/nvim
-- https://github.com/navarasu/onedark.nvim
-- https://github.com/folke/tokyonight.nvim
-- https://github.com/Mofiqul/vscode.nvim

-- :Themes command
vim.api.nvim_create_user_command('Themes', function ()
  require('theme-picker').open_theme_picker()
end, {})

local function loadVSCode()
  local c = require('vscode.colors').get_colors();
  require('vscode').setup({
      style = 'light',
      transparent = true,
      italic_comments = true,
      underline_links = true,
      disable_nvimtree_bg = true,
      color_overrides = {
          vscLineNumber = '#FFFFFF',
      },
      group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
      }
  });
end

local function setVSCodeLight()
  vim.o.background = 'light';
  loadVSCode();
  require('vscode').load('light');
end

local function setVSCodeDark()
  vim.o.background = 'dark';
  loadVSCode();
  require('vscode').load('dark');
end

local function setOneDarkDeep()
  vim.o.background = 'dark';
  require('onedark').setup({
    style = 'deep',
    code_style = {
      comments = 'italic',
      keywords = 'bold',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    }
  });
  require('onedark').load();
end

require('theme-picker').setup({
  themes = {
    {
      name = 'OneDark (Deep)',
      colorscheme = 'onedark',
      before = setOneDarkDeep
    },
    {
      name = 'Wildcharm',
      colorscheme = 'wildcharm'
    },
    {
      name = 'Tokyo Night',
      colorscheme = 'tokyonight'
    },
    {
      name = 'Tokyo Night (Night)',
      colorscheme = 'tokyonight-night'
    },
    {
      name = 'Tokyo Night (Storm)',
      colorscheme = 'tokyonight-storm',
    },
    {
      name = 'Tokyo Night (Moon)',
      colorscheme = 'tokyonight-moon',
    },
    {
      name = 'Tokyo Night (Day)',
      colorscheme = 'tokyonight-day',
    },
    {
      name = 'Catppuccin',
      colorscheme = 'catppuccin'
    },
    {
      name = 'Catppuccin (Latte)',
      colorscheme = 'catppuccin-latte'
    },
    {
      name = 'Catppuccin (Frappe)',
      colorscheme = 'catppuccin-frappe'
    },
    {
      name = 'Catppuccin (Macchiato)',
      colorscheme = 'catppuccin-macchiato'
    },
    {
      name = 'Catppuccin (Mocha)',
      colorscheme = 'catppuccin-mocha'
    },
    {
      name = 'VS Code (Dark)',
      colorscheme = 'vscode',
      before = setVSCodeDark
    },
    {
      name = 'VS Code (Light)',
      colorscheme = 'vscode',
      before = setVSCodeLight
    },
  },
  livePreview = true
});

-- default colorscheme
setOneDarkDeep();
