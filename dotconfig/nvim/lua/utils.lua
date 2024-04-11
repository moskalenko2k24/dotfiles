local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


local function set_indent(buffer_number, size)
  -- bo = buffer options
  vim.bo[buffer_number].tabstop = size      -- set indent width
  vim.bo[buffer_number].softtabstop = size  -- set tab width
  vim.bo[buffer_number].shiftwidth = size   -- set shift width
end

function M.set_indent_for(indent, patterns)
  vim.api.nvim_create_autocmd({ 'BufNew' , 'BufNewFile', 'BufRead' }, {
    pattern = patterns,
    callback = function(ev)
      local buffer_number = ev.buf
      set_indent(buffer_number, indent)
    end,
  })
end

return M
