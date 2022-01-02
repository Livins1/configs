local cmp = require("cmp")
-- local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function tab(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	elseif has_words_before() then
		cmp.complete()
	else
		fallback()
	end
end

local function shift_tab(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		fallback()
	end
end

cmp.setup({
	-- completion = { completeopt = "menu,menuone,noinsert" },
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			--[[ require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users. ]]
		end,
	},
	--[[ snippet = {
		expand = function(args)
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end
		end,
	}, ]]
	mapping = {
		["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- ["<Tab>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, noremap = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		-- { name = "luasnip" },
        { name = 'vsnip' },
		{ name = "buffer" },
		{ name = "path" },
	},
	experimental = {
		ghost_text = true,
	},
})

-- Enable completing paths in :
--[[ cmp.setup.cmdline('/', {
  mapping = {
	['<c-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<c-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Tab>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
  },
  sources = cmp.config.sources({
    { name = 'path' },
   -- { name = 'cmdline' },
  })
})
 ]]
