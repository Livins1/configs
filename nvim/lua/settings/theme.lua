-- nordfox, palefox, dayfox, dawnfox and duskfox, nightfox.
-- require('nightfox').load("nightfox")
--
--
---- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- Tokyo night
-- vim.g.tokyonight_style  = "night"
vim.g.tokyonight_italic_functions = true
vim.cmd[[colorscheme tokyonight]]
