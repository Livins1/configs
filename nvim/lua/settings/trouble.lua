require('trouble').setup{
    icons = true, -- use dev-icons for filenames
    mode = "document_diagnostics", -- "workspace" or "document"
    action_keys = { -- key mappings for actions in the trouble list
        close = "q", -- close the list
        cancel = {"ć", "Ć"}, -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        toggle_mode = "m", -- toggle between "workspace" and "document" mode
        toggle_preview = "P", -- toggle auto_preview
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- up
        next = "j" -- down
    },
    indent_lines = false, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back
    auto_fold = false, -- automatically fold a file trouble list at creation
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}
