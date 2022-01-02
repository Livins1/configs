require("formatter").setup({
	logging = false,
	filetype = {
		css = {
			function()
				return {
					exe = "css-beautify",
					args = { "-", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
					stdin = true,
				}
			end,
		},
		scss = {
			function()
				return {
					exe = "css-beautify",
					args = { "-", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
					stdin = true,
				}
			end,
		},
	},
})
