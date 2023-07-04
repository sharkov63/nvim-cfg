local lspconfig = require 'lspconfig'
local lsp_setup = require 'shar.protocol.lsp_setup'

return function()
  lspconfig.clangd.setup {
    on_attach = lsp_setup.on_attach,
    cmd = {
      "clangd",
      "--header-insertion=never",
      "--limit-references=100",
      "--limit-results=20",
      "-j=8",
      "--malloc-trim",
      "--background-index",
      "--pch-storage=memory",
    },
    capabilities = lsp_setup.capabilities,
  }
end