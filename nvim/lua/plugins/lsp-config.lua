return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd",  "pylyzer", "neocmake" },
			})
		end,
	},
	{ "regen100/cmake-language-server" },
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

			lspconfig.pylyzer.setup({
				capabilities = capabilities,
			})

			-- Dodaj konfigurację dla neocmakelsp
			lspconfig.neocmake.setup({
				cmd = { "neocmakelsp", "--stdio" },
				filetypes = { "cmake" },
				root_dir = function(fname)
					return lspconfig.util.find_git_ancestor(fname)
				end,
				single_file_support = true,
				capabilities = capabilities,
				on_attach = function(client, bufnr)


				end,
				init_options = {
					format = {
						enable = true
					},
					lint = {
						enable = true
					},
					scan_cmake_in_package = true
				}
			})

			-- Key mappings for LSP functions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

