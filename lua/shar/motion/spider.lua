local M = {}

function M.pack()
  local packer = require 'packer'
  packer.use 'chrisgrieser/nvim-spider'
end

function M.setup()
  vim.keymap.set(
    { 'n', 'o', 'x' },
    'w',
    "<cmd>lua require('spider').motion('w')<CR>",
    { desc = 'Spider-w' }
  )
  vim.keymap.set(
    { 'n', 'o', 'x' },
    'e',
    "<cmd>lua require('spider').motion('e')<CR>",
    { desc = 'Spider-e' }
  )
  vim.keymap.set(
    { 'n', 'o', 'x' },
    'b',
    "<cmd>lua require('spider').motion('b')<CR>",
    { desc = 'Spider-b' }
  )
end

return M
