require("nvchad.configs.lspconfig").defaults()

local servers = {
	"html",
	"cssls",
	"vtsls",
	"vue_ls",
	"pyright",
	"rust_analyzer",
	"phpactor",
	"jdtls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
