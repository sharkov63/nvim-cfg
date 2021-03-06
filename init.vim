" Entry point of my neovim configuration.

" General configuration
source ~/.config/nvim/plugins.vim     " plugins
source ~/.config/nvim/settings.vim    " general settings
source ~/.config/nvim/maps.vim        " general maps

" Filetype-specific configuration
source ~/.config/nvim/python_map.vim  " useful run maps for *.py files
source ~/.config/nvim/acm_cpp.vim     " custom filetype for acm cpp programs
source ~/.config/nvim/latex.vim       " utilities for using latex
source ~/.config/nvim/markdown.vim    " markdown settings

" nvim-lsp-installer configuration (in lua)
lua require('nvim-lsp-installer-config') 
