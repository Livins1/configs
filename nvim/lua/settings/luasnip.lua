-- there is a serious bug. we cannot use luasnip at this time.
-- When i use gopls and luals, Tab to complete,  luasnip will effect the completion behavior a mess

local ls = require("luasnip")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    ext_base_prio = 270,
    ext_prio_increase = 1,
    enable_autosnippets = true,
})



require("luasnip.loaders.from_vscode").lazy_load({include={"javascript"}, paths={"./snippets/vscode"}})
