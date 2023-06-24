local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


function M.set_indent(size)
  vim.opt.tabstop = size      -- set indent width
  vim.opt.softtabstop = size  -- set tab width
  vim.opt.shiftwidth = size   -- set shift width
end

M.autocmd = vim.api.nvim_create_autocmd

function M.set_indent_for(indent, patterns)
  M.autocmd({ 'BufNew' , 'BufNewFile', 'BufRead' }, {
    pattern = patterns,
    callback = function()
      M.set_indent(indent)
    end,
  })
end

return M
