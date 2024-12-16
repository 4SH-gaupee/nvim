local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ansiblels",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

vim.filetype.add({
	pattern = {
		-- ansible playbook
		[".*/.*playbook.*.ya?ml"] = "yaml.ansible",
		[".*/.*tasks.*/.*ya?ml"] = "yaml.ansible",
		[".*/.*roles.*/.*ya?ml"] = "yaml.ansible",
		[".*/.*ansible.*/.*ya?ml"] = "yaml.ansible",
		[".*/.*collections.*/.*ya?ml"] = "yaml.ansible",
		[".*/local.ya?ml"] = "yaml.ansible",
		[".*/.j2"] = "jinja",
	},
})

local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

require("cmp").setup({
	sources = {
		{ name = "path" },
	},
})
cmp.setup({
	sources = {
		{
			name = "path",
			option = {
				-- Options go into this table
			},
		},
	},
})

vim.diagnostic.config({
	-- update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})
