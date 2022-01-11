local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local api = vim.api

local lspconfig = require("lspconfig")

-- local coq = require("coq")
local function create_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	return capabilities
end

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<A-f>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	buf_set_keymap("i", "<A-f>", "<cmd>lua vim.lsp.buf.formatting()<CR><Esc>", opts)

	-- Get signatures (and _only_ signatures) when in argument lists.
	--[[ require "lsp_signature".on_attach({
doc_lines = 0,
handler_opts = {
border = "none"
},
}) ]]
end

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
		exit_timeout = 0,
	},
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				runBuildScripts = true,
			},
			completion = {
				postfix = {
					enable = false,
				},
			},
		},
	},
})

-- Golang
require("lspconfig").gopls.setup({
	on_attach = on_attach,
	capabilities = create_capabilities(),
})
-- Python
-- require'lspconfig'.pylsp.setup(coq.lsp_ensure_capabilities({on_attach = on_attach}))
require("lspconfig").pylsp.setup({
	on_attach = on_attach,
	capabilities = create_capabilities(),
})

-- Vue
require("lspconfig").volar.setup({
	on_attach = on_attach,
	-- filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
	-- capabilities = create_capabilities(),
	init_options = {
		typescript = {
			serverPath = "/usr/lib/node_modules/typescript/lib/tsserverlibrary.js",
		},
	},
})

-- Json
-- npm i -g vscode-langservers-extracted
lspconfig.jsonls.setup({
	capabilities = create_capabilities(),
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
})

-- React
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = create_capabilities(),

	settings = {
		documentFormatting = true,
		javascript = {
			format = {
				tabSize = 2,
				indentSize = 2,
				baseIndentSize = 0,
				convertTabsToSpaces = true,
			},
		},
	},
	init_options = {
		javascript = {
			format = {
				baseIndentSize = 2,
			},
		},
	},
})

-- Css
lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = create_capabilities(),
	filetypes = { "css", "scss", "less" },
	--[[ commands = {
		Format = {
			function()
				return {
				}
			end,
		},
	}, ]]
})

-- Lua
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	-- capabilities = create_capabilities(),
	commands = {
		Format = {
			function()
				require("stylua-nvim").format_file()
			end,
		},
	},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			--[[ workspace = {
-- Make the server aware of Neovim runtime files
library = vim.api.nvim_get_runtime_file("", true),
}, ]]
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	virtual_text = false,
	signs = true,
	update_in_insert = false,
})
