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
local lint_augroup = vim.api.nvim_create_augroup('setIndent', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
    group = 'setIndent',
    pattern = {
        'css',
        'html',
        'javascript',
        'lua',
        'markdown',
        'md',
        'typescript',
        'scss',
        'xml',
        'xhtml',
        'yaml'
    },
    command = 'setlocal shiftwidth=2 tabstop=2'
})
