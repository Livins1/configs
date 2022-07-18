require("options")
require("plugins")
require("keymap")
require("settings")

vim.lsp.set_log_level("info")

-- vim settings
-- augroup Shape autocmd! autocmd VimLeave * set guicursor=a:hor20 augroup END
vim.cmd([[
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

au VimLeave,VimSuspend * set guicursor=a:hor70-blinkon200
]])

