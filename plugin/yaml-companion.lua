local cfg = require("yaml-companion").setup({
	-- detect k8s schemas based on file content
	builtin_matchers = {
		kubernetes = { enabled = true },
	},

	-- schemas available in Telescope picker
	schemas = {
		kubernetes = "*.yaml",
		["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
		["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
		["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
		["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
		["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
		["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
		["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
		["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
		["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
		["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
		["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
		["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",

		--		-- not loaded automatically, manually select with
		--		-- :Telescope yaml_schema
		--		{
		--			name = "Argo CD Application",
		--			uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
		--		},
		--		{
		--			name = "SealedSecret",
		--			uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json",
		--		},
		--		-- schemas below are automatically loaded, but added
		--		-- them here so that they show up in the statusline
		--		{
		--			name = "Kustomization",
		--			uri = "https://json.schemastore.org/kustomization.json",
		--		},
		--		{
		--			name = "GitHub Workflow",
		--			uri = "https://json.schemastore.org/github-workflow.json",
		--		},
	},

	lspconfig = {
		settings = {
			yaml = {
				validate = true,
				schemaStore = {
					enable = false,
					url = "",
				},

				-- schemas from store, matched by filename
				-- loaded automatically
				schemas = require("schemastore").yaml.schemas({
					select = {
						"kustomization.yaml",
						"GitHub Workflow",
					},
				}),
			},
		},
	},
})

require("lspconfig")["yamlls"].setup(cfg)

require("telescope").load_extension("yaml_schema")

-- get schema for current buffer
local function get_schema()
	local schema = require("yaml-companion").get_buf_schema(0)
	if schema.result[1].name == "none" then
		return ""
	end
	return schema.result[1].name
end

require("lualine").setup({
	sections = {
		lualine_x = { "fileformat", "filetype", get_schema },
	},
})
