--- telescope.nvim: fuzzy finder over lists (mainly files).
-- @module navigation.telescope

local M = {}

local vim = vim

local packer = require 'packer'

local function setup_keymaps()
  local builtin = require 'telescope.builtin'
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fi', function()
    builtin.find_files { no_ignore = true }
  end, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>fr', builtin.resume, {})
end

function M.setup()
  packer.use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
  }
  setup_keymaps()
  local telescope = require 'telescope'
  telescope.load_extension('fzy_native')
end

return M
