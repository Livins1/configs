require('lualine').setup{
    options = {
        -- Theme
        -- theme = "nightfox",
        theme = "tokyonight"
    },
    sections = {
        lualine_c = {function() return require('lsp-status').status() end}
    }

}
