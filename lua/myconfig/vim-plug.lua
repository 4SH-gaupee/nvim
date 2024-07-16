local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("folke/tokyonight.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.6" })
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("mbbill/undotree")
Plug("tpope/vim-fugitive")

Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")

Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("L3MON4D3/LuaSnip")

Plug("VonHeikemen/lsp-zero.nvim", { ["branch"] = "v3.x" })
Plug("mfussenegger/nvim-lint")
Plug("stevearc/conform.nvim")
Plug("aserowy/tmux.nvim")
Plug("b0o/schemastore.nvim")
Plug("someone-stole-my-name/yaml-companion.nvim", {
	["do"] = function()
		require("telescope").load_extension("yaml_schema")
	end,
})
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-tree/nvim-web-devicons")
vim.call("plug#end")

vim.cmd([[colorscheme tokyonight]])
