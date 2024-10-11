return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"marksman",
					"ltex",
					"arduino_language_server",
					"angularls",
					"tsserver",
					"pylsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.ltex.setup({
				capabilities = capabilities,
			})
			lspconfig.arduino_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			local languageServerPath = "C:/Users/rafal.lenart/AppData/Local/nvim-npm"
			local angular_cmd = {
				"node",
				languageServerPath .. "/node_modules/@angular/language-server/index.js",
				"--stdio",
				"--tsProbeLocations",
				languageServerPath,
				"--ngProbeLocations",
				languageServerPath,
			}
			lspconfig.angularls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = angular_cmd,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = angular_cmd
				end,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {})
		end,
	},
}
