local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('folke/tokyonight.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('mbbill/undotree')
Plug('tpope/vim-fugitive')

vim.call('plug#end')

vim.cmd[[colorscheme tokyonight]]
