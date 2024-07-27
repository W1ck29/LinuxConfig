return {

	"jose-elias-alvarez/null-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.diagnostics.cpplint,
			},
		})
		vim.keymap.set("n", "<c-e>", vim.lsp.buf.format, {})
	end,
}
