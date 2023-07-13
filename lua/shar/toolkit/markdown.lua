local M = {}

function M.setup()
  local packer = require 'packer'
  packer.use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  }
end

return M
