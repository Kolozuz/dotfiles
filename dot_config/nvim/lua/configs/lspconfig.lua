require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "vtsls", "vue_ls", "angularls", "pyright" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
