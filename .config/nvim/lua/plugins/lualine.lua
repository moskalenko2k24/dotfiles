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
  -- MODE filename[modified] encoding line-ending , line:column percentage
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
