---@type Options
local M = {}

---@class Options
---
---Options for shar-nvim-cfg.
---
---@field editing Options_Editing
---@field key Options_Key
---@field localvimrc boolean Support project-local Neovim configuration files.
---@field navigation Options_Navigation
---@field protocol Options_Protocol
---@field toolkit Options_Toolkit

---@class Options_Editing
---
---Options which affect editing text ('editing' module).
---
---@field cmp {}? Use nvim-cmp autocompletion engine.
---@field enable_autopairs boolean Use nvim-autopairs bracket
---autocompletion plugin.

---@class Options_Key
---
---Options which affect keymaps or keyboard layouts (key module).
---
---@field enable_langmapper boolean Use langmapper.nvim plugin to
---automatically translate mappings to russian keyboard layout.
---@field layout_lib LayoutLib?

---@alias LayoutLib XkbSwitchLayoutLib
---
---Specify backend library which will implement API for
---getting/setting system keyboard layout.
---
---At the moment, only xkb-switch is supported, but support for more
---backend libraries can be easily added in the future.

---@class XkbSwitchLayoutLib
---
---Specify xkb-switch backend library for implementing layout API.
---
---@field [1] "xkb-switch" Declares that xkb-switch is used as a layout library.
---@field xkb_switch_lib_path string Path to xkb-switch shared library
---(usually has the name 'libxkbswitch.so').

---@class Options_Navigation
---
---Options which control navigation between files (or other entities).
---
---@field nvim_tree { enabled: boolean } Options for nvim-tree plugin;
---currently we can only enable or disable it.

---@class Options_Protocol
---
---Options for configuring various protocols: LSPs, formatters, linters,
---DAPs, treesitter, etc.
---
---@field formatter {}? Enable support of formatters.
---@field lsp {}? Enable support of LSP.
---@field treesitter {}? Enable treesitter support.
---@field linter {}? Enable linters support.

---@class Options_Toolkit
---
---Options for toolkit-specific configurations.
---
---@field acmcpp AcmCppOptions ACM-style programming in C++.
---@field coq { enabled: boolean } Coq proof assistant.
---@field dafny { enabled: boolean } Dafny programming & verification language.
---@field git { enabled: boolean } Git version control system.
---@field rust { enabled: boolean } Rust programming language.
---@field tex TexOptions
---@field markdown { enabled: boolean } Markdown preview editing support.

---@class AcmCppOptions
---
---Support of ACM-style programming in C++.
---
---@field enabled boolean Enable support of ACM C++.
---@field template_path string? Path to the ACM C++ template file.

---@class TexOptions
---
---TeX support.
---
---@field enabled boolean Enable TeX support.
---@field template_file string? Path to template TeX file.
---@field inkscape_figures string? Path to inkscape-figures tool:
---Inkscape figure manager.

---Default shar-nvim-cfg options.
---
---@type Options
local default_options = {
  editing = {
    cmp = nil,
    enable_autopairs = true,
  },
  key = {
    enable_langmapper = false,
    layout_lib = nil,
  },
  localvimrc = false,
  navigation = {
    nvim_tree = {
      enabled = false,
    },
  },
  protocol = {
    formatter = nil,
    lsp = nil,
    treesitter = nil,
    linter = nil,
  },
  toolkit = {
    acmcpp = {
      enabled = false,
      template_path = nil,
    },
    coq = {
      enabled = false,
    },
    dafny = {
      enabled = false,
    },
    git = {
      enabled = true,
    },
    rust = {
      enabled = false,
    },
    tex = {
      enabled = false,
      template_file = nil,
      inkscape_figures = nil,
    },
    markdown = {
      enabled = false,
    },
  },
}

---Handle shar-nvim-cfg options provided by the user.
---
---@param opts any Raw, user-provided options for shar-nvim-cfg.
---@return Options M Processed and ready-to-use options table.
---Throws an error if provided options are ill-formed.
function M.init(opts)
  opts = opts or {}
  if type(opts) ~= 'table' then
    error('[shar.options] init called with non-table second argument!', 3)
  end
  opts = vim.tbl_deep_extend('force', default_options, opts)
  setmetatable(M, { __index = opts })
  return M
end

return M
