vim.opt_local.cursorcolumn = true -- Highlight the current column
vim.opt_local.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.opt_local.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt_local.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt_local.expandtab = true -- Expand tab to 2 spaces

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
local lint_augroup = vim.api.nvim_create_augroup("setIndent", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
	group = "setIndent",
	pattern = {
		"css",
		"html",
		"javascript",
		"lua",
		"markdown",
		"md",
		"typescript",
		"scss",
		"xml",
		"xhtml",
		"yaml",
	},
	command = "setlocal shiftwidth=2 tabstop=2",
})
