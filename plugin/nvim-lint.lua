local lint = require("lint")
require("lint").linters_by_ft = {
	python = { "pylint" },
}
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre", "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
