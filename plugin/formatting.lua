    local conform = require("conform")
    require("conform").setup({
    	formatters_by_ft = {
    		xml = { "xmlformat" },
    		json = { "prettier" },
    		hcl = { "hclfmt" },
    		yaml = { "yamlfmt" },
    		ansible = { "yamlfmt" },
    		markdown = { "prettier" },
    		lua = { "stylua" },
    		python = { "black" },
    	},
    	format_on_save = {
    		lsp_fallback = true,
    		async = false,
    		timeout_ms = 1000,
    	},
    	vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    		conform.format({
    			lsp_fallback = true,
    			async = false,
    			timeout_ms = 500,
    		})
    	end, { desc = "Format file or range (in visual mode)" }),
    })
