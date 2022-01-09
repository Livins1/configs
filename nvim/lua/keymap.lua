local map = vim.api.nvim_set_keymap
-- map the leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

local cmd = vim.cmd
local set_keymap = vim.api.nvim_set_keymap

cmd(":command! WQ wq")
cmd(":command! WQ wq")
cmd(":command! Wq wq")
cmd(":command! Wqa wqa")
cmd(":command! W w")
cmd(":command! Q q")

--  :Help
set_keymap("", "<F1>", "<Esc>", {})
set_keymap("i", "<F1>", "<Esc>", {})
--  Personal
set_keymap("", "H", "^", { noremap = true })
set_keymap("", "L", "$", { noremap = true })
set_keymap("n", ";", ":", { noremap = true })
set_keymap("n", "<leader>w", ":w<cr>", {})

set_keymap("n", "<C-j>", "<Esc>", { noremap = true })
set_keymap("i", "<C-j>", "<Esc>", { noremap = true })
set_keymap("v", "<C-j>", "<Esc>", { noremap = true })
set_keymap("s", "<C-j>", "<Esc>", { noremap = true })
set_keymap("x", "<C-j>", "<Esc>", { noremap = true })
set_keymap("c", "<C-j>", "<Esc>", { noremap = true })
set_keymap("o", "<C-j>", "<Esc>", { noremap = true })
set_keymap("l", "<C-j>", "<Esc>", { noremap = true })
set_keymap("t", "<C-j>", "<Esc>", { noremap = true })

set_keymap("n", "<C-k>", "<Esc>", { noremap = true })
set_keymap("i", "<C-k>", "<Esc>", { noremap = true })
set_keymap("v", "<C-k>", "<Esc>", { noremap = true })
set_keymap("s", "<C-k>", "<Esc>", { noremap = true })
set_keymap("x", "<C-k>", "<Esc>", { noremap = true })
set_keymap("c", "<C-c>", "<Esc>", { noremap = true })
set_keymap("o", "<C-k>", "<Esc>", { noremap = true })
set_keymap("l", "<C-k>", "<Esc>", { noremap = true })
set_keymap("t", "<C-k>", "<Esc>", { noremap = true })
--  Sop searching
set_keymap("n", "<C-h>", ":nohlsearch<cr>", { noremap = true })
--  Suspend
set_keymap("i", "<C-f>", ":sus<cr>", { noremap = true })
set_keymap("v", "<C-f>", ":sus<cr>", { noremap = true })
set_keymap("n", "<C-f>", ":sus<cr>", { noremap = true })
--  toggles between buffers
set_keymap("n", "<leader><leader>", "<c-^>", { noremap = true })
--  Quick close
set_keymap("n", "<C-q>", ":confirm qall<cr>", { noremap = true })
-- Telescope
set_keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { noremap = true })
set_keymap("n", "<leader>;", "<cmd>Telescope buffers<cr>", { noremap = true })
set_keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", { noremap = true })
set_keymap("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { noremap = true })
set_keymap("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = true })
-- set_keymap("n", "<leader>f", "<cmd>SymbolsOutline<cr>", { noremap = true })
set_keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.treesitter{}<cr>", { noremap = true })
-- Trouble
set_keymap("n", "<leader>t", "<cmd>TroubleToggle<cr>", { noremap = true })
-- Copy
set_keymap("n", "<C-c>", ':"+y<cr>', { noremap = true })
set_keymap("v", "<C-c>", ':"+y<cr>', { noremap = true })

-- Comments
vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<leader>.", "<Plug>kommentary_visual_default", {})

-- Format
set_keymap("n", "<A-f>", "<cmd>Format<cr>", { noremap = true })
set_keymap("i", "<A-f>", "<cmd>Format<cr><Esc>", { noremap = true })
