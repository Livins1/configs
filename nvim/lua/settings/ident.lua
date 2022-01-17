vim.opt.list = true
vim.opt.listchars:append("eol:↴")
-- vim.g.indent_blankline_use_treesitter = true
-- vim.g.indent_blankline_show_first_ident_level = false

require("indent_blankline").setup {
    char = "|",
    use_treesitter = true,
    show_trailing_blankline_indent = true,
    show_first_indent_level = false,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
