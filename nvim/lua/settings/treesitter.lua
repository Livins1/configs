require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "java" },
	highlight = {
		enable = true,
		-- disable = {"rust"},
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
		disable = { "yaml", "python" },
	},
	autotag = {
		enable = true,
		filetypes = { "html", "xml", "vue", "javascript" , "javascriptreact", "jsx"},
	},
	autopairs = {
		enable = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["mf"] = "@function.outer",
				["mc"] = "@class.outer",
				["mb"] = "@block.outer",
			},
			goto_previous_start = {
				["mF"] = "@function.outer",
				["mC"] = "@class.outer",
			},
		},
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.xml = {
	install_info = {
		-- https://github.com/dorgnarg/tree-sitter-xml
		url = "/home/tfios/WorkSpace/NodeJs/tree-sitter-xml", -- local path or git repo
		files = { "src/parser.c" },
	},
	filetype = "xml", -- if filetype does not agrees with parser name
}
